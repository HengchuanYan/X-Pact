create user handancsp_transfer       identified by handan       default tablespace ccsdb temporary tablespace temp;
grant connect, resource, create view, create synonym, create database link to handancsp_transfer;

DROP TABLE X_SMC_STEEL_ANALYSIS CASCADE CONSTRAINT;

CREATE TABLE X_SMC_STEEL_ANALYSIS
(
    MSG_INFO NUMBER(8),
    DATI_MSG_SENT DATE NOT NULL,
    HEAT_ID VARCHAR2(10) NOT NULL,
    STAION_ID VARCHAR2(4),
    SAMPLE_TYPE NUMBER(2) NOT NULL,
    SAMPLE_POS NUMBER(2) NOT NULL,
    L3_HEAT_ID VARCHAR2(8),
    GRADE_ID VARCHAR2(12),
    DATI_ANALYSIS_TAKEN DATE,
    VALUE_C number(7,4),
    VALUE_SI        number(7,4),
    VALUE_MN    number(7,4),
    VALUE_P     number(7,4),
    VALUE_S     number(7,4),
    VALUE_CU    number(7,4),
    VALUE_SN    number(7,4),
    VALUE_NI    number(7,4),
    VALUE_CR    number(7,4),
    VALUE_MO    number(7,4),
    VALUE_AS    number(7,4),
    VALUE_AL_T  number(7,4),
    VALUE_V     number(7,4),
    VALUE_NB    number(7,4),
    VALUE_PB    number(7,4),
    VALUE_AL_S  number(7,4),
    VALUE_TI    number(7,4),
    VALUE_CA    number(7,4),
    VALUE_O     number(7,4),
    VALUE_N     number(7,4),
    VALUE_H     number(7,4),
    VALUE_B     number(7,4),
    VALUE_AL    number(7,4),
    VALUE_CO    number(7,4),
    VALUE_ZN    number(7,4),
    VALUE_SE    number(7,4),
    VALUE_ZR    number(7,4),
    VALUE_W     number(7,4),
    VALUE_SB    number(7,4),
    VALUE_MG    number(7,4),
    VALUE_TE    number(7,4),
    VALUE_BI    number(7,4)
);
alter table X_SMC_STEEL_ANALYSIS add constraint X_SMC_STEEL_ANALYSIS_PK primary key(HEAT_ID, SAMPLE_POS, SAMPLE_TYPE);
grant select, delete on X_SMC_STEEL_ANALYSIS to l2ccs;

--conn as l2ccs
CREATE SEQUENCE SEQ_LAB_ANALYSIS_MSG_ID START WITH 1 MAXVALUE 9999999999 MINVALUE 1 CYCLE CACHE 2 NOORDER;
grant select on SEQ_LAB_ANALYSIS_MSG_ID to handancsp_transfer;

drop table X_SMC_STEEL_ANALYSIS;
CREATE TABLE X_SMC_STEEL_ANALYSIS
(
		IDX NUMBER(10),
		DATETIME DATE default sysdate NOT NULL,
		PROC_FLAG NUMBER(1) default 0 NOT NULL,
    MSG_INFO NUMBER(8),
    DATI_MSG_SENT DATE,
    HEAT_ID VARCHAR2(10),
    STAION_ID VARCHAR2(4),
    SAMPLE_TYPE NUMBER(2),
    SAMPLE_POS NUMBER(2),
    L3_HEAT_ID VARCHAR2(8),
    GRADE_ID VARCHAR2(12),
    DATI_ANALYSIS_TAKEN DATE,
    VALUE_C number(7,4),
    VALUE_SI        number(7,4),
    VALUE_MN    number(7,4),
    VALUE_P     number(7,4),
    VALUE_S     number(7,4),
    VALUE_CU    number(7,4),
    VALUE_SN    number(7,4),
    VALUE_NI    number(7,4),
    VALUE_CR    number(7,4),
    VALUE_MO    number(7,4),
    VALUE_AS    number(7,4),
    VALUE_AL_T  number(7,4),
    VALUE_V     number(7,4),
    VALUE_NB    number(7,4),
    VALUE_PB    number(7,4),
    VALUE_AL_S  number(7,4),
    VALUE_TI    number(7,4),
    VALUE_CA    number(7,4),
    VALUE_O     number(7,4),
    VALUE_N     number(7,4),
    VALUE_H     number(7,4),
    VALUE_B     number(7,4),
    VALUE_AL    number(7,4),
    VALUE_CO    number(7,4),
    VALUE_ZN    number(7,4),
    VALUE_SE    number(7,4),
    VALUE_ZR    number(7,4),
    VALUE_W     number(7,4),
    VALUE_SB    number(7,4),
    VALUE_MG    number(7,4),
    VALUE_TE    number(7,4),
    VALUE_BI    number(7,4)
);
alter table X_SMC_STEEL_ANALYSIS add constraint X_SMC_STEEL_ANALYSIS_PK primary key(IDX);
grant select, insert on X_SMC_STEEL_ANALYSIS to handancsp_transfer;

CREATE SYNONYM X_LAB_STEEL_ANALYSIS for handancsp_transfer.X_SMC_STEEL_ANALYSIS;

--conn as handancsp_transfter

create synonym SEQ_LAB_ANALYSIS_MSG_ID for L2CCS.SEQ_LAB_ANALYSIS_MSG_ID;

create or replace trigger X_SMC_STEEL_ANALYSIS_AI after insert ON X_SMC_STEEL_ANALYSIS for each row 
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
    end X_SMC_STEEL_ANALYSIS_AI;

--- for quality process
-- conn handan_transfer/handan@ccsdb

DROP TABLE X_PROCESS_INFO CASCADE CONSTRAINT;
CREATE TABLE X_PROCESS_INFO
(
    STRAND_NO 						NUMBER(8) NOT NULL,
    DATI_MSG_SENT 					DATE default sysdate NOT NULL,
    HEAT_ID 								VARCHAR2(10),
    GRADE_CODE 							VARCHAR2(12),
    SUPER_HEAT 							NUMBER(4), -- reserver
    VALUE_C 								NUMBER(7,4),
    VALUE_SI        				NUMBER(7,4),
    VALUE_MN    						NUMBER(7,4),
    VALUE_P     						NUMBER(7,4),
    VALUE_S     						NUMBER(7,4),
    VALUE_AL_S  						NUMBER(7,4),
    VALUE_AL    						NUMBER(7,4),
    SMC_SOFTBUB_TIME 				NUMBER(4),
    LANCING 								NUMBER(1),
    UNSHROUD_CASTING 				NUMBER(1),
    TUNDISH_LEVEL 					NUMBER(7,2),
    MOLD_LEVEL_VAR 					NUMBER(7,2),
    BPS_ALARM 							NUMBER(1),
    MOLD_WATER_TEMP_INLET NUMBER(5, 2),
    MOLD_WATER_AMOUNT_INLET NUMBER(7, 2),
    SPRAY_WATER_TEMP_INLET NUMBER(5, 2),
    SPRAY_WATER_AMOUNT_INLET NUMBER(7, 2),
    SEGMENT_STAND_STILL NUMBER(1)
);
alter table X_PROCESS_INFO add constraint X_PROCESS_INFO_PK primary key(STRAND_NO);

-- conn l2ccs
create synonym X_PROCESS_INFO for handan_transfer.X_PROCESS_INFO;

-- for SMC
drop table X_SMC_HEAT_DATA cascade constraint;
drop table X_SMC_HEAT_DATA_MOD cascade constraint;
drop sequence SEQ_SMC_HEAT_MSG_ID;
drop sequence SEQ_SMC_HEATMOD_MSG_ID;


CREATE SEQUENCE SEQ_SMC_HEAT_MSG_ID START WITH 1 MAXVALUE 9999999999 MINVALUE 1 CYCLE CACHE 2 NOORDER;
CREATE TABLE X_SMC_HEAT_DATA (
IDX             VARCHAR2(10)  NOT NULL,
DATETIME        DATE DEFAULT SYSDATE NOT NULL,
READFLAG NUMBER(1) DEFAULT 0 NOT NULL,
MSG_COUNTER     VARCHAR2(16) ,
MSG_STATUS      NUMBER       ,
MSG_DATETIME    VARCHAR2(20) ,
EVENN           VARCHAR2(10) ,    -- PLANT CODE, 30:BOF, 40:LF, 50:CASTER
FEATN           VARCHAR2(20) ,    -- HEAT_ID
FEAV1           VARCHAR2(50) ,
FEATT           VARCHAR2(23),
FGDLW           CHAR(1)      ,
PRSTU           VARCHAR2(10) ,
FEAV2           VARCHAR2(50) ,    --SEQ_NO: 8DIGIT, YYMMCA(/B)NN, NN IS SEQNO OF CURRENT MONTH
FEAV3           VARCHAR2(50) ,    -- STEEL GRADE
FEAV4           VARCHAR2(50) ,    -- LADLE NO
FEAV5           VARCHAR2(50) ,    -- STEEL WEIGHT
FEAV6           VARCHAR2(50) ,    -- HEAT NO IN SEQUENCE
FEAV7           VARCHAR2(10) ,    -- SMC ROUTE
FEAV8           VARCHAR2(10)      -- CASTER ROUTE
);
ALTER TABLE X_SMC_HEAT_DATA ADD CONSTRAINT X_SMC_HEAT_DATA_PK PRIMARY KEY(IDX);

CREATE SEQUENCE SEQ_SMC_HEATMOD_MSG_ID START WITH 1 MAXVALUE 9999999999 MINVALUE 1 CYCLE CACHE 2 NOORDER;
CREATE TABLE X_SMC_HEAT_DATA_MOD(
IDX             VARCHAR2(10) NOT NULL,
DATETIME        DATE DEFAULT SYSDATE NOT NULL,
READFLAG NUMBER(1) DEFAULT 0 NOT NULL,
MSG_COUNTER     VARCHAR2(16) ,
MSG_STATUS      NUMBER                 ,
MSG_DATETIME    VARCHAR2(20)           ,
CMDTP           VARCHAR2(2)            , -- ALWAYS 22, IT MEANS IT IS A HEAT FROM SLAB CASTER 
MCSTS           VARCHAR2(10)           , -- ORIGIN SEQ NO
MCSTG           VARCHAR2(10)           , -- TARGET SEQ NO
MSTON           VARCHAR2(10)           , -- HEAT ID
RDATE           VARCHAR2(23)           ,
ATTR1           VARCHAR2(40)           ,
ATTR2           VARCHAR2(40)           ,
ATTR3           VARCHAR2(40)           , -- ORIGIN STEEL GRADE
ATTR4           VARCHAR2(40)           , -- TARGET STEEL GRADE
ATTR5           VARCHAR2(40)            -- ACUTAL STEEL GRADE
);
ALTER TABLE X_SMC_HEAT_DATA_MOD ADD CONSTRAINT X_SMC_HEAT_DATA_MOD_PK PRIMARY KEY(IDX);

ALTER TABLE L2CCS.PD_HEAT_MES
 DROP PRIMARY KEY CASCADE;
DROP TABLE L2CCS.PD_HEAT_MES CASCADE CONSTRAINTS;

CREATE TABLE L2CCS.PD_HEAT_MES
(
  HEATID             VARCHAR2(10)          NOT NULL,
  HEATSTATUSNO       NUMBER(3),
  PLANT_UNIT         VARCHAR2(2),
  PLANT_ID                    NUMBER(2),
  LADLE_NO           VARCHAR2(3),
  GRADE_CODE         VARCHAR2(15),
  PONO                            VARCHAR2(10),
  SEQ_NO                        VARCHAR(10),
  LADLE_TARE_WEIGHT  NUMBER(6),
  HEAT_START_TIME    CHAR(23),
  HEAT_END_TIME      CHAR(23),
  TAP_DURATION       NUMBER(3),
  TAP_HOLE_AGE       NUMBER(5),
  START_TEMP         NUMBER(4),
  LAST_TEMP          NUMBER(4),
  LAST_TEMP_TIME     CHAR(23),
  STEEL_MASS         NUMBER(6),
  SLAG_MASS          NUMBER(6),
  AR_EMERG_USED      NUMBER(1),
  INC_SLAG_FLOW      NUMBER(1),
  TOP_DESLAG         NUMBER(1),
  TOP_SLAG_DES       NUMBER(1),
  POR_PLUG_DEFECT    NUMBER(1),
  CA_FEED_SPEED      NUMBER(5,1),
  AL_ADDED           NUMBER(6),
  OX_FREE            NUMBER(10,4),
  CA_SOFTBU_TIME     NUMBER(5),
  TIME_STAMP         CHAR(23),
  OX_FREE_TAP        NUMBER(7,4),
  C_FIN_TAP          NUMBER(10,6),
  TREAT_TIME         NUMBER(2),
  AR_FLOW_TOT        NUMBER(5),
  LADLE_LIFE         NUMBER(3),
  CA_ADDED           NUMBER(4),
  TAP_TIME           NUMBER(3),
  TREAT_COUNTER      NUMBER(2)                  DEFAULT 1,
  HEAT_SEQ_NO        NUMBER(3)                  DEFAULT 1                     NOT NULL
);

alter table PD_HEAT_MES add constraint PD_HEAT_MES_PK primary key (HEATID);
alter table PD_HEAT_MES add constraint PD_HEAT_MES_HEATSTATUS_FK foreign key (HEATSTATUSNO) references GD_HEAT_STATUS (HEATSTATUSNO);


alter table x_smc_heat_data add MSG_STATUS_CSP number(1) default 0 not null;
alter table x_smc_heat_data_mod add MSG_STATUS_CSP number(1) default 0 not null;

alter table pd_heat_mes add seq_id varchar2(9);

-- conn system
grant create database link to l2ccs;
--conn L2CCS
CREATE DATABASE LINK L2CCS_C1 CONNECT TO L2CCS IDENTIFIED BY L2CCS USING '(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = 172.24.3.122)(PORT = 1521))) (CONNECT_DATA=(SERVICE_NAME =CCSDB)))';


---MES system
CREATE TABLE COVE ( 
  STRAND_NO               NUMBER (1), 
  POSI1_SEQU_NO           VARCHAR2 (7), 
  POSI1_HEAT_POS          NUMBER, 
  POSI1_HEAT_ID           VARCHAR2 (10), 
  POSI1_CASTER_STRING_NO  NUMBER, 
  POSI1_HEAT_STRING_NO    NUMBER, 
  POSI1_LADLE_NO          NUMBER, 
  POSI1_STEELGROUP        NUMBER, 
  POSI1_STEELGRADE        VARCHAR2 (12), 
  POSI1_STEELGRADE_TEXT   VARCHAR2 (25), 
  POSI2_SEQU_NO           VARCHAR2 (7), 
  POSI2_HEAT_POS          NUMBER, 
  POSI2_HEAT_ID           VARCHAR2 (10), 
  POSI2_CASTER_STRING_NO  NUMBER, 
  POSI2_HEAT_STRING_NO    NUMBER, 
  POSI2_LADLE_NO          NUMBER, 
  POSI2_STEELGROUP        NUMBER, 
  POSI2_STEELGRADE        VARCHAR2 (12), 
  POSI2_STEELGRADE_TEXT   VARCHAR2 (24), 
  POSI3_SEQU_NO           VARCHAR2 (7), 
  POSI3_HEAT_POS          NUMBER, 
  POSI3_HEAT_ID           VARCHAR2 (10), 
  POSI3_CASTER_STRING_NO  NUMBER, 
  POSI3_HEAT_STRING_NO    NUMBER, 
  POSI3_LADLE_NO          NUMBER, 
  POSI3_STEELGROUP        NUMBER, 
  POSI3_STEELGRADE        VARCHAR2 (12), 
  POSI3_STEELGRADE_TEXT   VARCHAR2 (24), 
  POSI4_SEQU_NO           VARCHAR2 (7), 
  POSI4_HEAT_POS          NUMBER, 
  POSI4_HEAT_ID           VARCHAR2 (10), 
  POSI4_CASTER_STRING_NO  NUMBER, 
  POSI4_HEAT_STRING_NO    NUMBER, 
  POSI4_LADLE_NO          NUMBER, 
  POSI4_STEELGROUP        NUMBER, 
  POSI4_STEELGRADE        VARCHAR2 (12), 
  POSI4_STEELGRADE_TEXT   VARCHAR2 (24), 
  POSI5_SEQU_NO           VARCHAR2 (7), 
  POSI5_HEAT_POS          NUMBER, 
  POSI5_HEAT_ID           VARCHAR2 (10), 
  POSI5_CASTER_STRING_NO  NUMBER, 
  POSI5_HEAT_STRING_NO    NUMBER, 
  POSI5_LADLE_NO          NUMBER, 
  POSI5_STEELGROUP        NUMBER, 
  POSI5_STEELGRADE        VARCHAR2 (12), 
  POSI5_STEELGRADE_TEXT   VARCHAR2 (24), 
  POSI6_SEQU_NO           VARCHAR2 (7), 
  POSI6_HEAT_POS          NUMBER, 
  POSI6_HEAT_ID           VARCHAR2 (10), 
  POSI6_CASTER_STRING_NO  NUMBER, 
  POSI6_HEAT_STRING_NO    NUMBER, 
  POSI6_LADLE_NO          NUMBER, 
  POSI6_STEELGROUP        NUMBER, 
  POSI6_STEELGRADE        VARCHAR2 (12), 
  POSI6_STEELGRADE_TEXT   VARCHAR2 (24), 
  TAZO1_TYP               VARCHAR2 (1), 
  TAZO1_REL_DIST          NUMBER, 
  TAZO1_LENGTH            NUMBER, 
  TAZO2_TYP               VARCHAR2 (1), 
  TAZO2_REL_DIST          NUMBER, 
  TAZO2_LENGTH            NUMBER, 
  TAZO3_TYP               VARCHAR2 (1), 
  TAZO3_REL_DIST          NUMBER, 
  TAZO3_LENGTH            NUMBER, 
  TAZO4_TYP               VARCHAR2 (1), 
  TAZO4_REL_DIST          NUMBER, 
  TAZO4_LENGTH            NUMBER, 
  TAZO5_TYP               VARCHAR2 (1), 
  TAZO5_REL_DIST          NUMBER, 
  TAZO5_LENGTH            NUMBER, 
  TAZO6_TYP               VARCHAR2 (1), 
  TAZO6_REL_DIST          NUMBER, 
  TAZO6_LENGTH            NUMBER, 
  TAZO7_TYP               VARCHAR2 (1), 
  TAZO7_REL_DIST          NUMBER, 
  TAZO7_LENGTH            NUMBER, 
  TAZO8_TYP               VARCHAR2 (1), 
  TAZO8_REL_DIST          NUMBER, 
  TAZO8_LENGTH            NUMBER, 
  TAZO9_TYP               VARCHAR2 (1), 
  TAZO9_REL_DIST          NUMBER, 
  TAZO9_LENGTH            NUMBER, 
  TAZO10_TYP              VARCHAR2 (1), 
  TAZO10_REL_DIST         NUMBER, 
  TAZO10_LENGTH           NUMBER, 
  LIQU_TEMP               NUMBER, 
  LADLE_WEIGHT            NUMBER, 
  TUND_WEIGHT             NUMBER, 
  TUND_OPEN               NUMBER, 
  TAILOUT_LENGTH          NUMBER, 
  SURF_TEMP_PINCH         NUMBER, 
  SURF_TEMP_SHEAR         NUMBER, 
  STRAND_LENGTH           NUMBER, 
  REF_SPEED_ANAL          NUMBER, 
  REF_SPEED_WEIGHT        NUMBER, 
  REF_SPEED_MIN           NUMBER, 
  REF_SPEED_MAX           NUMBER, 
  ACT_CAST_SPEED          NUMBER, 
  REF_SPEED_HPAC          NUMBER, 
  NEXT_SLAB_POS           NUMBER, 
  NEXT_CUT_LENGTH         NUMBER, 
  LAST_SLAB_POS           NUMBER, 
  LAST_CUT_LENGTH         NUMBER, 
  LADLE_OPEN              NUMBER, 
  LADLE_LOAD_POS          NUMBER, 
  LADLE_CAST_POS          NUMBER, 
  COUNTDOWN_STOP          NUMBER, 
  CAST_LENGTH_STOP        NUMBER, 
  CAST_LENGTH             NUMBER, 
  ACT_WIDTH               NUMBER, 
  ACT_THICK               NUMBER (3,1), 
  LAST_LADLE_TEMP         NUMBER, 
  EST_TURR_TIME           VARCHAR2 (5), 
  LIQUID_STEEL_WEIGHT     NUMBER, 
  AIM_CAST_TEMP           NUMBER, 
  TUND_TEMP               NUMBER, 
  FIX_SIDE_HEAT_FLUX      NUMBER, 
  LOS_SIDE_HEAT_FLUX      NUMBER, 
  NAR_LEFT_HEAT_FLUX      NUMBER, 
  NAR_RIGHT_HEAT_FLUX     NUMBER, 
  FIX_SIDE_ENERG_TRANS    NUMBER, 
  LOS_SIDE_ENERG_TRANS    NUMBER, 
  NAR_LEFT_ENERG_TRANS    NUMBER, 
  NAR_RIGHT_ENERG_TRANS   NUMBER, 
  CONN_STAT_RECV_D1       NUMBER, 
  CONN_STAT_RECV_P1       NUMBER, 
  CONN_STAT_RECV_T1       NUMBER, 
  CONN_STAT_SEND_D1       NUMBER, 
  CONN_STAT_SEND_P1       NUMBER, 
  CONN_STAT_SEND_T1       NUMBER, 
  OFF_MODE_CM             NUMBER, 
  DUMMY_BAR_INS_MOD       NUMBER, 
  CAST_MODE               NUMBER, 
  TAIL_OUT_MOD            NUMBER, 
  MAINT_MOD               NUMBER, 
  SIMU_MOD                NUMBER, 
  CONN_STAT_SEND_DSC      NUMBER, 
  CONN_STAT_RECV_DSC      NUMBER, 
  CONN_STAT_APIL          NUMBER);
alter table cove add constraint COVE_PK primary key(STRAND_NO);
X_PDC_FRIEND_CASTER_STATUS

-- extend info from meltshop
alter table pd_heat add
(
	HEAT_CLASS VARCHAR2(2),
	FREE_BOARD NUMBER(3),
	LF_PLANT_ID VARCHAR2(1)
);

alter table pd_heat modify HEAT_CLASS default 'C';
alter table pd_heat modify FREE_BOARD default 5;

alter table pdc_sequence add seq_no_alias varchar2(10);
alter table pdc_heat add
(
	HEAT_CLASS VARCHAR2(2),
	FREE_BOARD NUMBER(3),
	LF_PLANT_ID VARCHAR2(1),
	HEATID_ALIAS VARCHAR2(10)
);

COMMENT ON COLUMN pdc_heat.HEAT_CLASS IS 'Heat quality class info from meltshop';
COMMENT ON COLUMN PDC_HEAT.FREE_BOARD IS 'Ladle free board';
COMMENT ON COLUMN PDC_HEAT.LF_PLANT_ID IS 'Route info about LF';
COMMENT ON COLUMN PDC_HEAT.HEATID_ALIAS IS 'Alias name for heat id';


alter table pdc_operator_input add
(
	HEAT_CLASS VARCHAR2(2),
	FREE_BOARD NUMBER(3),
	LF_PLANT_ID VARCHAR2(1)
);

COMMENT ON COLUMN pdc_heat.HEAT_CLASS IS 'Heat quality class info from meltshop';
COMMENT ON COLUMN PDC_HEAT.FREE_BOARD IS 'Ladle free board';
COMMENT ON COLUMN PDC_HEAT.LF_PLANT_ID IS 'Route info about LF';

alter table pdc_l3_quick_input add seq_id_factor varchar2(10);
alter table pd_heat add heatid_alias varchar2(10);
COMMENT ON COLUMN PD_HEAT.heatid_alias IS 'Provide the chance to rename heatid from meltshop style to caster style';
alter table pdc_tundish_temp add meas_type number(1);
COMMENT ON COLUMN pdc_tundish_temp.meas_type IS 'Indicator for temperature measurement type, 1. lance 2. continous';



Insert into L2CCS.GCC_VALUE_DEF
   (VAL_NAME, VAL_DESC, STEEL_TYPE)
 Values
   ('LfPlantId', 'LF plant ID', 'HEAT');
Insert into L2CCS.GCC_VALUE_DEF
   (VAL_NAME, VAL_DESC, STEEL_TYPE)
 Values
   ('LdlFreeBoard', 'ladle free board', 'HEAT');
Insert into L2CCS.GCC_VALUE_DEF
   (VAL_NAME, VAL_DESC, STEEL_TYPE)
 Values
   ('HeatQualClass', 'heat quality info from SMC', 'HEAT');
Insert into L2CCS.GCC_VALUE_DEF
   (VAL_NAME, VAL_DESC, STEEL_TYPE)
 Values
   ('CastSeqNoAlias', 'second name for sequence', 'HEAT');
Insert into L2CCS.GCC_VALUE_DEF
   (VAL_NAME, VAL_DESC, STEEL_TYPE)
 Values
   ('HeatIdAlias', 'second name for heat', 'HEAT');
COMMIT;