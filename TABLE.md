
📘 mySQL의 테이블 내용 정리

📘 테이블: address / department / doctor / hospitalized / nurse / patient / patient_nurse / patient_treatment / treatment

***

#### 🔒 address : 우편번호 - 주소1

![image](https://user-images.githubusercontent.com/85846475/124137885-16bd9a80-dac1-11eb-84f4-d687ee6f1f98.png)

###### → zipcode(우편번호), address1(우편번호에 대한 주소)
   

#### 🔒 department : 부서 정보

![image](https://user-images.githubusercontent.com/85846475/124137933-22a95c80-dac1-11eb-8ce7-fd9566ad09fa.png)

###### → id(부서코드), name(부서명), place(부서위치), total_bed(총 병상수), using_bed(사용중인 병상수), manager(책임자)


#### 🔒 doctor : 의사 정보

![image](https://user-images.githubusercontent.com/85846475/124137972-2b019780-dac1-11eb-878d-080d1b9a0504.png)

###### → name(의사명), empoyee_id(사원코드), id(주민등록번호), employed(입사날짜), belong_b(소속부서)


#### 🔒 hospitalized : 입원 정보

![image](https://user-images.githubusercontent.com/85846475/124281834-1be41d80-db85-11eb-9f98-a1ace295120a.png)

###### → hospitalized_id(입원코드), patient_id(입원환자주민등록번호), entered(입원날짜), discharged(퇴원날짜), charged_dr(담당의사)


#### 🔒 nurse : 간호사 정보

![image](https://user-images.githubusercontent.com/85846475/124138073-440a4880-dac1-11eb-8ba5-707bced85367.png)

###### → name(간호사명), employee_id(사원코드), id(주민등록번호), employed(입사날짜), belong_n(소속부서)


#### 🔒 patient : 환자 정보
![image](https://user-images.githubusercontent.com/85846475/124138126-4f5d7400-dac1-11eb-8c71-f00dbba273a6.png)

###### → name(환자명), id(주민등록번호), sex(성별), zipcode(우편번호), address2(주소2), insurancecode(보험코드)


#### 🔒 patient_nurse : 담당간호사 - 환자(교차)

![image](https://user-images.githubusercontent.com/85846475/124138226-656b3480-dac1-11eb-8c28-98959008e619.png)

###### → assignedpatient_id(입원환자주민등록번호), charge_n(담당간호사사원코드)


#### 🔒 patient_treatment : 환자 - 치료(교차)

![image](https://user-images.githubusercontent.com/85846475/124138264-71ef8d00-dac1-11eb-8942-591d7de59530.png)

###### → treatedpatient_id(치료환자주민등록번호), treatment_code(치료코드)


#### 🔒 treatment : 치료

![image](https://user-images.githubusercontent.com/85846475/124138302-7ae05e80-dac1-11eb-8fe7-99cf88cbec39.png)

###### → code(치료코드), name(치료명), period(치료기간), expectedresponse(예상반응), cost(비용)


