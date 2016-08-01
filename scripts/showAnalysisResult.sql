SELECT 
  a.heatid as HEAT_ID, DECODE(TO_NUMBER(A.SAMPLE_LOC), 1, 'AOD', 2, 'CCM', 3, 'EAF', 4, 'LF', 'UNK') as LOCATION, 
  a.sample_no as SAMPLE_NO, a.VALID_FLAG as SAMPLE_OK,         a.taken_time taken_time, a.ANALYSIS_ID as ANALYSIS_ID, 
  LIQUID_TEMP as CALC_LIQ_TEMP, NVL(a.GRADE_CODE, '') as GRADE_CODE, 
  sum (DECODE (ae.element_name, 'C', actual_value)) "C",
  sum (DECODE (ae.element_name, 'Si', actual_value)) "Si",
  sum (DECODE (ae.element_name, 'Mn', actual_value)) "Mn",
  sum (DECODE (ae.element_name, 'S', actual_value)) "S",
  sum (DECODE (ae.element_name, 'P', actual_value)) "P",
  sum (DECODE (ae.element_name, 'Cr', actual_value)) "Cr",
  sum (DECODE (ae.element_name, 'Ni', actual_value)) "Ni",
  sum (DECODE (ae.element_name, 'Mo', actual_value)) "Mo",
  sum (DECODE (ae.element_name, 'Cu', actual_value)) "Cu",
  sum (DECODE (ae.element_name, 'Sn', actual_value)) "Sn",
  sum (DECODE (ae.element_name, 'Pb', actual_value)) "Pb",
  sum (DECODE (ae.element_name, 'Ti', actual_value)) "Ti",
  sum (DECODE (ae.element_name, 'Nb', actual_value)) "Nb",
  sum (DECODE (ae.element_name, 'N', actual_value)) "N",
  sum (DECODE (ae.element_name, 'V', actual_value)) "V",
  sum (DECODE (ae.element_name, 'W', actual_value)) "W",
  sum (DECODE (ae.element_name, 'Al', actual_value)) "Al",
  sum (DECODE (ae.element_name, 'Al_S', actual_value)) "Al_S",
  sum (DECODE (ae.element_name, 'Ca', actual_value)) "Ca",
  sum (DECODE (ae.element_name, 'As', actual_value)) "As",
  sum (DECODE (ae.element_name, 'B', actual_value)) "B",
  sum (DECODE (ae.element_name, 'Co', actual_value)) "Co",
  sum (DECODE (ae.element_name, 'Zn', actual_value)) "Zn",
  sum (DECODE (ae.element_name, 'O', actual_value)) "O",
  sum (DECODE (ae.element_name, 'Ve', actual_value)) "Ve",
  sum (DECODE (ae.element_name, 'Mg', actual_value)) "Mg",
  sum (DECODE (ae.element_name, 'Ce', actual_value)) "Ce",
  sum (DECODE (ae.element_name, 'Bi', actual_value)) "Bi",
  sum (DECODE (ae.element_name, 'Sb', actual_value)) "Sb",
  sum (DECODE (ae.element_name, 'Zr', actual_value)) "Zr",
  sum (DECODE (ae.element_name, 'H', actual_value)) "H",
  sum (DECODE (ae.element_name, 'Fe', actual_value)) "Fe"    
FROM 
    pd_analysis a, pd_analysis_entry ae    
WHERE 
    ae.analysis_id(+) = a.analysis_id 
    group by a.ANALYSIS_ID,a.GRADE_CODE,a.heatid,a.sample_loc,a.sample_no,a.VALID_FLAG, a.LIQUID_TEMP, a.taken_time 
    order by a.taken_time desc;