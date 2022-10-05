clear
set more off
br
 
 
****************************************
* (1) 자료보기 
****************************************
 
u adverse_event.dta,clear // 마스터자료로 활용할 데이터
list ,sepby(putnum date) //자료를 putnum마다 줄그으며(sepby(putnum)) 보기
 
u concomitant_medication.dta // 유징자료로 활용할 데이터
list ,sepby(putnum date) //자료를 putnum마다 줄그으며(sepby(putnum)) 보기
 
 
****************************************
 
*************************************************
* (2) merge m:m ; 의도한 merge가 아님
*************************************************
 
u adverse_event.dta,clear
merge m:m putnum date  using concomitant_medication.dta 
 
list ,sepby(putnum date)
 
************************************************
 
*************************************************
* (3) joinby; 우리가 의도한 merge
*************************************************
 
* inner merge
 
u adverse_event.dta,clear
joinby putnum date using concomitant_medication.dta 
list ,sepby(putnum date)
 
* outer merge
 
u adverse_event.dta,clear
joinby putnum date using concomitant_medication.dta , unmatched(both)
list ,sepby(putnum date)
 
*************************************************