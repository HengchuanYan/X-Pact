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
--CCS Users

create directory DUMPDIR as 'D:\DumpDir';

drop user xpact_sys cascade;
--drop user xpact_sys_handancsp cascade;
drop user l2ccs cascade;
drop user IDSC cascade;
drop user IDSC_Offline cascade;
drop user clo cascade;
drop user castingopt cascade;
drop user hmi cascade;
drop user shiftmanagement cascade;
drop user ccc cascade;
drop user handancsp_transfer cascade;
drop user l2ems cascade;
--drop user l2mss cascade;
drop user l2cpr cascade;
drop user l2ccs_report cascade;

create user xpact_sys identified by xpact_sys default tablespace ccsdb temporary tablespace temp;
--create user xpact_sys_handancsp identified by xpact_sys default tablespace ccsdb temporary tablespace temp;
create user l2ccs identified by l2ccs default tablespace ccsdb temporary tablespace temp;
create user clo identified by clo default tablespace ccsdb temporary tablespace temp;
create user castingopt identified by castingopt default tablespace ccsdb temporary tablespace temp;
create user hmi identified by hmi default tablespace ccsdb temporary tablespace temp;
create user shiftmanagement identified by shiftmanagement default tablespace ccsdb temporary tablespace temp;
create user idsc identified by idsc default tablespace ccsdb temporary tablespace temp;
create user idsc_offline identified by idsc_offline default tablespace ccsdb temporary tablespace temp;
create user ccc identified by ccc default tablespace ccsdb temporary tablespace temp;
create user handancsp_transfer identified by handan default tablespace ccsdb temporary tablespace temp;
create user l2ems identified by l2ems default tablespace ccsdb temporary tablespace temp;
--create user l2mss identified by l2mss default tablespace ccsdb temporary tablespace temp;
create user l2cpr identified by l2cpr default tablespace ccsdb temporary tablespace temp;
create user l2ccs_report identified by report default tablespace ccsdb temporary tablespace temp;
grant connect, resource, create view, create synonym to xpact_sys, l2ccs, idsc, idsc_offline, clo, castingopt, hmi, shiftmanagement, ccc, handancsp_transfer, l2ems, l2cpr, l2ccs_report;
--grant connect, resource, create view, create synonym to xpact_sys_handancsp, l2ccs, idsc, idsc_offline, clo, castingopt, hmi, shiftmanagement, ccc, handancsp_transfer, l2ems, l2cpr, l2ccs_report;

-- IPQS Users and roles
drop user ipqs_meta cascade;
drop user ipqs_pds cascade;
drop user ipqsipqs cascade;
drop user qe01 cascade;
drop user ipqsdbadmin cascade;
drop role ipqs_user;

create user ipqs_meta identified by ipqs default tablespace ipqs temporary tablespace temp;
create user ipqs_pds identified by ipqs default tablespace ipqs temporary tablespace temp;
create user ipqsipqs identified by i default tablespace ipqs temporary tablespace temp;
create user qe01 identified by q default tablespace ipqs temporary tablespace temp;
create role ipqs_user;
create user ipqsdbadmin identified by ipqsdb default tablespace ipqs temporary tablespace temp;
grant dba to ipqsdbadmin;

grant connect, resource, create view, create synonym to ipqs_meta, ipqs_pds, ipqsipqs, qe01;

-- import data
-- map xpact_sys_handancsp to xpact_sys
-- impdp system/oracle@ccsdb directory=dumpdir schemas=(xpact_sys_handancsp) dumpfile=CCSDB.DMP logfile=XPACT_SYS_HANDANCSP_imp.log remap_schema=(xpact_sys_handancsp:xpact_sys) 
-- map xpact_sys to xpact_sys_handancsp
-- impdp system/oracle@ccsdb schemas=(xpact_sys) remap_schema=(xpact_sys:xpact_sys_handancsp) directory=DUMPDIR dumpfile=ccsdb.dmp logfile=xpact_sys_impdp.log
impdp system/oracle@ccsdb schemas=(xpact_sys) directory=DUMPDIR dumpfile=CCSDB.dmp logfile=xpact_sys_impdp.log
impdp system/oracle@ccsdb schemas=(clo) directory=DUMPDIR dumpfile=CCSDB.dmp logfile=clo_impdp.log
impdp system/oracle@ccsdb schemas=(castingopt) directory=DUMPDIR dumpfile=CCSDB.dmp logfile=castingopt_impdp.log
impdp system/oracle@ccsdb schemas=(shiftmanagement) directory=DUMPDIR dumpfile=CCSDB.dmp logfile=shiftmanagement_impdp.log
impdp system/oracle@ccsdb schemas=(l2ccs) directory=DUMPDIR dumpfile=CCSDB.dmp logfile=l2ccs_impdp.log
impdp system/oracle@ccsdb schemas=(hmi) directory=DUMPDIR dumpfile=CCSDB.dmp logfile=hmi_impdp.log
impdp system/oracle@ccsdb schemas=(idsc) directory=DUMPDIR dumpfile=CCSDB.dmp logfile=idsc_impdp.log
impdp system/oracle@ccsdb schemas=(idsc_offline) directory=DUMPDIR dumpfile=CCSDB.dmp logfile=idsc_offline_impdp.log
impdp system/oracle@ccsdb schemas=(ccc) directory=DUMPDIR dumpfile=CCSDB.dmp logfile=ccc_impdp.log
impdp system/oracle@ccsdb schemas=(handancsp_transfer) directory=DUMPDIR dumpfile=CCSDB.dmp logfile=handancsp_transfer_impdp.log
impdp system/oracle@ccsdb schemas=(l2ems) directory=DUMPDIR dumpfile=CCSDB.dmp logfile=l2ems_impdp.log
impdp system/oracle@ccsdb schemas=(l2cpr) directory=DUMPDIR dumpfile=CCSDB.dmp logfile=l2cpr_impdp.log
impdp system/oracle@ccsdb schemas=(l2ccs_report) directory=DUMPDIR dumpfile=CCSDB.dmp logfile=l2ccs_report_impdp.log

-- connect xpact_sys
grant select on EVLOG_LONG_STORAGE to l2ccs;

impdp system/oracle@ccsdb schemas=(ipqs_meta) directory=DUMPDIR dumpfile=CCSDB.dmp logfile=ipqs_meta_impdp.log
impdp system/oracle@ccsdb schemas=(ipqs_pds) directory=DUMPDIR dumpfile=CCSDB.dmp logfile=ipqs_pds_impdp.log
impdp system/oracle@ccsdb schemas=(ipqsipqs) directory=DUMPDIR dumpfile=CCSDB.dmp logfile=ipqsipqs_impdp.log
