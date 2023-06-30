--liquibase formatted sql
--changeset patcher-core:MetaClass_D966BA30FBA3469FB5FEA82127B1ED6D dbms:postgresql runOnChange:true splitStatements:false stripComments:false
INSERT INTO s_mt.t_class(ck_id, cv_name, cv_description, cv_manual_documentation, cv_auto_documentation, cl_final, cl_dataset, ck_view, ck_user, ct_change) VALUES ('D966BA30FBA3469FB5FEA82127B1ED6D', 'Panel Road Map', 'Пошаговая панель', null, null, 1, 1, 'system', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-05-02T04:54:54.364+0000')  on conflict (ck_id) do update set cv_name = excluded.cv_name, cv_description = excluded.cv_description, cv_manual_documentation = excluded.cv_manual_documentation, cv_auto_documentation = excluded.cv_auto_documentation, cl_final = excluded.cl_final, cl_dataset = excluded.cl_dataset, ck_view = excluded.ck_view, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('43D9252D62014E20A57D17C97594DDCF', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'actiongate', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-06-30T15:21:46.067+0000', 0, 1)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('C4B1424E39EA4A1C954CBDEDDF662E6A', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'align', '["left", "right", "center"]', 'center', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-27T12:59:19.474+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('4E50E23DE3C2473A8B41011A689EEC1F', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'childs', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-09-20T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('D254203C07244AE2834EF373B251C2B8', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'disabled', null, 'false', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-02-01T09:14:09.102+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('E3596851FCB14DC2A56D1B0908F341BA', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'disabledrules', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-02-01T09:14:15.955+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('E104434EF2E54477ADB55C45CAAA9216', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'height', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-25T16:42:22.560+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('4AB1A29657A3448DB53C33176EE44167', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'hidden', null, 'false', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-02-01T09:13:54.453+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('91C1B134090D48CB8879295F5564B9AC', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'hiddenrules', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-02-01T09:14:01.238+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('AA11ACFE0EC149259833CCE30761ED5A', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'maxheight', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-25T16:42:27.908+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('6C667EE961594A13B2FAF334460695BF', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'maxwidth', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-25T16:42:46.945+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('1D658E7B346143238B751B36D2B63584', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'minheight', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-25T16:42:34.017+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('F39883DCB8C049C1986F8EFFA4659772', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'minwidth', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-25T16:42:52.760+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('BF273CB0E8AD49669E0FB4A996076FBD', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'readonly', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-02-01T09:14:24.639+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('2E85AF8227F9472CBE95EAEE1CDC6FDD', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'readonlyrules', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-02-01T09:14:30.513+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('58B7945DF88C4511944574FB76ECD261', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'tabwidth', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-12-18T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('D910BD59B2CE4895BE263B2FC12DA80D', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'topbtn', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-09-27T00:00:00.000+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('36F126CB28094C1EAB2C81153BCB10E4', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'type', null, 'ROADMAPPANEL', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-09-20T00:00:00.000+0000', 1, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
INSERT INTO s_mt.t_class_attr(ck_id, ck_class, ck_attr, cv_data_type_extra, cv_value, ck_user, ct_change, cl_required, cl_empty) VALUES ('86B72CB225564157AB7D828D179FA551', 'D966BA30FBA3469FB5FEA82127B1ED6D', 'width', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2023-03-25T16:42:40.091+0000', 0, 0)  on conflict on constraint cin_c_class_attr_1 do update set ck_class = excluded.ck_class, ck_attr = excluded.ck_attr, cv_data_type_extra = excluded.cv_data_type_extra, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_required = excluded.cl_required, cl_empty = excluded.cl_empty;
select pkg_patcher.p_clear_attr('D966BA30FBA3469FB5FEA82127B1ED6D'::varchar, '["actiongate","align","childs","disabled","disabledrules","height","hidden","hiddenrules","maxheight","maxwidth","minheight","minwidth","readonly","readonlyrules","tabwidth","topbtn","type","width"]'::jsonb);
