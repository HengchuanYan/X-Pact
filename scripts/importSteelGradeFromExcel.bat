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


-- sql script for chemical limit and target settings.
insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q345B-1',
'33_MA-MC',
1550, 7850,
'Q345B-1',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-1',
'C',
0.18,
0.16,
0.19);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-1',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-1',
'Mn',
0.8,
0.75,
0.85);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-1',
'P',
0.02,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-1',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-1',
'Al',
0.006,
0,
0.008);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-1',
'Nb',
0.013,
0.01,
0.015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q345B-2',
'33_MA-MC',
1550, 7850,
'Q345B-2',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-2',
'C',
0.18,
0.16,
0.19);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-2',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-2',
'Mn',
0.85,
0.8,
0.95);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-2',
'P',
0.02,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-2',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-2',
'Al',
0.006,
0.005,
0.015);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-2',
'Nb',
0.013,
0.01,
0.015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q345B-3',
'33_MA-MC',
1550, 7850,
'Q345B-3',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-3',
'C',
0.18,
0.16,
0.19);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-3',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-3',
'Mn',
1,
0.95,
1.05);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-3',
'P',
0.02,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-3',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-3',
'Al',
0.01,
0.005,
0.015);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-3',
'Nb',
0.013,
0.01,
0.015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'X60',
'32_MA-P',
1550, 7850,
'X60',
'MA-P',
0.015,
 7 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X60',
'C',
0.08,
0.06,
0.1);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X60',
'Si',
0.2,
0.15,
0.25);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X60',
'Mn',
1.5,
1.45,
1.55);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X60',
'P',
0.015,
0,
0.02);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X60',
'S',
0.005,
0,
0.007);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X60',
'Al',
0.025,
0.015,
0.035);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X60',
'Ti',
0.02,
0,
0.04);
-- to insert element V
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X60',
'V',
0.05,
0.04,
0.06);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X60',
'Nb',
0.04,
0.035,
0.045);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'X70',
'31_MA-LC',
1550, 7850,
'X70',
'MA-LC',
0.015,
 6 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X70',
'C',
0.05,
0,
0.07);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X70',
'Si',
0.2,
0.15,
0.25);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X70',
'Mn',
1.5,
1.4,
1.6);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X70',
'P',
0.01,
0,
0.015);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X70',
'S',
0.002,
0,
0.005);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X70',
'Al',
0.03,
0.02,
0.045);
-- to insert element Mo
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X70',
'Mo',
0.12,
0.1,
0.15);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X70',
'Ti',
0.018,
0.015,
0.02);
-- to insert element V
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X70',
'V',
0.045,
0.03,
0.06);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X70',
'Nb',
0.065,
0.055,
0.075);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q245R(TC)',
'31_MA-LC',
1550, 7850,
'Q245R(TC)',
'MA-LC',
0.015,
 6 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q245R(TC)',
'C',
0.06,
0.04,
0.08);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q245R(TC)',
'Si',
0.08,
0.05,
0.12);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q245R(TC)',
'Mn',
0.65,
0.55,
0.75);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q245R(TC)',
'P',
0.01,
0,
0.015);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q245R(TC)',
'S',
0.005,
0,
0.007);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q245R(TC)',
'Al',
0.02,
0.02,
0.04);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q245R(TC)',
'Ti',
0.14,
0.13,
0.15);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q345qE',
'32_MA-P',
1550, 7850,
'Q345qE',
'MA-P',
0.015,
 7 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345qE',
'C',
0.13,
0.11,
0.15);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345qE',
'Si',
0.28,
0.2,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345qE',
'Mn',
1.35,
1.3,
1.4);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345qE',
'P',
0.015,
0,
0.018);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345qE',
'S',
0.005,
0,
0.008);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345qE',
'Al',
0.03,
0.025,
0.035);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345qE',
'Nb',
0.015,
0.013,
0.017);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q345GJC',
'32_MA-P',
1550, 7850,
'Q345GJC',
'MA-P',
0.015,
 7 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345GJC',
'C',
0.13,
0.11,
0.15);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345GJC',
'Si',
0.28,
0.25,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345GJC',
'Mn',
1.35,
1.3,
1.4);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345GJC',
'P',
0.015,
0,
0.022);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345GJC',
'S',
0.005,
0,
0.008);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345GJC',
'Al',
0.03,
0.025,
0.035);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345GJC',
'Nb',
0.015,
0.013,
0.017);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'X42',
'32_MA-P',
1550, 7850,
'X42',
'MA-P',
0.015,
 7 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X42',
'C',
0.12,
0.11,
0.14);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X42',
'Si',
0.25,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X42',
'Mn',
1.1,
1.05,
1.15);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X42',
'P',
0.015,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X42',
'S',
0.01,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X42',
'Al',
0.025,
0.02,
0.03);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X42',
'Nb',
0.012,
0.01,
0.015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'X52',
'32_MA-P',
1550, 7850,
'X52',
'MA-P',
0.015,
 7 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X52',
'C',
0.08,
0.07,
0.09);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X52',
'Si',
0.25,
0.2,
0.3);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X52',
'Mn',
0.98,
0.93,
1.03);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X52',
'P',
0.015,
0,
0.019);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X52',
'S',
0.003,
0,
0.005);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X52',
'Al',
0.03,
0.025,
0.035);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X52',
'Ti',
0.035,
0.03,
0.038);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'X52',
'Nb',
0.032,
0.028,
0.035);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'S275JR-B-1',
'33_MA-MC',
1550, 7850,
'S275JR-B-1',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-1',
'C',
0.16,
0.15,
0.19);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-1',
'Si',
0.2,
0.15,
0.3);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-1',
'Mn',
0.8,
0.75,
0.85);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-1',
'P',
0.025,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-1',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-1',
'Al',
0.01,
0.005,
0.02);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-1',
'Ti',
0.025,
0.02,
0.03);
-- to insert element B
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-1',
'B',
0.0012,
0.001,
0.015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'S275JR-B-2',
'33_MA-MC',
1550, 7850,
'S275JR-B-2',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-2',
'C',
0.16,
0.15,
0.19);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-2',
'Si',
0.2,
0.15,
0.3);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-2',
'Mn',
0.9,
0.85,
0.95);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-2',
'P',
0.025,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-2',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-2',
'Al',
0.01,
0.005,
0.02);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-2',
'Ti',
0.02,
0.02,
0.03);
-- to insert element B
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-2',
'B',
0.0012,
0.001,
0.015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'S275JR-B-3',
'33_MA-MC',
1550, 7850,
'S275JR-B-3',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-3',
'C',
0.16,
0.15,
0.19);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-3',
'Si',
0.2,
0.15,
0.3);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-3',
'Mn',
1,
0.95,
1.05);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-3',
'P',
0.025,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-3',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-3',
'Al',
0.01,
0.005,
0.02);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-3',
'Ti',
0.025,
0.02,
0.03);
-- to insert element B
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S275JR-B-3',
'B',
0.0012,
0.001,
0.015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q235B-1',
'23_ST-MC',
1550, 7850,
'Q235B-1',
'ST-MC',
0.015,
 3 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-1',
'C',
0.16,
0.15,
0.18);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-1',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-1',
'Mn',
0.45,
0.35,
0.5);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-1',
'P',
0.035,
0,
0.04);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-1',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-1',
'Al',
0.006,
0,
0.008);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q235B-2',
'23_ST-MC',
1550, 7850,
'Q235B-2',
'ST-MC',
0.015,
 3 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-2',
'C',
0.17,
0.15,
0.18);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-2',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-2',
'Mn',
0.45,
0.35,
0.5);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-2',
'P',
0.035,
0,
0.035);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-2',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-2',
'Al',
0.006,
0,
0.008);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q235B-3',
'23_ST-MC',
1550, 7850,
'Q235B-3',
'ST-MC',
0.015,
 3 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-3',
'C',
0.16,
0.15,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-3',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-3',
'Mn',
0.4,
0.35,
0.5);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-3',
'P',
0.035,
0,
0.04);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-3',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-3',
'Al',
0.006,
0,
0.008);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q235C',
'22_ST-P',
1550, 7850,
'Q235C',
'ST-P',
0.015,
 2 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235C',
'C',
0.16,
0.14,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235C',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235C',
'Mn',
0.65,
0.6,
0.75);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235C',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235C',
'S',
0.01,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235C',
'Al',
0.01,
0.005,
0.015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q235D',
'22_ST-P',
1550, 7850,
'Q235D',
'ST-P',
0.015,
 2 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235D',
'C',
0.15,
0.13,
0.16);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235D',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235D',
'Mn',
0.8,
0.75,
0.85);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235D',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235D',
'S',
0.01,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235D',
'Al',
0.025,
0.02,
0.03);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q345B-4',
'23_ST-MC',
1550, 7850,
'Q345B-4',
'ST-MC',
0.015,
 3 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-4',
'C',
0.16,
0.15,
0.18);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-4',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-4',
'Mn',
1.3,
1.2,
1.35);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-4',
'P',
0.02,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-4',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-4',
'Al',
0.006,
0,
0.008);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q345B-5',
'23_ST-MC',
1550, 7850,
'Q345B-5',
'ST-MC',
0.015,
 3 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-5',
'C',
0.17,
0.15,
0.18);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-5',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-5',
'Mn',
1.35,
1.3,
1.4);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-5',
'P',
0.02,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-5',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-5',
'Al',
0.006,
0,
0.008);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q345B-6',
'23_ST-MC',
1550, 7850,
'Q345B-6',
'ST-MC',
0.015,
 3 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-6',
'C',
0.16,
0.15,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-6',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-6',
'Mn',
1.25,
1.2,
1.3);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-6',
'P',
0.02,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-6',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-6',
'Al',
0.006,
0,
0.008);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q345E',
'32_MA-P',
1550, 7850,
'Q345E',
'MA-P',
0.015,
 7 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345E',
'C',
0.15,
0.14,
0.16);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345E',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345E',
'Mn',
1.2,
1.15,
1.25);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345E',
'P',
0.018,
0,
0.23);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345E',
'S',
0.008,
0,
0.01);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345E',
'Al',
0.025,
0.02,
0.3);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345E',
'Nb',
0.015,
0.01,
0.02);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q345B-B',
'33_MA-MC',
1550, 7850,
'Q345B-B',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-B',
'C',
0.16,
0.15,
0.18);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-B',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-B',
'Mn',
1.4,
1.34,
1.45);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-B',
'P',
0.025,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-B',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-B',
'Al',
0.012,
0.008,
0.2);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-B',
'Ti',
0.025,
0.02,
0.03);
-- to insert element B
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-B',
'B',
0.001,
0.001,
0.0015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'SS400-B',
'33_MA-MC',
1550, 7850,
'SS400-B',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SS400-B',
'C',
0.17,
0.15,
0.19);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SS400-B',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SS400-B',
'Mn',
0.45,
0.4,
0.5);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SS400-B',
'P',
0.03,
0,
0.035);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SS400-B',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SS400-B',
'Al',
0.01,
0.005,
0.15);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SS400-B',
'Ti',
0.025,
0.02,
0.03);
-- to insert element B
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SS400-B',
'B',
0.001,
0.001,
0.0015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q235B-B',
'33_MA-MC',
1550, 7850,
'Q235B-B',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-B',
'C',
0.17,
0.15,
0.19);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-B',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-B',
'Mn',
0.45,
0.4,
0.5);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-B',
'P',
0.03,
0,
0.035);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-B',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-B',
'Al',
0.01,
0.005,
0.15);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-B',
'Ti',
0.025,
0.02,
0.03);
-- to insert element B
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-B',
'B',
0.001,
0.001,
0.0015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'SM490A-B-1',
'33_MA-MC',
1550, 7850,
'SM490A-B-1',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SM490A-B-1',
'C',
0.16,
0.15,
0.19);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SM490A-B-1',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SM490A-B-1',
'Mn',
1.2,
1.15,
1.25);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SM490A-B-1',
'P',
0.02,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SM490A-B-1',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SM490A-B-1',
'Al',
0.01,
0.005,
0.15);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SM490A-B-1',
'Ti',
0.025,
0.02,
0.03);
-- to insert element B
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SM490A-B-1',
'B',
0.001,
0.001,
0.0015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'SM490A-B-2',
'33_MA-MC',
1550, 7850,
'SM490A-B-2',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SM490A-B-2',
'C',
0.16,
0.15,
0.19);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SM490A-B-2',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SM490A-B-2',
'Mn',
1.3,
1.25,
1.35);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SM490A-B-2',
'P',
0.02,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SM490A-B-2',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SM490A-B-2',
'Al',
0.01,
0.005,
0.15);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SM490A-B-2',
'Ti',
0.025,
0.02,
0.03);
-- to insert element B
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'SM490A-B-2',
'B',
0.001,
0.001,
0.0015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'ASTMA36-B-1',
'33_MA-MC',
1550, 7850,
'ASTMA36-B-1',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA36-B-1',
'C',
0.17,
0.15,
0.19);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA36-B-1',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA36-B-1',
'Mn',
0.9,
0.85,
0.95);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA36-B-1',
'P',
0.03,
0,
0.035);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA36-B-1',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA36-B-1',
'Al',
0.01,
0.005,
0.15);
-- to insert element B
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA36-B-1',
'B',
0.001,
0.001,
0.0015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'ASTMA36-B-2',
'33_MA-MC',
1550, 7850,
'ASTMA36-B-2',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA36-B-2',
'C',
0.17,
0.15,
0.19);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA36-B-2',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA36-B-2',
'Mn',
0.65,
0.6,
0.7);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA36-B-2',
'P',
0.03,
0,
0.035);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA36-B-2',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA36-B-2',
'Al',
0.01,
0.005,
0.15);
-- to insert element B
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA36-B-2',
'B',
0.001,
0.001,
0.0015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'350',
'33_MA-MC',
1550, 7850,
'350',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'350',
'C',
0.16,
0.15,
0.18);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'350',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'350',
'Mn',
1.3,
1.25,
0.35);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'350',
'P',
0.02,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'350',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'350',
'Al',
0.01,
0.005,
0.15);
-- to insert element B
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'350',
'B',
0.001,
0.001,
0.0015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'S355',
'32_MA-P',
1550, 7850,
'S355',
'MA-P',
0.015,
 7 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S355',
'C',
0.16,
0.14,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S355',
'Si',
0.025,
0.2,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S355',
'Mn',
1.2,
1.15,
1.25);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S355',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S355',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S355',
'Al',
0.015,
0.01,
0.2);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S355',
'Nb',
0.013,
0.01,
0.015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q345C\D-1',
'33_MA-MC',
1550, 7850,
'Q345C\D-1',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345C\D-1',
'C',
0.16,
0.15,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345C\D-1',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345C\D-1',
'Mn',
1.35,
1.3,
1.4);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345C\D-1',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345C\D-1',
'S',
0.012,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345C\D-1',
'Al',
0.01,
0.005,
0.2);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345C\D-1',
'Ti',
0.025,
0.02,
0.3);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q345C\ D-2',
'33_MA-MC',
1550, 7850,
'Q345C\ D-2',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345C\ D-2',
'C',
0.16,
0.15,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345C\ D-2',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345C\ D-2',
'Mn',
1.45,
1.4,
1.5);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345C\ D-2',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345C\ D-2',
'S',
0.012,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345C\ D-2',
'Al',
0.01,
0.005,
0.2);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345C\ D-2',
'Ti',
0.025,
0.02,
0.3);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q390C\ D-3',
'33_MA-MC',
1550, 7850,
'Q390C\ D-3',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q390C\ D-3',
'C',
0.16,
0.15,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q390C\ D-3',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q390C\ D-3',
'Mn',
1.35,
1.3,
1.4);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q390C\ D-3',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q390C\ D-3',
'S',
0.012,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q390C\ D-3',
'Al',
0.025,
0.02,
0.3);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q390C\ D-3',
'Ti',
0.013,
0.01,
0.015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Grade-A',
'23_ST-MC',
1550, 7850,
'Grade-A',
'ST-MC',
0.015,
 3 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-A',
'C',
0.16,
0.15,
0.19);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-A',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-A',
'Mn',
0.55,
0.5,
0.6);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-A',
'P',
0.025,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-A',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-A',
'Al',
0.01,
0.005,
0.15);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Grade-B',
'23_ST-MC',
1550, 7850,
'Grade-B',
'ST-MC',
0.015,
 3 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-B',
'C',
0.16,
0.14,
0.18);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-B',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-B',
'Mn',
0.65,
0.62,
0.7);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-B',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-B',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-B',
'Al',
0.01,
0.005,
0.15);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Grade-D',
'22_ST-P',
1550, 7850,
'Grade-D',
'ST-P',
0.015,
 2 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-D',
'C',
0.12,
0.11,
0.14);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-D',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-D',
'Mn',
1.05,
1,
1.2);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-D',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-D',
'S',
0.01,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Grade-D',
'Al',
0.03,
0.02,
0.35);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'AH32',
'33_MA-MC',
1550, 7850,
'AH32',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'AH32',
'C',
0.16,
0.15,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'AH32',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'AH32',
'Mn',
1,
0.95,
1.05);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'AH32',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'AH32',
'S',
0.01,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'AH32',
'Al',
0.025,
0.02,
0.3);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'AH32',
'Nb',
0.012,
0.01,
0.018);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'DH32',
'33_MA-MC',
1550, 7850,
'DH32',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'DH32',
'C',
0.16,
0.15,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'DH32',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'DH32',
'Mn',
1,
0.95,
1.05);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'DH32',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'DH32',
'S',
0.01,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'DH32',
'Al',
0.025,
0.02,
0.3);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'DH32',
'Nb',
0.012,
0.01,
0.018);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'AH36',
'33_MA-MC',
1550, 7850,
'AH36',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'AH36',
'C',
0.16,
0.15,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'AH36',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'AH36',
'Mn',
1.2,
1.15,
1.25);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'AH36',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'AH36',
'S',
0.01,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'AH36',
'Al',
0.025,
0.02,
0.3);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'AH36',
'Nb',
0.013,
0.01,
0.018);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'DH36',
'33_MA-MC',
1550, 7850,
'DH36',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'DH36',
'C',
0.16,
0.15,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'DH36',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'DH36',
'Mn',
1.2,
1.15,
1.25);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'DH36',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'DH36',
'S',
0.01,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'DH36',
'Al',
0.025,
0.02,
0.3);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'DH36',
'Nb',
0.013,
0.01,
0.018);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q460D-1',
'33_MA-MC',
1550, 7850,
'Q460D-1',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q460D-1',
'C',
0.16,
0.15,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q460D-1',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q460D-1',
'Mn',
1.4,
1.35,
1.45);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q460D-1',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q460D-1',
'S',
0.012,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q460D-1',
'Al',
0.015,
0.01,
0.2);
-- to insert element V
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q460D-1',
'V',
0.035,
0.03,
0.04);
-- to insert element B/Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q460D-1',
'B/Nb',
0.02,
0.015,
0.025);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q460D-2',
'33_MA-MC',
1550, 7850,
'Q460D-2',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q460D-2',
'C',
0.16,
0.15,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q460D-2',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q460D-2',
'Mn',
1.45,
1.35,
1.5);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q460D-2',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q460D-2',
'S',
0.012,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q460D-2',
'Al',
0.015,
0.01,
0.2);
-- to insert element V
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q460D-2',
'V',
0.07,
0.06,
0.08);
-- to insert element B/Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q460D-2',
'B/Nb',
0.02,
0.015,
0.025);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q420B/C/D',
'33_MA-MC',
1550, 7850,
'Q420B/C/D',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q420B/C/D',
'C',
0.16,
0.15,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q420B/C/D',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q420B/C/D',
'Mn',
1.4,
1.35,
1.45);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q420B/C/D',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q420B/C/D',
'S',
0.012,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q420B/C/D',
'Al',
0.025,
0.02,
0.3);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q420B/C/D',
'Nb',
0.02,
0.018,
0.023);
-- to insert element B/Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q420B/C/D',
'B/Nb',
0.02,
0.018,
0.023);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'45',
'25_ST-UHC I',
1550, 7850,
'45',
'ST-UHC I',
0.015,
 5 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'45',
'C',
0.47,
0.42,
0.48);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'45',
'Si',
0.25,
0.2,
0.3);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'45',
'Mn',
0.6,
0.55,
0.65);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'45',
'P',
0.015,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'45',
'S',
0.02,
0,
0.035);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'45',
'Al',
0.01,
0.008,
0.015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'S45C-B',
'35_MA-UHC I',
1550, 7850,
'S45C-B',
'MA-UHC I',
0.015,
 10 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S45C-B',
'C',
0.45,
0.44,
0.47);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S45C-B',
'Si',
0.25,
0.2,
0.3);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S45C-B',
'Mn',
0.65,
0.6,
0.7);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S45C-B',
'P',
0.015,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S45C-B',
'S',
0.015,
0.005,
0.035);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S45C-B',
'Al',
0.01,
0.008,
0.15);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S45C-B',
'Ti',
0.025,
0.02,
0.03);
-- to insert element B
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S45C-B',
'B',
0.00125,
0.001,
0.0015);
-- to insert element B/Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'S45C-B',
'B/Nb',
0.001,
0.001,
0.0015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q345B-Z15',
'32_MA-P',
1550, 7850,
'Q345B-Z15',
'MA-P',
0.015,
 7 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-Z15',
'C',
0.12,
0.11,
0.13);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-Z15',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-Z15',
'Mn',
1.2,
1.15,
1.25);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-Z15',
'P',
0.025,
0.02,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-Z15',
'S',
0.01,
0.005,
0.01);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-Z15',
'Al',
0.025,
0.02,
0.3);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-Z15',
'Ti',
0.025,
0.2,
0.03);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345B-Z15',
'Nb',
0.018,
0.015,
0.02);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q345R',
'33_MA-MC',
1550, 7850,
'Q345R',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345R',
'C',
0.16,
0.14,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345R',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345R',
'Mn',
1.35,
1.3,
1.4);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345R',
'P',
0.015,
0,
0.023);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345R',
'S',
0.008,
0,
0.01);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345R',
'Al',
0.01,
0.005,
0.2);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345R',
'Ti',
0.025,
0.2,
0.03);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q235B-Z15-1',
'23_ST-MC',
1550, 7850,
'Q235B-Z15-1',
'ST-MC',
0.015,
 3 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-Z15-1',
'C',
0.16,
0.14,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-Z15-1',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-Z15-1',
'Mn',
0.4,
0.3,
0.5);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-Z15-1',
'P',
0.02,
0,
0.25);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-Z15-1',
'S',
0.005,
0,
0.01);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-Z15-1',
'Al',
0.025,
0.02,
0.3);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q235B-Z15-2',
'23_ST-MC',
1550, 7850,
'Q235B-Z15-2',
'ST-MC',
0.015,
 3 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-Z15-2',
'C',
0.16,
0.14,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-Z15-2',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-Z15-2',
'Mn',
0.45,
0.35,
0.55);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-Z15-2',
'P',
0.015,
0,
0.25);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-Z15-2',
'S',
0.005,
0,
0.01);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-Z15-2',
'Al',
0.025,
0.02,
0.3);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'ASTMA572',
'33_MA-MC',
1550, 7850,
'ASTMA572',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA572',
'C',
0.16,
0.15,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA572',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA572',
'Mn',
1.15,
1.1,
1.2);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA572',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA572',
'S',
0.012,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA572',
'Al',
0.025,
0.02,
0.3);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA572',
'Nb',
0.012,
0.01,
0.015);
-- to insert element B
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA572',
'B',
0.0012,
0.001,
0.0015);
-- to insert element B/Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'ASTMA572',
'B/Nb',
0.012,
0.01,
0.015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q345qC/D',
'33_MA-MC',
1550, 7850,
'Q345qC/D',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345qC/D',
'C',
0.16,
0.15,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345qC/D',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345qC/D',
'Mn',touch2
1.33,
1.28,
1.38);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345qC/D',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345qC/D',
'S',
0.01,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345qC/D',
'Al',
0.025,
0.02,
0.3);
-- to insert element Ti
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q345qC/D',
'Ti',
0.018,
0.012,
0.022);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q370qC/D',
'33_MA-MC',
1550, 7850,
'Q370qC/D',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q370qC/D',
'C',
0.16,
0.15,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q370qC/D',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q370qC/D',
'Mn',
1.3,
1.25,
1.35);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q370qC/D',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q370qC/D',
'S',
0.01,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q370qC/D',
'Al',
0.025,
0.02,
0.3);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q370qC/D',
'Nb',
0.015,
0.013,
0.017);
-- to insert element B/Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q370qC/D',
'B/Nb',
0.015,
0.013,
0.017);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'PSL1-B',
'22_ST-P',
1550, 7850,
'PSL1-B',
'ST-P',
0.015,
 2 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'PSL1-B',
'C',
0.15,
0.14,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'PSL1-B',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'PSL1-B',
'Mn',
0.65,
0.6,
0.7);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'PSL1-B',
'P',
0.02,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'PSL1-B',
'S',
0.01,
0,
0.015);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'PSL1-B',
'Al',
0.01,
0.005,
0.15);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q420QD',
'33_MA-MC',
1550, 7850,
'Q420QD',
'MA-MC',
0.015,
 8 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q420QD',
'C',
0.16,
0.15,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q420QD',
'Si',
0.2,
0.15,
0.35);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q420QD',
'Mn',
1.35,
1.35,
1.4);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q420QD',
'P',
0.015,
0.015,
0.02);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q420QD',
'S',
0.008,
0,
0.01);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q420QD',
'Al',
0.025,
0.02,
0.3);
-- to insert element Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q420QD',
'Nb',
0.015,
0.013,
0.017);
-- to insert element B/Nb
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q420QD',
'B/Nb',
0.015,
0.013,
0.017);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'L245PSL2B ',
'22_ST-P',
1550, 7850,
'L245PSL2B ',
'ST-P',
0.015,
 2 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245PSL2B ',
'C',
0.09,
0,
0.1);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245PSL2B ',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245PSL2B ',
'Mn',
0.75,
0.7,
1.4);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245PSL2B ',
'P',
0.02,
0,
0.025);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245PSL2B ',
'S',
0.008,
0,
0.01);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245PSL2B ',
'Al',
0.01,
0.005,
0.015);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q245R',
'22_ST-P',
1550, 7850,
'Q245R',
'ST-P',
0.015,
 2 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q245R',
'C',
0.15,
0.14,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q245R',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q245R',
'Mn',
0.75,
0.7,
0.8);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q245R',
'P',
0.02,
0,
0.023);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q245R',
'S',
0.008,
0,
0.01);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q245R',
'Al',
0.025,
0.02,
0.3);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'L245\PSL1/2B-1',
'22_ST-P',
1550, 7850,
'L245\PSL1/2B-1',
'ST-P',
0.015,
 2 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245\PSL1/2B-1',
'C',
0.15,
0.14,
0.17);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245\PSL1/2B-1',
'Si',
0.15,
0.1,
0.2);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245\PSL1/2B-1',
'Mn',
0.75,
0.7,
0.8);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245\PSL1/2B-1',
'P',
0.02,
0,
0.023);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245\PSL1/2B-1',
'S',
0.008,
0,
0.01);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245\PSL1/2B-1',
'Al',
0.025,
0.02,
0.3);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'L245\PSL1/2B-2',
'22_ST-P',
1550, 7850,
'L245\PSL1/2B-2',
'ST-P',
0.015,
 2 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245\PSL1/2B-2',
'C',
0.12,
0.1,
0.14);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245\PSL1/2B-2',
'Si',
0.15,
0.1,
0.25);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245\PSL1/2B-2',
'Mn',
1,
0.9,
1.05);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245\PSL1/2B-2',
'P',
0.02,
0,
0.023);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245\PSL1/2B-2',
'S',
0.008,
0,
0.01);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'L245\PSL1/2B-2',
'Al',
0.025,
0.02,
0.3);


insert into GCC_GRADE_SPEC(GRADE_CODE, GRADE_DESC, CALC_LIQ_TEMP, DENSITY, GRADE_COMMENT, GRADE_ABBR, SHRINKAGE, GRADE_GROUP) values (
'Q235B-4',
'22_ST-P',
1550, 7850,
'Q235B-4',
'ST-P',
0.015,
 2 
);
-- to insert element C
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-4',
'C',
0.08,
0.07,
0.1);
-- to insert element Si
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-4',
'Si',
0.15,
0.15,
0.25);
-- to insert element Mn
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-4',
'Mn',
0.55,
0.5,
0.6);
-- to insert element P
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-4',
'P',
0.025,
0,
0.03);
-- to insert element S
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-4',
'S',
0.015,
0,
0.02);
-- to insert element Al
insert into GCC_SPEC_ANALYSIS(GRADE_CODE, ELEMENT_NAME, AIM_CONC, MIN_CONC, MAX_CONC) values ( 
'Q235B-4',
'Al',
0.015,
0.01,
0.2);


commit;
