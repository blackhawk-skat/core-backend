--liquibase formatted sql
--changeset patcher-core:MetaClass_47AC6CC616C3493E923FAD5E79B28166 dbms:postgresql runOnChange:true splitStatements:false stripComments:false
INSERT INTO s_mt.t_class(ck_id, cv_name, cv_description, cv_manual_documentation, cv_auto_documentation, cl_final, cl_dataset, ck_view, ck_user, ct_change) VALUES ('47AC6CC616C3493E923FAD5E79B28166', 'Field Markdown', 'Поле "Markdown"', null, null, 0, 0, 'system', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000')  on conflict (ck_id) do update set cv_name = excluded.cv_name, cv_description = excluded.cv_description, cv_manual_documentation = excluded.cv_manual_documentation, cv_auto_documentation = excluded.cv_auto_documentation, cl_final = excluded.cl_final, cl_dataset = excluded.cl_dataset, ck_view = excluded.ck_view, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('BBD0BBD8C3544F748885F964614D0C18', '47AC6CC616C3493E923FAD5E79B28166', 'column', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('492989E2DC86446CA23BF450ADA68899', '47AC6CC616C3493E923FAD5E79B28166', 'datatype', null, 'markdown', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('F0AADDD2539D426F831BC557FDDCC247', '47AC6CC616C3493E923FAD5E79B28166', 'defaultvalue', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('DD437D4AEF5C44E7BD24150C432F948D', '47AC6CC616C3493E923FAD5E79B28166', 'defaultvaluelocalization', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-10-28T12:24:03.549+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('CD4DCB36F0374E8694D1007648F06017', '47AC6CC616C3493E923FAD5E79B28166', 'defaultvaluerule', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2021-02-11T16:03:44.964+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('619F763574084B6AAA308F4814FD7756', '47AC6CC616C3493E923FAD5E79B28166', 'disabled', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('105F0471B8A44443AC4F7F7E78B43777', '47AC6CC616C3493E923FAD5E79B28166', 'disabledrules', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('E1AE92E79B114D6EBDA48C6D5654D54A', '47AC6CC616C3493E923FAD5E79B28166', 'editmode', null, 'all', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('DF27835437E6455FA2827EE6884D6D1B', '47AC6CC616C3493E923FAD5E79B28166', 'getglobal', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('E24F9D64ADB24BAF9A9180E663899932', '47AC6CC616C3493E923FAD5E79B28166', 'hidden', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('2E07071E25CD464EAF98B2E34AD225FA', '47AC6CC616C3493E923FAD5E79B28166', 'hiddenrules', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('AE46DC13D2054B9CBA462761E9491298', '47AC6CC616C3493E923FAD5E79B28166', 'maxheight', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('89E907782BBE41BCA7443E9D34BFA745', '47AC6CC616C3493E923FAD5E79B28166', 'maxsize', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('93EA121D1A134A76B306BD903EB970C5', '47AC6CC616C3493E923FAD5E79B28166', 'minheight', null, '35px', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('D3FE540EFD13479EBE1BD96B95714EC5', '47AC6CC616C3493E923FAD5E79B28166', 'readonly', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-02-01T09:04:56.357+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('6ACFA6F10D99485396F27064F36535DD', '47AC6CC616C3493E923FAD5E79B28166', 'readonlyrules', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-02-01T09:05:02.529+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('C6D59003EE6F413C8C5EFAF4AB1CD5F9', '47AC6CC616C3493E923FAD5E79B28166', 'reqsel', null, 'false', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('D81FC047C95F46A5B28D6D1C122C668E', '47AC6CC616C3493E923FAD5E79B28166', 'required', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('9888EB47720D43849116E099BCA16261', '47AC6CC616C3493E923FAD5E79B28166', 'requiredrules', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('040E57628E8C4F78A41DE3F78699CAE0', '47AC6CC616C3493E923FAD5E79B28166', 'setglobal', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('D14A4FC3A6104AF2BE5D284CDD7C799B', '47AC6CC616C3493E923FAD5E79B28166', 'type', null, 'IFIELD', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('9A3F049D8BF04FA6847947B5A59BC14C', '47AC6CC616C3493E923FAD5E79B28166', 'width', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2020-04-09T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
select pkg_patcher.p_clear_attr('47AC6CC616C3493E923FAD5E79B28166'::varchar, '["column","datatype","defaultvalue","defaultvaluelocalization","defaultvaluerule","disabled","disabledrules","editmode","getglobal","hidden","hiddenrules","maxheight","maxsize","minheight","readonly","readonlyrules","reqsel","required","requiredrules","setglobal","type","width"]'::jsonb);
