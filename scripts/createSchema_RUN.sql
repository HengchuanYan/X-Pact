--install oracle server.
-- SQLNET.EXPIRE_TIME set to 1 in db server
-- expdp system/oracle@ccsdb schemas=(xpact_sys, l2ccs, clo, castingopt, hmi, shiftmanagement, idsc, idsc_offline, qual) directory=DUMPDIR dumpfile=CCS.dmp logfile=CCS.log
CREATE TABLESPACE CCSDB DATAFILE 'D:\app\product\oradata\CCSDB\CCSDB01.DBF' SIZE 10000M
     autoextend on maxsize unlimited
   EXTENT MANAGEMENT LOCAL
   SEGMENT SPACE MANAGEMENT AUTO;
   
CREATE TABLESPACE IPQS DATAFILE 'D:\app\product\oradata\CCSDB\IPQSDB01.DBF' SIZE 20000M
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

create user xpact_sys       identified by xpact_sys       default tablespace ccsdb temporary tablespace temp;
create user l2ccs           identified by l2ccs           default tablespace ccsdb temporary tablespace temp;
create user clo             identified by clo             default tablespace ccsdb temporary tablespace temp;
create user castingopt      identified by castingopt      default tablespace ccsdb temporary tablespace temp;
create user hmi             identified by hmi             default tablespace ccsdb temporary tablespace temp;
create user shiftmanagement identified by shiftmanagement default tablespace ccsdb temporary tablespace temp;
create user idsc            identified by idsc            default tablespace ccsdb temporary tablespace temp;
create user idsc_offline    identified by idsc_offline    default tablespace ccsdb temporary tablespace temp;
create user ccc             identified by ccc    default tablespace ccsdb temporary tablespace temp;
create user handancsp_transfer identified by handan    default tablespace ccsdb temporary tablespace temp;

grant connect, resource, create view, create synonym to xpact_sys, l2ccs, idsc, idsc_offline, clo, castingopt, hmi, shiftmanagement, ccc, handancsp_transfer;

--imp system/oracle@ccsdb file=fuxin.dmp log = xpact_sys.log 				fromuser=xpact_sys 				touser=xpact_sys       ;
--imp system/oracle@ccsdb file=fuxin.dmp log = l2ccs.log 						fromuser=l2ccs 						touser=l2ccs           ;
--imp system/oracle@ccsdb file=fuxin.dmp log = swm.log 							fromuser=swm              touser=swm             ;
--imp system/oracle@ccsdb file=fuxin.dmp log = clo.log 							fromuser=clo              touser=clo             ;
--imp system/oracle@ccsdb file=fuxin.dmp log = castingopt.log 			fromuser=castingopt       touser=castingopt      ;
--imp system/oracle@ccsdb file=fuxin.dmp log = hmi.log 							fromuser=hmi              touser=hmi             ;
--imp system/oracle@ccsdb file=fuxin.dmp log = shiftmanagement.log 	fromuser=shiftmanagement  touser=shiftmanagement ;

--impdp system/oracle@ccsdb schemas=(xpact_sys, l2ccs, clo, castingopt, hmi, shiftmanagement) directory=DUMPDIR dumpfile=ccs.dmp logfile=_impdp.log
--impdp system/oracle@ccsdb schemas=(xpact_sys_puyang) directory=DUMPDIR dumpfile=CCSDB_20150819.dmp remap_schema=(xpact_sys_puyang:xpact_sys) logfile=xpact_sys_impdp.log
impdp system/oracle@ccsdb directory=dumpdir schemas=(xpact_sys_handancsp) dumpfile=CCSDB_20151227.DMP logfile=XPACT_SYS_HANDANCSP_imp.log remap_schema=(xpact_sys_handancsp:xpact_sys) 
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

grant connect, resource, create view, create synonym to ipqs_meta, ipqs_pds, ipqsipqs, qe01;

--imp system/oracle@ccsdb file=fuxin.dmp log = ipqs_meta.log fromuser=ipqs_fuxin_meta touser=ipqs_meta;
--imp system/oracle@ccsdb file=fuxin.dmp log = ipqs_pds.log fromuser=ipqs_fuxin_pds touser=ipqs_pds;
--imp system/oracle@ccsdb file=fuxin.dmp log = ipqsipqs.log fromuser=ipqsipqs touser=ipqsipqs;

impdp system/oracle@ccsdb schemas=(ipqs_meta) directory=DUMPDIR dumpfile=IPQS_20150819.dmp logfile=ipqs_meta.log
--impdp system/oracle@ipqsdb remap_schema=ipqs_meta:ipqs_meta_sde directory=DUMPDIR_IPQS remap_tablespace=ccsdb:ipqs dumpfile=CCSDB_EXPDP_2013_05_06_15_00.dmp logfile=ipqs_meta.log
impdp system/oracle@ccsdb schemas=(ipqs_pds) directory=DUMPDIR dumpfile=IPQS_20150819.dmp logfile=ipqs_pds.log 
impdp system/oracle@ccsdb schemas=(ipqsipqs) directory=DUMPDIR dumpfile=IPQS_20150819.dmp logfile=ipqsipqs.log 
-- select * from dba_directories;
--expdp system/oracle@ccsdb schemas=(l2ccs, hmi, castingopt, clo, xpact_sys, shiftmanagement, IDSC, IDSC_Offline, handancsp_transfer, ccc, l2cpr, l2ccs_report, l2ems, ipqs_pds, ipqs_meta, ipqsipqs, qe01) directory=DUMPDIR dumpfile=ccsdb.dmp logfile=ccsdb.log
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
