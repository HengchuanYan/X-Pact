exec gendata(5, 'A3040000', 1800, 2);
alter table gcc_grade_spec add STEELGRADE_GROUP number(2);
alter table gcc_grade_spec rename column STEELGRADE_GROUP to grade_group;
alter table gcc_grade_spec drop column grade_group;
alter table gcc_grade_spec add grade_group number(2) default 1 not null;

create table gdc_grade_group
(
group_id number(2),
group_name varchar2(20),
description varchar2(50)
);

alter table gdc_grade_group add constraint gdc_grade_group_pk primary key (group_id);

insert into gdc_grade_group values(1 , trim('ST-LC    '), trim('Low Carbon                                                '));
insert into gdc_grade_group values(2 , trim('ST-P        '), trim('Peritectic                      '));
insert into gdc_grade_group values(3 , trim('ST-MC    '), trim('Medium Carbon                     '));
insert into gdc_grade_group values(4 , trim('ST-HC    '), trim('High Carbon                       '));
insert into gdc_grade_group values(5 , trim('ST-UHC1'), trim('Ultra high carbon                '));
insert into gdc_grade_group values(6 , trim('MA-LC	'), trim('Low Carbon micro-alloyed (HSLA)   '));
insert into gdc_grade_group values(7 , trim('MA-P		'), trim('Peritectic micro-alloyed (HSLA) '));
insert into gdc_grade_group values(8 , trim('MA-MC	'), trim('Medium Carbon micro-alloyed (HSLA)'));
insert into gdc_grade_group values(9 , trim('MA-HC	'), trim('High Carbon microalloyed          '));
insert into gdc_grade_group values(10 , trim('MA-UHC1'), trim('Ultra high carbon                '));
commit;

alter table gcc_grade_spec add constraint fk_gcc_grade_spec_group foreign key(grade_group) references GDC_GRADE_GROUP(GROUP_ID);

alter table pdc_piece modify BNDRY_CHANGE_TYPE NUMBER(1) default 0 null;
alter table ppc_slab_order_sub add SLAB_WIDTH number(5);
alter table ppc_slab_order_sub add SLAB_THICKNESS number(5);

