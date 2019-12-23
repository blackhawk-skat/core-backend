--liquibase formatted sql
--changeset patcher-core:Page_22D2F53FE7E24680917B85D9A95237BD dbms:postgresql runOnChange:true splitStatements:false stripComments:false
select pkg_patcher.p_remove_page('22D2F53FE7E24680917B85D9A95237BD');

INSERT INTO s_mt.t_page (ck_id, ck_parent, cr_type, cv_name, cn_order, cl_static, cv_url, ck_icon, ck_user, ct_change, cl_menu)VALUES('22D2F53FE7E24680917B85D9A95237BD', '4', 2, 'b772c278f9344ef4bee1d2e168cae8da', 30, 0, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000', 0) on conflict (ck_id) do update set ck_parent = excluded.ck_parent, cr_type = excluded.cr_type, cv_name = excluded.cv_name, cn_order = excluded.cn_order, cl_static = excluded.cl_static, cv_url = excluded.cv_url, ck_icon = excluded.ck_icon, ck_user = excluded.ck_user, ct_change = excluded.ct_change, cl_menu = excluded.cl_menu;
INSERT INTO s_mt.t_page_action (ck_id, ck_page, cr_type, cn_action, ck_user, ct_change)VALUES('03D13AE9BFB246BDBEE51B751803AF9D', '22D2F53FE7E24680917B85D9A95237BD', 'edit', 516, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000') on conflict (ck_id) do update set ck_page = excluded.ck_page, cr_type = excluded.cr_type, cn_action = excluded.cn_action, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_action (ck_id, ck_page, cr_type, cn_action, ck_user, ct_change)VALUES('225EAF0C545E4627AB877832D75508AF', '22D2F53FE7E24680917B85D9A95237BD', 'view', 515, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000') on conflict (ck_id) do update set ck_page = excluded.ck_page, cr_type = excluded.cr_type, cn_action = excluded.cn_action, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_variable (ck_id, ck_page, cv_name, cv_description, ck_user, ct_change)VALUES('B088A6328B1B45CB9C039D8701299B22', '22D2F53FE7E24680917B85D9A95237BD', 'gSysFrontAppVersion', 'Версия приложения', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-23T00:00:00.000+0000') on conflict (ck_id) do update set ck_page = excluded.ck_page, cv_name = excluded.cv_name, cv_description = excluded.cv_description, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_variable (ck_id, ck_page, cv_name, cv_description, ck_user, ct_change)VALUES('4DEF01BA27D64974ABA3CB3E8FD6B8BE', '22D2F53FE7E24680917B85D9A95237BD', 'gSysNoReadSnack', 'Снак глобал', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000') on conflict (ck_id) do update set ck_page = excluded.ck_page, cv_name = excluded.cv_name, cv_description = excluded.cv_description, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
select pkg_patcher.p_merge_object('94E486331F324BBC9495ACEDD9002A1B', '1EE230968D8648419A9FEF0AAF7390E7', null, 'SYS Applications - Pages', 1004000, 'MTRoute', 'Приложение - pages', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000');
select pkg_patcher.p_merge_object('03669E62AAED445F870D7F643D3BF7AE', '1807D17438814B31B75A279C4CBC6C0C', '94E486331F324BBC9495ACEDD9002A1B', 'App Bar Panel', 10, null, 'Панель для навигациии', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000');
select pkg_patcher.p_merge_object('3D83EAE658204E3BAABFF7B287819156', 'C3F1A4DE593B40FD81079A422C16070D', '94E486331F324BBC9495ACEDD9002A1B', 'Pages', 20, null, 'Список отображаемых страниц', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-30T00:00:00.000+0000');
select pkg_patcher.p_merge_object('E900506D12B84B59BBCCD2D2DB73635B', 'DF451F5CC0A54F8791C4DFAC12DAE42E', '94E486331F324BBC9495ACEDD9002A1B', 'Drawer Menu', 110, null, 'Drawer для меню', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-17T00:00:00.000+0000');
select pkg_patcher.p_merge_object('56CCF799C987470FB333A6FDB00C288A', 'DF451F5CC0A54F8791C4DFAC12DAE42E', '94E486331F324BBC9495ACEDD9002A1B', 'Drawer Notification', 120, null, 'Оповещения', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-17T00:00:00.000+0000');
select pkg_patcher.p_merge_object('A7BB08AC747549C9B5EDC9C539AC16FF', 'DF451F5CC0A54F8791C4DFAC12DAE42E', '94E486331F324BBC9495ACEDD9002A1B', 'Favorite Pages', 130, null, 'Избранные страницы', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-23T00:00:00.000+0000');
select pkg_patcher.p_merge_object('DFB76FB13899446BAEBEBB04512C37EE', '32', '94E486331F324BBC9495ACEDD9002A1B', 'Window About', 140, null, 'О программе', '6cf398ee03df42529323bd4ff9f584d5', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-24T00:00:00.000+0000');
select pkg_patcher.p_merge_object('657939F173D74C82AD9AD159CF546320', 'DF451F5CC0A54F8791C4DFAC12DAE42E', '94E486331F324BBC9495ACEDD9002A1B', 'Drawer Profile', 150, null, 'Drawer профиля', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-24T00:00:00.000+0000');
select pkg_patcher.p_merge_object('CB8B58540BD24901BB46F7AB56D74482', 'C0D39ADC290C40B3AF7AB27171051C9F', 'A7BB08AC747549C9B5EDC9C539AC16FF', 'Favorite Pages', 1, null, 'Избранные страницы', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-23T00:00:00.000+0000');
select pkg_patcher.p_merge_object('4C7CB2419FE84553BB26E7BEC59FF891', 'C12028B0A13B4AE28E63CBB90F3428E1', '56CCF799C987470FB333A6FDB00C288A', 'Notification', 1, null, 'Оповещения', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000');
select pkg_patcher.p_merge_object('2CCCAB777F9B478395E40B5FCDA640C0', '39AB8EAF9DCD456197944E6B6321989D', 'E900506D12B84B59BBCCD2D2DB73635B', 'Pages Tree', 1, null, 'Дерево страниц', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-23T00:00:00.000+0000');
select pkg_patcher.p_merge_object('21E07CAB7DFB48C08A912023C44A6A1F', '26', 'DFB76FB13899446BAEBEBB04512C37EE', 'App Version', 10, null, 'App Version', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-23T00:00:00.000+0000');
select pkg_patcher.p_merge_object('E8C504D19189419CA6C62B0E41D84780', '871CB755C589248AE053809BA8C0F31E', '657939F173D74C82AD9AD159CF546320', 'Form Profile', 10, null, 'Основная форма профиля', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-24T00:00:00.000+0000');
select pkg_patcher.p_merge_object('377ED25E244A4FE9B2DD4398FCD86549', '19', 'DFB76FB13899446BAEBEBB04512C37EE', 'Close Silent', 30, null, 'Close Silent', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-23T00:00:00.000+0000');
select pkg_patcher.p_merge_object('8D9279245C364B3995587FC85C13B8CB', '858DBC49DF354ECCA2F57F36DAF4E37A', '657939F173D74C82AD9AD159CF546320', 'Pager Menu Profile', 40, 'GetMetamodelPage', 'Pager Menu Profile', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-30T00:00:00.000+0000');
select pkg_patcher.p_merge_object('313E882AFAB2483596F876F0885A25D3', 'BA125F895507411E8730C07D3AD26A3A', '657939F173D74C82AD9AD159CF546320', 'Btn Bar', 100, null, 'Бар с кнопками', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-12-13T00:00:00.000+0000');
select pkg_patcher.p_merge_object('9B040EDC793248AEB0781362E344FAFF', 'DB557A6113634FD2BC40D2A58EE1EB3F', '03669E62AAED445F870D7F643D3BF7AE', 'Button Group Left', 1010, null, 'Секция кнопок слева', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-30T00:00:00.000+0000');
select pkg_patcher.p_merge_object('F059305E6B164D50B275F87A55547564', '16CD1F9A0789445AA23AC20DA565BFCC', '03669E62AAED445F870D7F643D3BF7AE', 'Open Page Tabs', 1030, null, 'Вкладки открытых страниц', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-30T00:00:00.000+0000');
select pkg_patcher.p_merge_object('0311C12DCA0F48F6A1A7457243DC0A22', 'DB557A6113634FD2BC40D2A58EE1EB3F', '03669E62AAED445F870D7F643D3BF7AE', 'Button Group Right', 1040, null, 'Секция кнопок справа', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-30T00:00:00.000+0000');
select pkg_patcher.p_merge_object('86DE34B2847E454580F3A8788A67FCED', '19', '313E882AFAB2483596F876F0885A25D3', 'BTN Logout', 1, null, 'Выход', '8c0119ba23c74e158c5d50c83884fcb5', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-12-13T00:00:00.000+0000');
select pkg_patcher.p_merge_object('3A88723253BB48568C00E40E6F41D4C7', '9CC06E8D9D7E4791BA1C6232DAF60CDD', '0311C12DCA0F48F6A1A7457243DC0A22', 'Badge', 5, null, 'Badge', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000');
select pkg_patcher.p_merge_object('1671E9323E6B4360B4BBC6C9F71A28C5', '19', '9B040EDC793248AEB0781362E344FAFF', 'Button Favorite', 10, null, 'Открытие закладок', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-17T00:00:00.000+0000');
select pkg_patcher.p_merge_object('7FA517E4996741638F0DF0BC9B9DCB3A', '19', '0311C12DCA0F48F6A1A7457243DC0A22', 'Button Profile', 10, null, 'Профиль', 'e571d8599bc8466aac42ade8b1891e44', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-30T00:00:00.000+0000');
select pkg_patcher.p_merge_object('AC3FAE070F6A4ADAA0AD7093406CAB40', '19', '0311C12DCA0F48F6A1A7457243DC0A22', 'Button About', 15, null, 'О программе', '6cf398ee03df42529323bd4ff9f584d5', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-30T00:00:00.000+0000');
select pkg_patcher.p_merge_object('A185D67C726B4F94B2BE8B7498C77007', '19', '9B040EDC793248AEB0781362E344FAFF', 'Button Menu', 20, null, 'Открытие меню', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-17T00:00:00.000+0000');
select pkg_patcher.p_merge_object('7E3B065247B543A9B1C4D788C2E3901C', '2BB74480D7E2455B97AED5B3A070FE35', 'E8C504D19189419CA6C62B0E41D84780', 'Theme Combo', 1000, null, 'Выбор тем', null, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-24T00:00:00.000+0000');
select pkg_patcher.p_merge_object('BA17F793927F4BE2B347B7D47C2291B5', '19', '3A88723253BB48568C00E40E6F41D4C7', 'Button Notification', 1, null, 'Оповещение', '2ff612aa52314ddea65a5d303c867eb8', null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('2D95BBF36C7B4BECA42DD1E168C8A882', 'BA17F793927F4BE2B347B7D47C2291B5', '1033', 'notification', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('56F81DCB74F34A3FA6B2F889760AD4B1', '86DE34B2847E454580F3A8788A67FCED', '140', 'onLogout', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-12-13T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('7AF78B2FDEE64CF3ADE073AFCACE5E79', 'BA17F793927F4BE2B347B7D47C2291B5', '140', 'onWindowOpen', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('012F640055964A5A8330CFD8B35EEA9E', 'BA17F793927F4BE2B347B7D47C2291B5', '1695', 'true', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('F88AB51C736949D48951A7BF654A42AF', 'BA17F793927F4BE2B347B7D47C2291B5', '992', 'bell', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('A9E03F4372A947EDACD27925F340C599', '7FA517E4996741638F0DF0BC9B9DCB3A', '1033', 'profile', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('CA1B7E260A7E47D78C6934FBFEFA5234', '1671E9323E6B4360B4BBC6C9F71A28C5', '1033', 'favorite', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-23T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('EDB18A8626DE448B82862A5A53B51F5F', '1671E9323E6B4360B4BBC6C9F71A28C5', '140', 'onWindowOpen', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-23T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('06574A0568714E5BA84F14D456AE421F', '7FA517E4996741638F0DF0BC9B9DCB3A', '140', 'onWindowOpen', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('CFA81289F3CA4D35877FCA2A47C7E3F8', '1671E9323E6B4360B4BBC6C9F71A28C5', '1695', 'true', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-17T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('A752F44D4F4942D9923CD44ABB152483', '03669E62AAED445F870D7F643D3BF7AE', '5F01393A5D014FF3A017C1D3F840D8E2', '45', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-18T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('1C0AC3A18DD5450EB1C1D5C76FF4A87E', '21E07CAB7DFB48C08A912023C44A6A1F', '899', 'true', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-23T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('6B9C2FE743444619A088F2250A7F087F', '1671E9323E6B4360B4BBC6C9F71A28C5', '992', 'star', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-17T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('7ECAFC530C7A457B829841A5F91F6FB3', '7FA517E4996741638F0DF0BC9B9DCB3A', '992', 'user', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('0B1FED7FEE3A477E86AB20B6C8BE5EFF', 'AC3FAE070F6A4ADAA0AD7093406CAB40', '1033', 'about', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('8B35703216BA4AC1A1313062F819E2CC', 'AC3FAE070F6A4ADAA0AD7093406CAB40', '140', 'onWindowOpen', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('2313E2F3487A4F859C0E23B834C329A3', 'AC3FAE070F6A4ADAA0AD7093406CAB40', '992', 'info-circle ', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('8270B434912A46B08016C9952DE4A688', 'A185D67C726B4F94B2BE8B7498C77007', '1033', 'menu', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-17T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('6DFF69C169C94638A258A861D0FF018F', 'A185D67C726B4F94B2BE8B7498C77007', '1695', 'true', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-17T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('6A07DC5F38D34CC7AD20FAE091856B84', 'A185D67C726B4F94B2BE8B7498C77007', '992', 'bars', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-17T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('212CE74677EB46D184434A616CCFADDE', '377ED25E244A4FE9B2DD4398FCD86549', '140', 'onCloseWindowSilent', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-23T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('7827BCDF19D745D59977A82446109BE0', '377ED25E244A4FE9B2DD4398FCD86549', '154', 'true', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-23T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('28C90B6B0C534FC69184B259F36CF93C', '8D9279245C364B3995587FC85C13B8CB', '5D452C8FE6BA470BAE3CB39A7E037524', '1875398035771', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-30T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('145DB32C5C0A4D3DBFD1BCA643E28C90', '313E882AFAB2483596F876F0885A25D3', '5701E05269AD4814AA89830500C9FB41', 'right', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-12-13T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('E7B3A00867624BE9AF18CE3E25DE9F61', 'E900506D12B84B59BBCCD2D2DB73635B', '8FFBC8F0C42E4CC2A108DE0AABD1A5A3', '20%', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-23T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('303F41F92F0F4F86A0189FEA313D1A10', 'E900506D12B84B59BBCCD2D2DB73635B', 'EC07783AE2E8459EBE2E6772E439D782', 'menu', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-17T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('0CEB9D832C5441C8A962AD062E78A2AF', '56CCF799C987470FB333A6FDB00C288A', 'EC07783AE2E8459EBE2E6772E439D782', 'notification', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-17T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('054E81A93ABC498A8F2DE7FC92E44E7E', '56CCF799C987470FB333A6FDB00C288A', 'FF9AC3D8E746481687532056DAB095AB', 'right', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-17T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('77F7FF3C64BA4248A65D91A1FD3BBDA4', 'A7BB08AC747549C9B5EDC9C539AC16FF', '8FFBC8F0C42E4CC2A108DE0AABD1A5A3', '20%', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-23T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('A1C8A59FDBF243F0855101CF2DC41F9F', 'A7BB08AC747549C9B5EDC9C539AC16FF', 'EC07783AE2E8459EBE2E6772E439D782', 'favorite', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-23T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('C68BE222320A4100B4D384297DC32414', 'DFB76FB13899446BAEBEBB04512C37EE', '1029', 'about', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-23T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('18F12323840A46A698DE4C6E0E66A85A', '657939F173D74C82AD9AD159CF546320', '6145FC24CDCD49EE97C24B1A7AF17C19', '450', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-24T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('1EC2B7B2E91E467ABF62E5CA97A2082C', '657939F173D74C82AD9AD159CF546320', '8FFBC8F0C42E4CC2A108DE0AABD1A5A3', '20%', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-24T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('77746C95661E4A448580659ED8621628', '657939F173D74C82AD9AD159CF546320', 'EC07783AE2E8459EBE2E6772E439D782', 'profile', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-24T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('D3E95BBD077B41A79CD4CF373FC123A1', '657939F173D74C82AD9AD159CF546320', 'FF9AC3D8E746481687532056DAB095AB', 'right', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-24T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('BC45A50FEC8848458B8E6360835BECEF', '9B040EDC793248AEB0781362E344FAFF', '6AC299E9D222440A83B2E721571B9A77', 'true', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-22T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('4630570B2C0346E3A9DBD56FEB31A2CD', 'F059305E6B164D50B275F87A55547564', '2BE24312010A4711AF1DE65E17E5A3BD', '100%', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000');
select pkg_patcher.p_merge_object_attr('4C37F9ADAB3C410FAD80BAF705D624C9', '0311C12DCA0F48F6A1A7457243DC0A22', '6AC299E9D222440A83B2E721571B9A77', 'true', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000');
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('ADC7E2454785472293F04B208BEA9DBE', '22D2F53FE7E24680917B85D9A95237BD', '94E486331F324BBC9495ACEDD9002A1B', 10, null, null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('F61EA9DFF9F8454B98EF2029ED1250EA', '22D2F53FE7E24680917B85D9A95237BD', '03669E62AAED445F870D7F643D3BF7AE', 10, 'ADC7E2454785472293F04B208BEA9DBE', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('C11CF0A59505462AB69F345F6A26A913', '22D2F53FE7E24680917B85D9A95237BD', '3D83EAE658204E3BAABFF7B287819156', 20, 'ADC7E2454785472293F04B208BEA9DBE', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('33315406A3D041D1B19E443FC6FA319F', '22D2F53FE7E24680917B85D9A95237BD', 'E900506D12B84B59BBCCD2D2DB73635B', 110, 'ADC7E2454785472293F04B208BEA9DBE', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('EA320B3CF38D4C6CA745EE78D1882496', '22D2F53FE7E24680917B85D9A95237BD', '56CCF799C987470FB333A6FDB00C288A', 120, 'ADC7E2454785472293F04B208BEA9DBE', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('F60477C1871549B7937A730011EF0F2F', '22D2F53FE7E24680917B85D9A95237BD', 'A7BB08AC747549C9B5EDC9C539AC16FF', 130, 'ADC7E2454785472293F04B208BEA9DBE', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('596C14F70861418AA10258FFE07AEB7E', '22D2F53FE7E24680917B85D9A95237BD', 'DFB76FB13899446BAEBEBB04512C37EE', 140, 'ADC7E2454785472293F04B208BEA9DBE', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('09A8D78C4C2C40CA85C8FF18D2EAD23A', '22D2F53FE7E24680917B85D9A95237BD', '657939F173D74C82AD9AD159CF546320', 150, 'ADC7E2454785472293F04B208BEA9DBE', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('AB938D15F36B49B094EAE11C2A1E8DF1', '22D2F53FE7E24680917B85D9A95237BD', 'CB8B58540BD24901BB46F7AB56D74482', 1, 'F60477C1871549B7937A730011EF0F2F', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('4B9DA058E2424A7A8537C1A0E94AA196', '22D2F53FE7E24680917B85D9A95237BD', '4C7CB2419FE84553BB26E7BEC59FF891', 1, 'EA320B3CF38D4C6CA745EE78D1882496', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('880D92AB134D4418B8D11647F1B2713E', '22D2F53FE7E24680917B85D9A95237BD', '2CCCAB777F9B478395E40B5FCDA640C0', 1, '33315406A3D041D1B19E443FC6FA319F', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('6E01CF6DE3D04A9F9485F14055F353AD', '22D2F53FE7E24680917B85D9A95237BD', '21E07CAB7DFB48C08A912023C44A6A1F', 10, '596C14F70861418AA10258FFE07AEB7E', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('A7BD2C7A78A04BA4872AF56496AACE2F', '22D2F53FE7E24680917B85D9A95237BD', 'E8C504D19189419CA6C62B0E41D84780', 10, '09A8D78C4C2C40CA85C8FF18D2EAD23A', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('729F21A02A1B4681BAAA6998AA146E93', '22D2F53FE7E24680917B85D9A95237BD', '377ED25E244A4FE9B2DD4398FCD86549', 30, '596C14F70861418AA10258FFE07AEB7E', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('89C8A7A13E5B40E393AE607B22E56753', '22D2F53FE7E24680917B85D9A95237BD', '8D9279245C364B3995587FC85C13B8CB', 40, '09A8D78C4C2C40CA85C8FF18D2EAD23A', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('DA0F639D185C47C3959BCD12402BA300', '22D2F53FE7E24680917B85D9A95237BD', '313E882AFAB2483596F876F0885A25D3', 100, '09A8D78C4C2C40CA85C8FF18D2EAD23A', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('32454DBF8E2F43538A9F2F1CBC300921', '22D2F53FE7E24680917B85D9A95237BD', '9B040EDC793248AEB0781362E344FAFF', 1010, 'F61EA9DFF9F8454B98EF2029ED1250EA', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('A02DD6C626374282A67577632C22DD47', '22D2F53FE7E24680917B85D9A95237BD', 'F059305E6B164D50B275F87A55547564', 1030, 'F61EA9DFF9F8454B98EF2029ED1250EA', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('A77E2741428048E8B45A004D7269ED31', '22D2F53FE7E24680917B85D9A95237BD', '0311C12DCA0F48F6A1A7457243DC0A22', 1040, 'F61EA9DFF9F8454B98EF2029ED1250EA', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('A2D0FECC93164C2DA8C5F00FD05DE7B4', '22D2F53FE7E24680917B85D9A95237BD', '86DE34B2847E454580F3A8788A67FCED', 1, 'DA0F639D185C47C3959BCD12402BA300', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-12-13T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('ED62A51D3FF14E329F9EDA1249276181', '22D2F53FE7E24680917B85D9A95237BD', '3A88723253BB48568C00E40E6F41D4C7', 5, 'A77E2741428048E8B45A004D7269ED31', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('04FE0CA660454A55B9C10280B539D5C1', '22D2F53FE7E24680917B85D9A95237BD', '1671E9323E6B4360B4BBC6C9F71A28C5', 10, '32454DBF8E2F43538A9F2F1CBC300921', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('EF1B6FF79B8F4343A96EE36A09611226', '22D2F53FE7E24680917B85D9A95237BD', '7FA517E4996741638F0DF0BC9B9DCB3A', 10, 'A77E2741428048E8B45A004D7269ED31', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('552CA1ADCD6B4F7EB7BF99D5F90760DC', '22D2F53FE7E24680917B85D9A95237BD', 'AC3FAE070F6A4ADAA0AD7093406CAB40', 15, 'A77E2741428048E8B45A004D7269ED31', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('92B70F9A0EBC4543BD56392362750819', '22D2F53FE7E24680917B85D9A95237BD', 'A185D67C726B4F94B2BE8B7498C77007', 20, '32454DBF8E2F43538A9F2F1CBC300921', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('186C3640B02E447F879AB4DA2501DE81', '22D2F53FE7E24680917B85D9A95237BD', '7E3B065247B543A9B1C4D788C2E3901C', 1000, 'A7BD2C7A78A04BA4872AF56496AACE2F', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object (ck_id, ck_page, ck_object, cn_order, ck_parent, ck_master, ck_user, ct_change) VALUES ('2078B6A36279465FB8EFF63417E1EB6A', '22D2F53FE7E24680917B85D9A95237BD', 'BA17F793927F4BE2B347B7D47C2291B5', 1, 'ED62A51D3FF14E329F9EDA1249276181', null, '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  on conflict (ck_id) do update set ck_page = excluded.ck_page, ck_object = excluded.ck_object, cn_order = excluded.cn_order, ck_parent = excluded.ck_parent, ck_master = excluded.ck_master, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object_attr (ck_id, ck_page_object, ck_class_attr, cv_value, ck_user, ct_change) VALUES ('4531D98B3C854064B4BB3C31169DE067', 'ADC7E2454785472293F04B208BEA9DBE', 'B4952B6F8DA34BEFB04D244268B674F1', 'cv_url === "pages"', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-15T00:00:00.000+0000')  ON CONFLICT ON CONSTRAINT cin_c_page_object_attr_1 do update set ck_id=excluded.ck_id, ck_page_object = excluded.ck_page_object, ck_class_attr = excluded.ck_class_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object_attr (ck_id, ck_page_object, ck_class_attr, cv_value, ck_user, ct_change) VALUES ('F308364BBB944153901BFECEC9458C10', '6E01CF6DE3D04A9F9485F14055F353AD', '1160', 'gSysFrontAppVersion', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-23T00:00:00.000+0000')  ON CONFLICT ON CONSTRAINT cin_c_page_object_attr_1 do update set ck_id=excluded.ck_id, ck_page_object = excluded.ck_page_object, ck_class_attr = excluded.ck_class_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object_attr (ck_id, ck_page_object, ck_class_attr, cv_value, ck_user, ct_change) VALUES ('EDECC0481134474E99C7BD16E231A326', 'ED62A51D3FF14E329F9EDA1249276181', 'A22F69E60D274EC4B1B97617940B6E1D', 'gSysNoReadSnack', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-21T00:00:00.000+0000')  ON CONFLICT ON CONSTRAINT cin_c_page_object_attr_1 do update set ck_id=excluded.ck_id, ck_page_object = excluded.ck_page_object, ck_class_attr = excluded.ck_class_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
INSERT INTO s_mt.t_page_object_attr (ck_id, ck_page_object, ck_class_attr, cv_value, ck_user, ct_change) VALUES ('432DF0A46EA944F2BA17FB0D23DF33FF', '92B70F9A0EBC4543BD56392362750819', '140', 'onWindowOpen', '4fd05ca9-3a9e-4d66-82df-886dfa082113', '2019-10-17T00:00:00.000+0000')  ON CONFLICT ON CONSTRAINT cin_c_page_object_attr_1 do update set ck_id=excluded.ck_id, ck_page_object = excluded.ck_page_object, ck_class_attr = excluded.ck_class_attr, cv_value = excluded.cv_value, ck_user = excluded.ck_user, ct_change = excluded.ct_change;
update s_mt.t_page_object set ck_master='ADC7E2454785472293F04B208BEA9DBE' where ck_id='2078B6A36279465FB8EFF63417E1EB6A';
update s_mt.t_page_object set ck_master='ADC7E2454785472293F04B208BEA9DBE' where ck_id='A2D0FECC93164C2DA8C5F00FD05DE7B4';
update s_mt.t_page_object set ck_master='ADC7E2454785472293F04B208BEA9DBE' where ck_id='04FE0CA660454A55B9C10280B539D5C1';
update s_mt.t_page_object set ck_master='ADC7E2454785472293F04B208BEA9DBE' where ck_id='EF1B6FF79B8F4343A96EE36A09611226';
update s_mt.t_page_object set ck_master='ADC7E2454785472293F04B208BEA9DBE' where ck_id='552CA1ADCD6B4F7EB7BF99D5F90760DC';
update s_mt.t_page_object set ck_master='ADC7E2454785472293F04B208BEA9DBE' where ck_id='92B70F9A0EBC4543BD56392362750819';
