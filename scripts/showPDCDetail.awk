awk -F"|" '{print $1" Arm1InCastPos:[" $14 "], Arm1LdlOpenWgt:[" $40 "], Arm2InCastPos:[" $15 "], Arm2LdlOpenWgt:["$42"]"}'

awk -F"|" '{print $1" LO:[" $9 "], Arm1:[" $14 "], Ldl1Wgt:[" $40 "], Arm2:[" $15 "], Ldl2Wgt:["$42"]"}'

awk -F"|" '{printf "%-20s: LSGO:[%1d], LO:[%1d], ArmNoInCast:[%1d], Arm1:[%1d], Ldl1Wgt:[%10d], Arm2:[%1d], Ldl2Wgt:[%10d]\n", substr($1, 0, 19), $37, $9, $28, $14, $40, $15, $42}'

awk -F"|" '{printf "%s, cutEv:[%d], slabNo:[%s], psLen:[%d], castLenWhenCut:[%d], cutStat:[%d],cutType:[%d], lenPastCutter[%d], cutterActPos[%d]\n", substr($1,0, 19), $5, $6, $7, $10, $11, $8, $14, $15}'


awk -F"|" '{printf "TIME:%s, car1Dlv:%d, car2Dlv:%d, ladleInLoadPos:%d, car1ILP:%d, car2ILP:%d, car1ICP:%d, car2ICP:%d, car1Wgt:%d, car2Wgt:%d\n", substr($1,0, 19) , $5, $6, $7, $9, $10, $19, $20,$21, $23}' SEL_TlgReceiver_15-02-28_081114.log