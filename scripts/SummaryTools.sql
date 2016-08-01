select max(S.SEQ_NO), count(*) as HeatCastedInSequence, min(H.LADLE_OPEN_TIME) as Sequence_BeginTime, max(H.LADLE_CLOSE_TIME) as Sequence_ClearTime
    from pdc_heat h, pdc_sequence S
        WHERE H.LADLE_OPEN_TIME>'2015-06-19' and H.HEAT_STATUS_CODE!=2
            group by H.SEQUENCE_STEEL_ID, S.STEEL_ID having H.SEQUENCE_STEEL_ID=S.STEEL_ID  order by S.STEEL_ID;
            