--liquibase formatted sql
--changeset artemov_i:CORE-235 dbms:postgresql splitStatements:false stripComments:false
COMMENT ON COLUMN s_at.t_role_action.ck_id IS 'Идентификатор';
COMMENT ON COLUMN s_at.t_account_role.ck_id IS 'Идентификатор';

--changeset artemov_i:CORE-640 dbms:postgresql
CREATE TABLE s_at.t_create_patch (
	ck_id uuid NOT NULL,
	cv_file_name varchar(200) NOT NULL,
	ck_user varchar(100) NOT NULL,
	ct_change timestamptz NOT NULL,
	сj_param jsonb NOT NULL,
	cd_create date NOT NULL,
	cn_size bigint NULL,
	CONSTRAINT cin_p_create_patch PRIMARY KEY (ck_id)
);
COMMENT ON COLUMN s_at.t_create_patch.ck_id IS 'Идентификатор';
COMMENT ON COLUMN s_at.t_create_patch.cv_file_name IS 'Наименование файла';
COMMENT ON COLUMN s_at.t_create_patch.ck_user IS 'Аудит идентификатор пользователя';
COMMENT ON COLUMN s_at.t_create_patch.ct_change IS 'Аудит время модификации';
COMMENT ON COLUMN s_at.t_create_patch.сj_param IS 'Параметры запуска';
COMMENT ON COLUMN s_at.t_create_patch.cd_create IS 'Дата сборки';
COMMENT ON COLUMN s_at.t_create_patch.cn_size IS 'Размер сборки';

--changeset artemov_i:CORE-797_add_CONSTRAINT dbms:postgresql
ALTER TABLE s_at.t_account_info ADD CONSTRAINT cin_u_account_info_1 UNIQUE (ck_d_info,ck_account);

--changeset artemov_i:CORE-870_add_INDEX dbms:postgresql
CREATE UNIQUE INDEX cin_u_account_2 ON s_at.t_account (UPPER(cv_login));

--changeset artemov_i:CORE-225 dbms:postgresql
CREATE TRIGGER notify_account_event
AFTER INSERT OR UPDATE OR DELETE ON s_at.t_account
  FOR EACH ROW EXECUTE PROCEDURE notify_event();
CREATE TRIGGER notify_account_role_event
AFTER INSERT OR UPDATE OR DELETE ON s_at.t_account_role
  FOR EACH ROW EXECUTE PROCEDURE notify_event();
CREATE TRIGGER notify_account_info_event
AFTER INSERT OR UPDATE OR DELETE ON s_at.t_account_info
  FOR EACH ROW EXECUTE PROCEDURE notify_event();
CREATE TRIGGER notify_role_action_event
AFTER INSERT OR UPDATE OR DELETE ON s_at.t_role_action
  FOR EACH ROW EXECUTE PROCEDURE notify_event();

--changeset artemov_i:CORE-1035 dbms:postgresql
INSERT INTO s_at.t_action (ck_id,cv_name,cv_description,ck_user,ct_change)
	VALUES (99999,'Анонимный доступ','Анонимный доступ','4fd05ca9-3a9e-4d66-82df-886dfa082113','2020-03-04 19:15:11.069');
INSERT INTO s_at.t_role (ck_id,cv_name,cv_description,ck_user,ct_change)
	VALUES ('ea196953-643d-4666-9a0d-b37689837e2f','Анонимная роль','Анонимная роль','4fd05ca9-3a9e-4d66-82df-886dfa082113','2020-03-04 19:15:50.537');
INSERT INTO s_at.t_account (cv_surname,cv_name,cv_login,cv_hash_password,ck_id,ck_user,ct_change,cv_timezone,cv_salt)
	VALUES ('guest','guest','guest','b9758301d76ff9530b7d79e2f22c8f93a4b9fbb94130670c817e7689d322e3fd','61af10df-db13-4d15-a5a5-c3e6d7bc1362','4fd05ca9-3a9e-4d66-82df-886dfa082113','2020-03-04 19:16:41.112','+03:00','6d4a33d97a');
INSERT INTO s_at.t_role_action (ck_id,ck_action,ck_user,ct_change,ck_role)
	VALUES ('2a6b78e7-53a2-4b0d-b198-1f76f3e51d19',99999,'4fd05ca9-3a9e-4d66-82df-886dfa082113','2020-03-04 19:16:00.151','ea196953-643d-4666-9a0d-b37689837e2f');
INSERT INTO s_at.t_account_role (ck_id,ck_role,ck_user,ct_change,ck_account)
	VALUES ('14743621-3ddf-441a-ba67-d7089fe5425c','ea196953-643d-4666-9a0d-b37689837e2f','4fd05ca9-3a9e-4d66-82df-886dfa082113','2020-03-04 19:16:50.723','61af10df-db13-4d15-a5a5-c3e6d7bc1362');
