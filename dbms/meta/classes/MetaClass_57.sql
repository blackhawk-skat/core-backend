--liquibase formatted sql
--changeset patcher-core:MetaClass_57 dbms:postgresql runOnChange:true splitStatements:false stripComments:false
INSERT INTO s_mt.t_class(ck_id, cv_name, cv_description, cv_manual_documentation, cv_auto_documentation, cl_final, cl_dataset, ck_view, ck_user, ct_change) VALUES ('57', 'Column Action Icon', 'Колонка-кнопка с иконкой', null, null, 1, 1, 'system', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-25T11:54:44.221+0000')  on conflict (ck_id) do update set cv_name = excluded.cv_name, cv_description = excluded.cv_description, cv_manual_documentation = excluded.cv_manual_documentation, cv_auto_documentation = excluded.cv_auto_documentation, cl_final = excluded.cl_final, cl_dataset = excluded.cl_dataset, ck_view = excluded.ck_view, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('DE23446189A740148ABE7E86909A2672', '57', 'actiongate', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-06-30T15:21:46.067+0000', 0, 1)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('361142F52077441581DFF58B1EEA16BB', '57', 'autoload', null, 'true', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-25T12:04:45.403+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('B9125A4C91DB4F96AA0599162C63CA46', '57', 'autoloadrule', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-25T12:05:11.345+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('5A71798ADE90475B941C914EDF5E1339', '57', 'childs', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-25T11:54:02.424+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('1030', '57', 'ckwindow', null, null, '10020785', '2018-07-08T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('1B8D5C0729534253A80F606165987D38', '57', 'columnsfilter', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-09-18T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('1989', '57', 'confirmquestion', null, null, '10020785', '2018-07-08T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('350', '57', 'datatype', null, 'icon', '10020785', '2018-07-09T00:00:00.000+0000', 1, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('1262', '57', 'disabledrules', null, null, '10020785', '2018-07-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('354', '57', 'dynamicicon', null, 'false', '10020785', '2018-07-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('351', '57', 'editors', null, 'false', '10020785', '2018-07-09T00:00:00.000+0000', 1, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('1930', '57', 'extraplugingate', null, null, '10020785', '2018-08-27T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('A133A1F3F7F042BD9487816008FBFF4C', '57', 'getglobaltostore', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2021-11-18T14:18:51.181+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('15050AB7A3B943D1A52FDE475308C00D', '57', 'getmastervalue', null, '[{"in": "ck_id", "out": "ck_id"}]', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-01-13T00:00:00.000+0000', 1, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('560', '57', 'handler', null, null, '10020785', '2018-07-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('148FFCDCCD7E47659743B9FD74D46E9D', '57', 'hidden', null, 'false', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-22T11:10:52.153+0000', 1, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('1306', '57', 'hiddenrules', null, null, '10020785', '2018-07-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('353', '57', 'iconfont', null, null, '10020785', '2018-07-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('352', '57', 'iconfontname', null, 'fa', '10020785', '2018-07-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('1099523A16A04AB1A33BE39F4B770F7F', '57', 'idproperty', null, 'ck_id', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-25T12:07:22.711+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('E53B86AA9AE142FE934A7F0F7AEBC2AF', '57', 'maxwidth', null, '30px', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-02-27T14:56:15.222+0000', 0, 1)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('541EE172AE6440F5A346CD41C1D4769F', '57', 'minwidth', null, '30px', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-02-27T14:56:10.416+0000', 0, 1)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('591', '57', 'mode', null, null, '10020785', '2018-07-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('22171', '57', 'modeaction', null, null, '10020785', '2018-09-26T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('2078509D9EE74700B6B3468264CFE346', '57', 'records', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-25T12:04:20.130+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('0606926EACB84E7A83122156529E8C8E', '57', 'recordsrule', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-25T12:04:37.392+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('CBECCB68D2F24CDDA56F5989DA4C61DC', '57', 'redirecturl', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-09-18T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('DE1DC6BD5E234AE88EA4FA8B30655EDE', '57', 'redirectusequery', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-09-18T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('A8893B1DFC104B48AECA1320A737B2AB', '57', 'reqsel', null, 'false', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-25T12:06:50.599+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('BEECEB08C3864F75A9BC5428BB2B8978', '57', 'saverecordstoglobal', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-26T09:18:08.353+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('5DF6F94CA34B44979E7F43F39D76E4B8', '57', 'skipvalidation', null, 'false', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-08-13T08:04:22.727+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('17170', '57', 'timeout', null, null, '10020785', '2018-09-26T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('589', '57', 'tipmsg', null, null, '10020785', '2018-07-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('2D9B3213A46F44B68D40656B62F2AB0D', '57', 'type', null, 'COLUMN', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-27T14:55:13.227+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('592', '57', 'updatequery', null, null, '10020785', '2018-07-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('44428FF19E704D149A21178F21D461C3', '57', 'valuefield', null, '[]', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-08-03T14:47:56.414+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('437', '57', 'visible', null, 'true', '10020785', '2018-07-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('A9DE3D38654948A18CA5CBE01BF858A9', '57', 'visibleable', null, 'false', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-22T13:29:47.951+0000', 1, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('3F8F2E9352D045D58F1F94C185341874', '57', 'visiblerule', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-22T11:07:43.027+0000', 1, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('401CEFF7706E46F689F0E04FACE06AC6', '57', 'width', null, '30px', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-02-27T16:22:31.112+0000', 0, 1)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
select pkg_patcher.p_clear_attr('57'::varchar, '["actiongate","autoload","autoloadrule","childs","ckwindow","columnsfilter","confirmquestion","datatype","disabledrules","dynamicicon","editors","extraplugingate","getglobaltostore","getmastervalue","handler","hidden","hiddenrules","iconfont","iconfontname","idproperty","maxwidth","minwidth","mode","modeaction","records","recordsrule","redirecturl","redirectusequery","reqsel","saverecordstoglobal","skipvalidation","timeout","tipmsg","type","updatequery","valuefield","visible","visibleable","visiblerule","width"]'::jsonb);
