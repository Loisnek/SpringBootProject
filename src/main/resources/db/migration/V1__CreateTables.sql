create table equipment_type (operation_specification_id bigint DEFAULT NULL, equipment_type varchar(255), mark_id varchar(255)  DEFAULT NULL) engine=InnoDB;
create table equipments (mark varchar(255) not null, description varchar(255), primary key (mark)) engine=InnoDB;
create table furniture_type (furniture_article varchar(255) not null, furniture_type varchar(255)) engine=InnoDB;
create table furnitures (article varchar(255) not null, amount integer not null, image longblob, product_name varchar(255) not null, purchase_price decimal(19,2) not null, unit varchar(255) not null, weight integer not null, main_supplier_supplier_id bigint, primary key (article)) engine=InnoDB;
create table material_type (material_article varchar(255) not null, material_types varchar(255)) engine=InnoDB;
create table materials (article varchar(255) not null, amount integer not null, description varchar(255), gost varchar(255), image longblob, length integer, product_name varchar(255) not null, purchase_price decimal(19,2) not null, unit varchar(255) not null, main_supplier_id bigint, primary key (article)) engine=InnoDB;
create table operation_specification (operation_specification bigint not null, operation_time datetime(6) not null, product_type_id bigint not null, primary key (operation_specification)) engine=InnoDB;
create table operation_type (operation_id bigint not null, operation varchar(255)) engine=InnoDB;
create table orders (order_id bigint not null, order_date date not null, order_name varchar(255), order_schemes longblob, planed_date_end date, price decimal(19,2), customer_id bigint not null, manager_id bigint, product_type_id bigint, primary key (order_id)) engine=InnoDB;
create table product_types (product_type_id bigint not null, product_type_name varchar(255), dimensions integer not null, primary key (product_type_id)) engine=InnoDB;
create table specification_furniture (furniture varchar(255) not null, amount bigint not null, product_type_id bigint not null, primary key (product_type_id, furniture)) engine=InnoDB;
create table specification_materials (amount decimal(19,2) not null, material_id varchar(255) not null, product_type_id bigint not null, primary key (product_type_id, material_id)) engine=InnoDB;
create table specification_unit (amount integer not null, product_type_id bigint not null, product_unit_id bigint not null, primary key (product_unit_id, product_type_id)) engine=InnoDB;
create table suppliers (supplier_id bigint not null, address varchar(255), delivery_period integer not null, supplier_name varchar(255), primary key (supplier_id)) engine=InnoDB;
create table suppliers_seq (next_val bigint) engine=InnoDB;
insert into suppliers_seq values ( 25 );
insert into suppliers_seq values ( 25 );
insert into suppliers_seq values ( 25 );
insert into suppliers_seq values ( 25 );
insert into suppliers_seq values ( 25 );
insert into suppliers_seq values ( 25 );
create table user_role (user_id bigint not null, roles varchar(255)) engine=InnoDB;
create table users (id bigint not null, first_name varchar(255), password varchar(255), patronymic varchar(255), photo longblob, surname varchar(255), username varchar(255), primary key (id)) engine=InnoDB;
create table users_seq (next_val bigint) engine=InnoDB;
insert into users_seq values ( 25 );
alter table operation_specification add constraint UK_9d7dgpan2hvlsrvk8ufg3c6xe unique (product_type_id);
alter table product_types add constraint UK_78e6pmnyve5uablg5myj65pyw unique (product_type_name);
alter table suppliers add constraint UK_9g4pe49qq28884yknw05f33yy unique (supplier_name);
alter table users add constraint UK_sx468g52bpetvlad2j9y0lptc unique (password, username);
alter table equipment_type add constraint FKkw4fgekwc1k4lbu84ncqc1loy foreign key (operation_specification_id) references operation_specification (operation_specification) ON UPDATE CASCADE ON DELETE CASCADE;
alter table equipment_type add constraint FKlrspdusy41nhvu89yhkmh34rb foreign key (mark_id) references equipments (mark) ON UPDATE CASCADE ON DELETE CASCADE;
alter table furniture_type add constraint FKoenrf30yna40aby9r9pt929pe foreign key (furniture_article) references furnitures (article) ON UPDATE CASCADE ON DELETE CASCADE;
alter table furnitures add constraint FKp2e7ukyea61ngauf49650cr17 foreign key (main_supplier_supplier_id) references suppliers (supplier_id) ON UPDATE CASCADE ON DELETE CASCADE;
alter table material_type add constraint FKs8f7aof67anp0cm2vwnffrutp foreign key (material_article) references materials (article) ON UPDATE CASCADE ON DELETE CASCADE;
alter table materials add constraint FKfimrbaitqh8hvjjo95bqbjxwo foreign key (main_supplier_id) references suppliers (supplier_id) ON UPDATE CASCADE ON DELETE CASCADE;
alter table operation_specification add constraint FKeqjlcifxp95tpkme4f21deyqq foreign key (product_type_id) references product_types (product_type_id) ON UPDATE CASCADE ON DELETE CASCADE;
alter table operation_type add constraint FKfcmbfky4vnaym8liejeb1qi1j foreign key (operation_id) references operation_specification (operation_specification) ON UPDATE CASCADE ON DELETE CASCADE;
alter table orders add constraint FKsjfs85qf6vmcurlx43cnc16gy foreign key (customer_id) references users (id) ON UPDATE CASCADE ON DELETE CASCADE;
alter table orders add constraint FK9qn4jar6kvccow7iyuo2mfuef foreign key (manager_id) references users (id) ON UPDATE CASCADE ON DELETE CASCADE;
alter table orders add constraint FKsh21pbpu7icmygqmsupbqtvh foreign key (product_type_id) references product_types (product_type_id) ON UPDATE CASCADE ON DELETE CASCADE;
alter table specification_furniture add constraint FKbfuimuowubgwtov4g2oetjxs foreign key (product_type_id) references product_types (product_type_id) ON UPDATE CASCADE ON DELETE CASCADE;
alter table specification_materials add constraint FKmo13csys90hsfb4k3qakq2ftc foreign key (material_id) references materials (article) ON UPDATE CASCADE ON DELETE CASCADE;
alter table specification_materials add constraint FK6ovose2riylkiy9s3fswe5bxp foreign key (product_type_id) references product_types (product_type_id) ON UPDATE CASCADE ON DELETE CASCADE;
alter table specification_unit add constraint FKjxokb7nmnyd49l3xav3ofvxrk foreign key (product_type_id) references product_types (product_type_id) ON UPDATE CASCADE ON DELETE CASCADE;
alter table specification_unit add constraint FK3seixccuhxeedi2f92rf56rjr foreign key (product_unit_id) references product_types (product_type_id) ON UPDATE CASCADE ON DELETE CASCADE;
alter table user_role add constraint FKj345gk1bovqvfame88rcx7yyx foreign key (user_id) references users (id) ON UPDATE CASCADE ON DELETE CASCADE;


