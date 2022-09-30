--liquibase formatted sql
--changeset artemov_i:pkg_notification dbms:postgresql runOnChange:true splitStatements:false stripComments:false
DROP SCHEMA IF EXISTS pkg_notification cascade;

CREATE SCHEMA pkg_notification
    AUTHORIZATION ${user.update};


ALTER SCHEMA pkg_notification OWNER TO ${user.update};

CREATE FUNCTION pkg_notification.p_modify_notification(pv_action character varying, INOUT pot_notification s_mt.t_notification) RETURNS s_mt.t_notification
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'pkg_notification', 'public'
    AS $$
declare
   -- переменные пакета
  i sessvarstr;
  u sessvarstr;
  d sessvarstr;
  
  -- переменные функции
begin
  -- инициализация/получение переменных пакета
  i = sessvarstr_declare('pkg', 'i', 'I');
  u = sessvarstr_declare('pkg', 'u', 'U');
  d = sessvarstr_declare('pkg', 'd', 'D');

  -- код функции
  if pv_action = d::varchar then
    delete from s_mt.t_notification where ck_id = pot_notification.ck_id;
  else
    if pv_action = i::varchar then
      pot_notification.ck_id := sys_guid();
      if pot_notification.cd_st is null then
        pot_notification.cd_st := CURRENT_TIMESTAMP;
      end if;
      if pot_notification.cd_en is null then
        pot_notification.cd_en := CURRENT_TIMESTAMP + interval '1' day;
      end if;
      insert into s_mt.t_notification values (pot_notification.*);
    elsif pv_action = u::varchar then
      /* обновить возможно только cl_sent */
      update s_mt.t_notification 
        set cl_sent = pot_notification.cl_sent
      where ck_id = pot_notification.ck_id;
      if not found then 
        perform pkg.p_set_error(504);
      end if;
    end if;
  end if;
end;
$$;


ALTER FUNCTION pkg_notification.p_modify_notification(pv_action character varying, INOUT pot_notification s_mt.t_notification) OWNER TO ${user.update};

CREATE FUNCTION pkg_notification.p_lock_notification(pk_id character varying) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 's_mt', 'pkg_notification', 'public'
    AS $$
declare
  vn_lock bigint;
begin
  if pk_id is not null then
    select 1 into vn_lock from s_mt.t_notification where ck_id = pk_id for update nowait;
  end if;
end;
$$;


ALTER FUNCTION pkg_notification.p_lock_notification(pk_id character varying) OWNER TO ${user.update};