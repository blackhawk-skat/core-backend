--liquibase formatted sql
--changeset patcher-core:MetaClass_9964E8D5F6C04D9F85AC78E6EFBD72F1 dbms:postgresql runOnChange:true splitStatements:false stripComments:false
INSERT INTO s_mt.t_class(ck_id, cv_name, cv_description, cv_manual_documentation, cv_auto_documentation, cl_final, cl_dataset, ck_view, ck_user, ct_change) VALUES ('9964E8D5F6C04D9F85AC78E6EFBD72F1', 'Field Repeater', 'Поле "Повторитель"', null, null, 0, 0, 'system', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-02-26T00:00:00.000+0000')  on conflict (ck_id) do update set cv_name = excluded.cv_name, cv_description = excluded.cv_description, cv_manual_documentation = excluded.cv_manual_documentation, cv_auto_documentation = excluded.cv_auto_documentation, cl_final = excluded.cl_final, cl_dataset = excluded.cl_dataset, ck_view = excluded.ck_view, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('E41BE6316C134A55A8E9C599D27CCC23', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'activerules', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-10T13:26:12.413+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('F4F0130AA4B94D5DAD45BE2F969582EF', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'align', null, 'stretch', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-12-26T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('4F0C103E377040179EF412F13E09D265', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'childs', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-12-16T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('BC0A91B7524444B8A203C6A7EBA1B623', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'column', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-12-16T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('0C5C9CB43CB2468E80A21ECED49C9D4E', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'contentview', null, 'hbox', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-12-26T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('B49B198763F54750B26A63C8BDD1AA11', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'datatype', null, 'repeater', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-12-16T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('0BD5A2A0FCD5412A93FDBB74DE5DFA4A', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'defaultvalue', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2021-02-24T12:22:31.363+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('ABAB9185468644E899B04B63F25B3C30', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'defaultvaluerule', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2021-02-11T16:03:44.964+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('0778DD2F4888442EA71273E278FAA9C0', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'getglobal', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2022-10-24T19:25:44.654+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('DA703C9FC24041918C624A98B3D5CA42', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'hidden', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-06-25T12:09:26.793+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('EE919A3716284D65A472B9D0E906345D', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'hiddenrules', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-06-25T12:09:32.186+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('9703F359DEC34DBE83EE86B15A424AD2', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'maxsize', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-12-17T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('5471EE7C20FD470D8D90D8A2D6858FE2', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'minsize', null, '1', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-02-20T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('AB7190B422F84976832BD39DA8667F61', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'readonly', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-02-01T09:06:22.123+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('2DAC455E57514FBAB8BAE31DF7C71807', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'readonlyrules', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-02-01T09:06:28.188+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('92FEA746F679454EA33534F968E8B1F8', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'setglobal', null, '[]', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2022-10-24T19:25:38.278+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('A2372FDB85AB4D228E5123336D911970', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'type', null, 'IFIELD', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-12-16T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('A95BD90169FF48A49D379E48A3F7E467', '9964E8D5F6C04D9F85AC78E6EFBD72F1', 'width', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2021-03-09T13:09:11.532+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
select pkg_patcher.p_clear_attr('9964E8D5F6C04D9F85AC78E6EFBD72F1'::varchar, '["activerules","align","childs","column","contentview","datatype","defaultvalue","defaultvaluerule","getglobal","hidden","hiddenrules","maxsize","minsize","readonly","readonlyrules","setglobal","type","width"]'::jsonb);
