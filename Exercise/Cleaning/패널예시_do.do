clear
set more off
browse


* 횡단면자료 예시

u 패널예시.dta,clear
keep if day==1 // 1은 그저 예시임 
*drop day

* 시계열자료

u 패널예시.dta,clear
keep if 이름=="김아무개" // 김아무개는 그저 예시임 다른 이름 입력해도 됨


* 패널 long->wide로 바꾸기

u 패널예시.dta,clear
reshape wide 달린거리 칼로리소모량, i(이름) j(day)

* 패널 wide->long으로 바꾸기

reshape long 달린거리 칼로리소모량, i(이름) j(day)





