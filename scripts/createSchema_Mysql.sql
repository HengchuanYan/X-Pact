--install oracle server. ATTENTION: Database instance characterset must use AL32UTF8, no limit for language and territory.
-- SQLNET.EXPIRE_TIME set to 1 in db server
-- expdp system/oracle@ccsdb schemas=(xpact_sys, l2ccs, clo, castingopt, hmi, shiftmanagement, idsc, idsc_offline, qual) directory=DUMPDIR dumpfile=CCS.dmp logfile=CCS.log
--DROP TABLESPACE CCSDB INCLUDING CONTENTS CASCADE CONSTRAINTS;
CREATE TABLESPACE CCSDB DATAFILE 'D:\app\oradata\CCSDB\CCSDB01.DBF' SIZE 10000M
     autoextend on maxsize unlimited
   EXTENT MANAGEMENT LOCAL
   SEGMENT SPACE MANAGEMENT AUTO;
   
CREATE TABLESPACE IPQS DATAFILE 'D:\app\oradata\CCSDB\IPQSDB01.DBF' SIZE 20000M
     autoextend on maxsize unlimited
   EXTENT MANAGEMENT LOCAL
   SEGMENT SPACE MANAGEMENT AUTO;
--CCS

create directory DUMPDIR as 'D:\DumpDir';

drop user xpact_sys_handancsp       cascade;
drop user l2ccs           cascade;
drop user IDSC            cascade;
drop user IDSC_Offline    cascade;
drop user clo             cascade;
drop user castingopt      cascade;
drop user hmi             cascade;
drop user shiftmanagement cascade;
drop user ccc cascade;
drop user handancsp_transfer cascade;

create user xpact_sys_handancsp       identified by xpact_sys       default tablespace ccsdb temporary tablespace temp;
create user l2ccs           identified by l2ccs           default tablespace ccsdb temporary tablespace temp;
--create user swm            identified by swm            default tablespace ccsdb temporary tablespace temp;
create user clo             identified by clo             default tablespace ccsdb temporary tablespace temp;
create user castingopt      identified by castingopt      default tablespace ccsdb temporary tablespace temp;
create user hmi             identified by hmi             default tablespace ccsdb temporary tablespace temp;
create user shiftmanagement identified by shiftmanagement default tablespace ccsdb temporary tablespace temp;
create user idsc            identified by idsc            default tablespace ccsdb temporary tablespace temp;
create user idsc_offline    identified by idsc_offline    default tablespace ccsdb temporary tablespace temp;
create user ccc             identified by ccc    default tablespace ccsdb temporary tablespace temp;
create user handancsp_transfer identified by handan    default tablespace ccsdb temporary tablespace temp;
create user l2ems identified by l2ems    default tablespace ccsdb temporary tablespace temp;
create user l2cpr identified by l2cpr    default tablespace ccsdb temporary tablespace temp;

grant connect, resource, create view, create synonym to xpact_sys, l2ccs, idsc, idsc_offline, clo, castingopt, hmi, shiftmanagement, ccc, handancsp_transfer, l2ems, l2cpr;

--imp system/oracle@ccsdb file=fuxin.dmp log = xpact_sys.log 				fromuser=xpact_sys 				touser=xpact_sys       ;
--imp system/oracle@ccsdb file=fuxin.dmp log = l2ccs.log 						fromuser=l2ccs 						touser=l2ccs           ;
--imp system/oracle@ccsdb file=fuxin.dmp log = swm.log 							fromuser=swm              touser=swm             ;
--imp system/oracle@ccsdb file=fuxin.dmp log = clo.log 							fromuser=clo              touser=clo             ;
--imp system/oracle@ccsdb file=fuxin.dmp log = castingopt.log 			fromuser=castingopt       touser=castingopt      ;
--imp system/oracle@ccsdb file=fuxin.dmp log = hmi.log 							fromuser=hmi              touser=hmi             ;
--imp system/oracle@ccsdb file=fuxin.dmp log = shiftmanagement.log 	fromuser=shiftmanagement  touser=shiftmanagement ;

--impdp system/oracle@ccsdb schemas=(xpact_sys, l2ccs, clo, castingopt, hmi, shiftmanagement) directory=DUMPDIR dumpfile=ccs.dmp logfile=_impdp.log
--impdp system/oracle@ccsdb schemas=(xpact_sys_puyang) directory=DUMPDIR dumpfile=CCSDB_20150819.dmp remap_schema=(xpact_sys_puyang:xpact_sys) logfile=xpact_sys_impdp.log
impdp system/oracle@ccsdb directory=dumpdir schemas=(xpact_sys) dumpfile=CCSDB_20151227.DMP logfile=XPACT_SYS_HANDANCSP_imp.log remap_schema=(xpact_sys:xpact_sys_handancsp) 
-- map xpact_sys to xpact_sys_puyang
--impdp system/oracle@ccsdb schemas=(xpact_sys) remap_schema=(xpact_sys:xpact_sys_puyang) directory=DUMPDIR dumpfile=ccs.dmp logfile=xpact_sys_impdp.log
impdp system/oracle@ccsdb schemas=(clo) directory=DUMPDIR dumpfile=CCSDB_20151227.dmp logfile=clo_impdp.log
impdp system/oracle@ccsdb schemas=(castingopt) directory=DUMPDIR dumpfile=CCSDB_20151227.dmp logfile=castingopt_impdp.log
impdp system/oracle@ccsdb schemas=(shiftmanagement) directory=DUMPDIR dumpfile=CCSDB_20151227.dmp logfile=shiftmanagement_impdp.log
impdp system/oracle@ccsdb schemas=(l2ccs) directory=DUMPDIR dumpfile=CCSDB_20151227.dmp logfile=l2ccs_impdp.log
impdp system/oracle@ccsdb schemas=(hmi) directory=DUMPDIR dumpfile=CCSDB_20151227.dmp logfile=hmi_impdp.log
impdp system/oracle@ccsdb schemas=(idsc) directory=DUMPDIR dumpfile=CCSDB_20151227.dmp logfile=idsc_impdp.log
impdp system/oracle@ccsdb schemas=(idsc_offline) directory=DUMPDIR dumpfile=CCSDB_20151227.dmp logfile=idsc_offline_impdp.log
impdp system/oracle@ccsdb schemas=(ccc) directory=DUMPDIR dumpfile=CCSDB_20151227.dmp logfile=ccc_impdp.log
impdp system/oracle@ccsdb schemas=(handancsp_transfer) directory=DUMPDIR dumpfile=CCSDB_20151227.dmp logfile=idsc_offline_impdp.log

-- connect xpact_sys
grant select on EVLOG_LONG_STORAGE to l2ccs;

--IPQS
--logon system
drop user ipqs_meta       cascade;
drop user ipqs_pds           cascade;
drop user ipqsipqs cascade;
drop user qe01 cascade;
drop role ipqs_user;

create user ipqs_meta identified by ipqs default tablespace ipqs temporary tablespace temp;
create user ipqs_pds  identified by ipqs default tablespace ipqs temporary tablespace temp;
create user ipqsipqs  identified by i default tablespace ipqs temporary tablespace temp;
create user qe01  identified by q default tablespace ipqs temporary tablespace temp;
create role ipqs_user;
create user ipqsdbadmin identified by ipqsdb default tablespace ipqs temporary tablespace temp;
grant dba to ipqsdbadmin;

grant connect, resource, create view, create synonym to ipqs_meta, ipqs_pds, ipqsipqs, qe01;

--imp system/oracle@ccsdb file=fuxin.dmp log = ipqs_meta.log fromuser=ipqs_fuxin_meta touser=ipqs_meta;
--imp system/oracle@ccsdb file=fuxin.dmp log = ipqs_pds.log fromuser=ipqs_fuxin_pds touser=ipqs_pds;
--imp system/oracle@ccsdb file=fuxin.dmp log = ipqsipqs.log fromuser=ipqsipqs touser=ipqsipqs;

impdp system/oracle@ccsdb schemas=(ipqs_meta) directory=DUMPDIR dumpfile=IPQS_20151227.dmp logfile=ipqs_meta.log
--impdp system/oracle@ipqsdb remap_schema=ipqs_meta:ipqs_meta_sde directory=DUMPDIR_IPQS remap_tablespace=ccsdb:ipqs dumpfile=CCSDB_EXPDP_2013_05_06_15_00.dmp logfile=ipqs_meta.log
impdp system/oracle@ccsdb schemas=(ipqs_pds) directory=DUMPDIR dumpfile=IPQS_20151227.dmp logfile=ipqs_pds.log 
impdp system/oracle@ccsdb schemas=(ipqsipqs) directory=DUMPDIR dumpfile=IPQS_20151227.dmp logfile=ipqsipqs.log 
-- select * from dba_directories;
--expdp system/oracle@ccsdb schemas=(l2ccs, hmi, castingopt, clo, xpact_sys, shiftmanagement, IDSC, IDSC_Offline, handancsp_transfer, ccc) directory=DUMPDIR dumpfile=ccsdb.dmp logfile=ccsdb.log
--expdp system/oracle@ipqsdb schemas=(ipqs_pds, ipqs_meta, ipqsipqs, qe01, ipqsdbadmin) directory=DUMPDIR dumpfile=ipqs.dmp logfile=ipqs.log

--impdp system/oracle@ipqsdb schemas=(ipqs_fuxin_meta) directory=DUMPDIR remap_tablespace=ccsdb:ipqs remap_schema=(ipqs_fuxin_meta:ipqs_meta, ipqs_fuxin_pds:ipqs_pds, ipqs_fuxin_user:ipqs_user) dumpfile=ccsdb_expdp.dmp logfile=ipqs_meta.log
--impdp system/oracle@ipqsdb schemas=(ipqs_fuxin_pds) directory=DUMPDIR remap_tablespace=ccsdb:ipqs remap_schema=(ipqs_fuxin_meta:ipqs_meta, ipqs_fuxin_pds:ipqs_pds, ipqs_fuxin_user:ipqs_user) dumpfile=ccsdb_expdp.dmp logfile=ipqs_pds.log

add_grants2role.cmd IPQS_META IPQS IPQS_PDS
add_grants2role.cmd IPQS_META IPQS QE01

add_grants2role.cmd IPQSIPQS I QE01

add_grants2role.cmd IPQS_PDS IPQS IPQS_META
add_grants2role.cmd IPQS_PDS IPQS QE01

drop_usersynonyms.cmd IPQS_META IPQS
drop_usersynonyms.cmd IPQS_PDS IPQS
drop_usersynonyms.cmd QE01 q

cre_usersynonyms.cmd IPQS_META IPQS IPQS_PDS
cre_usersynonyms.cmd QE01 q IPQS_PDS

cre_usersynonyms.cmd IPQS_PDS IPQS IPQS_META
cre_usersynonyms.cmd QE01 q IPQS_META

cre_usersynonyms.cmd QE01 q IPQSIPQS

---impdp system/oracle@ccsdb schemas=(ipqs_fuxin_meta) remap_schema=ipqs_fuxin_meta:ipqs_meta directory=DUMPDIR remap_tablespace=ccsdb:ipqs dumpfile=CCSDB_EXPDP.dmp logfile=ipqs_meta_20150108.log
---impdp system/oracle@ccsdb schemas=(ipqs_fuxin_pds) remap_schema=ipqs_fuxin_pds:ipqs_pds directory=DUMPDIR remap_tablespace=ccsdb:ipqs dumpfile=CCSDB_EXPDP.dmp logfile=ipqs_pds_20150108.log
---
---impdp system/oracle@ccsdb directory=DUMPDIR dumpfile=2015-04-08.dmp logfile=2015-04-08.log tables=l2ccs.pd_analysis_entry remap_table=l2ccs.pd_analysis_entry:l2ccs.pd_analysis_entry_his


--MMS
CREATE TABLESPACE EDB_CONTENT DATAFILE 'C:\app\yahc\oradata\CCSDB\EDB_CONTENT.DBF' SIZE 200M
     autoextend on maxsize unlimited
   EXTENT MANAGEMENT LOCAL
   SEGMENT SPACE MANAGEMENT AUTO;
CREATE TABLESPACE PDB_CONTENT DATAFILE 'C:\app\yahc\oradata\CCSDB\PDB_CONTENT.ORA' SIZE 500M
     autoextend on maxsize unlimited
   EXTENT MANAGEMENT LOCAL
   SEGMENT SPACE MANAGEMENT AUTO;
   
create user mms_sc identified by mmsscuser default tablespace ccsdb temporary tablespace temp;
create user mms_ps identified by mmspsuser default tablespace ccsdb temporary tablespace temp;
create user mms_hmi identified by mmshmiuser default tablespace ccsdb temporary tablespace temp;
grant connect, resource, create synonym, create view to mms_sc, mms_ps, mms_hmi;

-- system on line 2
create user ccc identified by ccc default tablespace ccsdb temporary tablespace temp;
grant connect, resource, create synonym, create view to ccc;

-- l2ccs
grant select on pdc_heat to ccc;
grant select on pdc_sequence to ccc;

-- ccc@caster1
CREATE OR REPLACE VIEW V_MMS_DATA_HANDAN_1
    (DATI_MSG_SENT, STEELGRADE, SEQU_NO, HEAT_ID, HEAT_POS, STATION_ID, STEELGROUP)
AS 
select 
    TO_DATE(SUBSTR(NVL(H.LADLE_OPEN_TIME, TO_CHAR(sysdate, 'YYYY-MM-DD HH24:MI:SS')), 1, 19), 'YYYY-MM-DD HH24:MI:SS') DATI_MSG_SENT,
    H.GRADE_CODE STEELGRADE, 
    NVL(H.SEQ_NO_ALIAS, S.SEQ_NO) SEQU_NO, 
    NVL(H.HEATID_ALIAS, H.HEATID) HEAT_ID, 
    H.HEAT_SEQ_NO HEAT_POS, 
    'CAS1' STATION_ID, 
    1 STEELGROUP 
from l2ccs.pdc_heat h, l2ccs.pdc_sequence s
where H.SEQUENCE_STEEL_ID = S.STEEL_ID and H.STEEL_ID = (select max(steel_id ) from l2ccs.pdc_heat);

-- ccc@caster2
CREATE OR REPLACE VIEW V_MMS_DATA_HANDAN_2
    (DATI_MSG_SENT, STEELGRADE, SEQU_NO, HEAT_ID, HEAT_POS, STATION_ID, STEELGROUP)
AS 
select 
    TO_DATE(SUBSTR(NVL(H.LADLE_OPEN_TIME, TO_CHAR(sysdate, 'YYYY-MM-DD HH24:MI:SS')), 1, 19), 'YYYY-MM-DD HH24:MI:SS') DATI_MSG_SENT,
    H.GRADE_CODE STEELGRADE, 
    NVL(H.SEQ_NO_ALIAS, S.SEQ_NO) SEQU_NO, 
    NVL(H.HEATID_ALIAS, H.HEATID) HEAT_ID, 
    H.HEAT_SEQ_NO HEAT_POS, 
    'CAS2' STATION_ID, 
    1 STEELGROUP 
from l2ccs.pdc_heat h, l2ccs.pdc_sequence s
where H.SEQUENCE_STEEL_ID = S.STEEL_ID and H.STEEL_ID = (select max(steel_id ) from l2ccs.pdc_heat);

--expdp system/oracle@ccsdb directory=dumpdir tables=(ipqs_meta.QUALEV_TRENDING, ipqs_meta.QUALEV_TRENDING_CURVES,ipqs_meta.QUALEV_TRENDING_ENTRY,ipqs_meta.QUALEV_TYPES,ipqs_meta.QUALEV_VALUES) dumpfile=qualev.dmp logfile = qualev.log
impdp system/oracle@ccsdb directory=dumpdir tables=(ipqs_meta.QUALEV_TRENDING, ipqs_meta.QUALEV_TRENDING_CURVES,ipqs_meta.QUALEV_TRENDING_ENTRY,ipqs_meta.QUALEV_TYPES,ipqs_meta.QUALEV_VALUES) dumpfile=qualev.dmp logfile = qualev_imp.log


select P.SOURCE_ID, P.ITEM_ORDER,  P.SOURCE_ITEM_NAME, Q.IPQS_ITEM_NAME, Q.ITEM_ID from p_data_source_items p, q_data_source_items q where Q.ITEM_ID = P.IPQS_ITEM_ID and source_id=11
    order by P.ITEM_ORDER;
    
-- conn handancsp_transfer
CREATE OR REPLACE TRIGGER HANDANCSP_TRANSFER."X_SMC_STEEL_ANALYSIS_AU" after update ON HANDANCSP_TRANSFER.X_SMC_STEEL_ANALYSIS for each row
begin 
        insert into L2CCS.X_SMC_STEEL_ANALYSIS (
        IDX,
               MSG_INFO ,
                DATI_MSG_SENT,
                HEAT_ID,
                STAION_ID,
                SAMPLE_TYPE,
                SAMPLE_POS,
                L3_HEAT_ID,
                GRADE_ID,
                DATI_ANALYSIS_TAKEN,
                VALUE_C ,
                VALUE_SI    ,
                VALUE_MN    ,
                VALUE_P     ,
                VALUE_S     ,
                VALUE_CU    ,
                VALUE_SN    ,
                VALUE_NI    ,
                VALUE_CR    ,
                VALUE_MO    ,
                VALUE_AS    ,
                VALUE_AL_T  ,
                VALUE_V     ,
                VALUE_NB    ,
                VALUE_PB    ,
                VALUE_AL_S  ,
                VALUE_TI    ,
                VALUE_CA    ,
                VALUE_O     ,
                VALUE_N     ,
                VALUE_H     ,
                VALUE_B     ,
                VALUE_AL    ,
                VALUE_CO    ,
                VALUE_ZN    ,
                VALUE_SE    ,
                VALUE_ZR    ,
                VALUE_W     ,
                VALUE_SB    ,
                VALUE_MG    ,
                VALUE_TE    ,
                VALUE_BI    
        )
        values(
        SEQ_LAB_ANALYSIS_MSG_ID.NEXTVAL,
            :NEW.MSG_INFO ,
    :NEW.DATI_MSG_SENT,
    :NEW.HEAT_ID,
    :NEW.STAION_ID,
    :NEW.SAMPLE_TYPE,
    :NEW.SAMPLE_POS,
    :NEW.L3_HEAT_ID,
    :NEW.GRADE_ID,
    :NEW.DATI_ANALYSIS_TAKEN,
    :NEW.VALUE_C ,
    :NEW.VALUE_SI    ,
    :NEW.VALUE_MN    ,
    :NEW.VALUE_P     ,
    :NEW.VALUE_S     ,
    :NEW.VALUE_CU    ,
    :NEW.VALUE_SN    ,
    :NEW.VALUE_NI    ,
    :NEW.VALUE_CR    ,
    :NEW.VALUE_MO    ,
    :NEW.VALUE_AS    ,
    :NEW.VALUE_AL_T  ,
    :NEW.VALUE_V     ,
    :NEW.VALUE_NB    ,
    :NEW.VALUE_PB    ,
    :NEW.VALUE_AL_S  ,
    :NEW.VALUE_TI    ,
    :NEW.VALUE_CA    ,
    :NEW.VALUE_O     ,
    :NEW.VALUE_N     ,
    :NEW.VALUE_H     ,
    :NEW.VALUE_B     ,
    :NEW.VALUE_AL    ,
    :NEW.VALUE_CO    ,
    :NEW.VALUE_ZN    ,
    :NEW.VALUE_SE    ,
    :NEW.VALUE_ZR    ,
    :NEW.VALUE_W     ,
    :NEW.VALUE_SB    ,
    :NEW.VALUE_MG    ,
    :NEW.VALUE_TE    ,
    :NEW.VALUE_BI    
            );
    end X_SMC_STEEL_ANALYSIS_AU;
/

-- conn system
drop table report_heat cascade constraint;
create table report_heat
(
IDX number(10) primary key not null,
HEATID varchar2(10),
SEQ_IDX varchar2(10),
SEQ_NO varchar2(9),
LADLE_NO number(3),
GRADE_CODE varchar2(15),
HEAT_SEQ_NO number(3),
LF_PLANT_ID number(1),
HEAT_END_TIME varchar2(23), 
TAP_DURATION number(4),
LF_LAST_HEAT_TEMP number(4),
LADLE_OPEN_TIME varchar2(23),
LADLE_OPEN_WEIGHT number(6),
LADLE_OPEN_TUND_WEIGHT number(6),
LSG_POS_OPEN number(3),
LADLE_CLOSE_TIME varchar2(23),
LADLE_CLOSE_WEIGHT number(6),
LADLE_CLOSE_TUND_WEIGHT number(6),
LSG_POS_CLOSE number(3),
LANCING_FLAG number(1),
SLAG_DETECTED number(1),
CAST_SPEED number(3, 2),
MOLD_WIDTH_BOC number(6, 2),
TUND_STEEL_TEMP_1 number(4),
TUND_STEEL_TEMP_2 number(4),
TUND_STEEL_TEMP_3 number(4),
TUND_STEEL_TEMP_4 number(4),
SLAB_INFO varchar2(50),
Slab_Weight_tot number(6),
OPER_COMMENT varchar2(100)
);

-- conn l2ccs

grant select on pdc_heat to l2cpr;
grant select on pdc_piece to l2cpr;
grant select on pdc_slab to l2cpr;
grant select on pdc_sequence to l2cpr;
grant select on pdc_engineering_event to l2cpr;
grant select on PD_HEAT_RSV1 to l2cpr;
grant select on pd_heat to l2cpr;
grant select on pdc_tundish_temp to l2cpr;   
grant select on L2CCS.PDC_L3_QUICK_INPUT to l2cpr;   

-- conn l2cpr
create synonym pdc_heat              for   l2ccs.pdc_heat             ;
create synonym pdc_piece             for   l2ccs.pdc_piece            ;
create synonym pdc_slab              for   l2ccs.pdc_slab             ;
create synonym pdc_sequence          for   l2ccs.pdc_sequence         ;
create synonym pdc_engineering_event for   l2ccs.pdc_engineering_event;
create synonym PD_HEAT_RSV1          for   l2ccs.PD_HEAT_RSV1         ;
create synonym pd_heat               for   l2ccs.pd_heat              ;
create synonym pdc_tundish_temp      for   l2ccs.pdc_tundish_temp     ;
create synonym PDC_L3_QUICK_INPUT for l2ccs.PDC_L3_QUICK_INPUT;

create table report_sequence
(
IDX number(10) primary key not null,
CASTER_ID number(1),
SEQ_NO varchar2(9),
MOLD_WIDTH_BOC number(6, 2),
MOLD_THICK_BOC number(5, 2),
CAST_START_TIME varchar2(23),
CAST_END_TIME varchar2(23),
SHIFT_1_DUTY number(1),
CREWID_FOR_SHIFT_1 number(1),
OPER_NAME_FOR_SHIFT_1 varchar2(20),
OPER_COMMENT_FOR_SHIFT_1 varchar2(100),
SHIFT_2_DUTY number(1),
CREWID_FOR_SHIFT_2 number(1),
OPER_NAME_FOR_SHIFT_2 varchar2(20),
OPER_COMMENT_FOR_SHIFT_2 varchar2(100),
SHIFT_3_DUTY number(1),
CREWID_FOR_SHIFT_3 number(1),
OPER_NAME_FOR_SHIFT_3 varchar2(20),
OPER_COMMENT_FOR_SHIFT_3 varchar2(100),
CAST_ABORT number(1) default 0,
CAST_ABORT_REASON Varchar2(100)
);