clear
set more off
browse


* cd "디렉토리명" // stata파일을 읽고 쓰는 곳 *를 지우고 ""안에 디렉토리를 지정해야함

****************************
* merge (1:1)
****************************

* import 

import excel merge.xlsx, sheet(master) firstrow clear //import master sheet
save master.dta,replace

import excel merge.xlsx, sheet(using) firstrow clear //import using sheet
save using.dta,replace

* merge

u master.dta,clear
merge m:m 이름 using using.dta // 이름을 기준으로 merge하기 , 1:1대신 m:m 써도 됨

****************************

***************************
* merge(m:1)
***************************

u master_m_on_1.dta,clear //master파일 로드하기
reshape long 맞틀,i(이름) j(문항) // wide->long하여  key variable을 문항으로 삼기

merge m:m 문항 using using_m_on_1.dta ,nogen 
          // 문항을 기준으로 merge하기, nogen은 _merge 변수 생성안해줌, m:1대신 m:m 써도됨
sort 이름 문항 // (이름 및 문항)으로 오름차순 정렬		  
		  
****************************		  
