--liquibase formatted sql
--changeset artemov_i:MTAttrDataType dbms:postgresql runOnChange:true splitStatements:false stripComments:false
INSERT INTO s_mt.t_query (ck_id, cc_query, ck_provider, ck_user, ct_change, cr_type, cr_access, cn_action, cv_description) VALUES ('MTAttrDataType', '/*MTAttrDataType*/
select adt.ck_id,
       adt.cv_description,
       adt.cl_extra,
       /* Поля аудита */
       adt.ck_user,
       adt.ct_change at time zone :sess_cv_timezone as ct_change
 from s_mt.t_d_attr_data_type adt
where ( &FILTER )
 /*##filter.ck_id*/and adt.ck_id = :json::json#>>''{filter,ck_id}''/*filter.ck_id##*/
 /*##filter.ck_id_like*/and adt.ck_id like :json::json#>>''{filter,ck_id_like}'' || ''%''/*filter.ck_id_like##*/
order by &SORT
  ', 'meta', '20783', '2019-05-24 12:00:00.314025+03', 'select', 'po_session', NULL, 'Список типов атрибута')
on conflict (ck_id) do update set cc_query = excluded.cc_query, ck_provider = excluded.ck_provider, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cr_type = excluded.cr_type, cr_access = excluded.cr_access, cn_action = excluded.cn_action, cv_description = excluded.cv_description;

