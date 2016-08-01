update GCC_COPT_TUND_WGT_SPEEDCORR set description = TRIM('ST-LC  ') where tabno=1; -- ST means Structural
update GCC_COPT_TUND_WGT_SPEEDCORR set description = TRIM('ST-P   ') where tabno=2;
update GCC_COPT_TUND_WGT_SPEEDCORR set description = TRIM('ST-MC  ') where tabno=3;
update GCC_COPT_TUND_WGT_SPEEDCORR set description = TRIM('ST-HC  ') where tabno=4;
update GCC_COPT_TUND_WGT_SPEEDCORR set description = TRIM('ST-UHC1') where tabno=5;
update GCC_COPT_TUND_WGT_SPEEDCORR set description = TRIM('MA-LC  ') where tabno=6; -- MA means Micro Alloy
update GCC_COPT_TUND_WGT_SPEEDCORR set description = TRIM('MA-P   ') where tabno=7;
update GCC_COPT_TUND_WGT_SPEEDCORR set description = TRIM('MA-MC  ') where tabno=8;
update GCC_COPT_TUND_WGT_SPEEDCORR set description = TRIM('MA-HC  ') where tabno=9;
update GCC_COPT_TUND_WGT_SPEEDCORR set description = TRIM('MA-UHC1') where tabno=10;

update GCC_DSC_TEMP_PRACTICE set description = TRIM('ST-LC  ') where DSC_TEMP_TAB_NUM=1;
update GCC_DSC_TEMP_PRACTICE set description = TRIM('ST-P   ') where DSC_TEMP_TAB_NUM=2;
update GCC_DSC_TEMP_PRACTICE set description = TRIM('ST-MC  ') where DSC_TEMP_TAB_NUM=3;
update GCC_DSC_TEMP_PRACTICE set description = TRIM('ST-HC  ') where DSC_TEMP_TAB_NUM=4;
update GCC_DSC_TEMP_PRACTICE set description = TRIM('ST-UHC1') where DSC_TEMP_TAB_NUM=5;
update GCC_DSC_TEMP_PRACTICE set description = TRIM('MA-LC  ') where DSC_TEMP_TAB_NUM=6;
update GCC_DSC_TEMP_PRACTICE set description = TRIM('MA-P   ') where DSC_TEMP_TAB_NUM=7;
update GCC_DSC_TEMP_PRACTICE set description = TRIM('MA-MC  ') where DSC_TEMP_TAB_NUM=8;
update GCC_DSC_TEMP_PRACTICE set description = TRIM('MA-HC  ') where DSC_TEMP_TAB_NUM=9;
update GCC_DSC_TEMP_PRACTICE set description = TRIM('MA-UHC1') where DSC_TEMP_TAB_NUM=10;

update GCC_EMS_PRACTICE set description = TRIM('ST-LC  ') where EMS_TAB_NUM=1;
update GCC_EMS_PRACTICE set description = TRIM('ST-P   ') where EMS_TAB_NUM=2;
update GCC_EMS_PRACTICE set description = TRIM('ST-MC  ') where EMS_TAB_NUM=3;
update GCC_EMS_PRACTICE set description = TRIM('ST-HC  ') where EMS_TAB_NUM=4;
update GCC_EMS_PRACTICE set description = TRIM('ST-UHC1') where EMS_TAB_NUM=5;
update GCC_EMS_PRACTICE set description = TRIM('MA-LC  ') where EMS_TAB_NUM=6;
update GCC_EMS_PRACTICE set description = TRIM('MA-P   ') where EMS_TAB_NUM=7;
update GCC_EMS_PRACTICE set description = TRIM('MA-MC  ') where EMS_TAB_NUM=8;
update GCC_EMS_PRACTICE set description = TRIM('MA-HC  ') where EMS_TAB_NUM=9;
update GCC_EMS_PRACTICE set description = TRIM('MA-UHC1') where EMS_TAB_NUM=10;

update COPT_MT_AREA set description = TRIM('ST-LC  ') where TABNO=1;
update COPT_MT_AREA set description = TRIM('ST-P   ') where TABNO=2;
update COPT_MT_AREA set description = TRIM('ST-MC  ') where TABNO=3;
update COPT_MT_AREA set description = TRIM('ST-HC  ') where TABNO=4;
update COPT_MT_AREA set description = TRIM('ST-UHC1') where TABNO=5;
update COPT_MT_AREA set description = TRIM('MA-LC  ') where TABNO=6;
update COPT_MT_AREA set description = TRIM('MA-P   ') where TABNO=7;
update COPT_MT_AREA set description = TRIM('MA-MC  ') where TABNO=8;
update COPT_MT_AREA set description = TRIM('MA-HC  ') where TABNO=9;
update COPT_MT_AREA set description = TRIM('MA-UHC1') where TABNO=10;