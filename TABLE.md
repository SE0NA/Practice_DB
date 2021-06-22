
📘 mySQL의 테이블 내용 정리

📘 테이블: address / department / doctor / hospitalized / nurse / patient / patient_nurse / patient_treatment / treatment

***

#### 🔒 address : 우편번호 - 주소1

![image](https://user-images.githubusercontent.com/85846475/122490131-3ada9f80-d01c-11eb-9944-01fad8341442.png)

###### → zipcode(우편번호), address1(우편번호에 대한 주소)
   

#### 🔒 department : 부서 정보

![image](https://user-images.githubusercontent.com/85846475/122490151-45953480-d01c-11eb-87a2-f1b0ab985d9b.png)

###### → id(부서코드), name(부서명), place(부서위치), total_bed(총 병상수), using_bed(사용중인 병상수), manager(책임자)


#### 🔒 doctor : 의사 정보

![image](https://user-images.githubusercontent.com/85846475/122490254-8a20d000-d01c-11eb-90e1-f8f7faf2e50d.png)

###### → name(의사명), empoyee_id(사원코드), id(주민등록번호), employed(입사날짜), belong_b(소속부서)


#### 🔒 hospitalized : 입원 정보

![image](https://user-images.githubusercontent.com/85846475/122490458-03b8be00-d01d-11eb-9fcf-cf2de80ec1d7.png)

###### → patient_id(입원환자주민등록번호), entered(입원날짜), out(퇴원날짜), charged_dr(담당의사)


#### 🔒 nurse : 간호사 정보

![image](https://user-images.githubusercontent.com/85846475/122490615-5b572980-d01d-11eb-845b-dba3ca30007b.png)

###### → name(간호사명), employee_id(사원코드), id(주민등록번호), employed(입사날짜), belong_n(소속부서)


#### 🔒 patient : 환자 정보
![image](https://user-images.githubusercontent.com/85846475/122490768-affaa480-d01d-11eb-93fd-df0748ffcf66.png)

###### → name(환자명), id(주민등록번호), sex(성별), zipcode(우편번호), address2(주소2), insurancecode(보험코드)


#### 🔒 patient_nurse : 담당간호사 - 환자(교차)

![image](https://user-images.githubusercontent.com/85846475/122490797-bee15700-d01d-11eb-91fb-5a2f1ab7a81a.png)

###### → assignedpatient_id(입원환자주민등록번호), charge_n(담당간호사사원코드)


#### 🔒 patient_treatment : 환자 - 치료(교차)

![image](https://user-images.githubusercontent.com/85846475/122490888-ec2e0500-d01d-11eb-9324-e1d64708e3e6.png)

###### → treatedpatient_id(치료환자주민등록번호), treatment_code(치료코드)


#### 🔒 treatment : 치료

![image](https://user-images.githubusercontent.com/85846475/122490997-197ab300-d01e-11eb-8334-3af9b91b903f.png)

###### → code(치료코드), name(치료명), period(치료기간), expectedresponse(예상반응), cost(비용)


