### 소스 목록

#### 💡 메인 💡
소스 | 내용
---- | ----
manage_form.jsp | 병원 관리 시스템의 첫화면. 환자/병원을 선택하여 해당 관리자 메뉴로 이동</BR> 환자 선택 → patient_page.jsp </BR>병원 선택 → hospital_page.jsp <BR>

![image](https://user-images.githubusercontent.com/85846475/123762673-fe515280-d8fd-11eb-9522-3754e60e48bf.png)

</BR>

***

#### 💡 환자 관리 💡
소스 | 내용
---- | ----
patient_page.jsp | 환자 정보를 검색, 추가. </BR> 이름입력+검색</BR> 신규 → patient_add.jsp
patient_add.jsp | 신규 환자 등록 페이지 </BR> SQL에 insert 신규 환자 데이터
patient_add2.jsp | patient_add.jsp에서 입력한 데이터 확인 </BR> null값, 자리수 체크(hisory back();)
this_patient.jsp | patient_page.jsp에서 환자리스트의 정보 클릭시 실행. 해당 환자 정보 출력, 입원 내역 추가.
patient_hospitalized.jsp | patient_page.jsp에서 환자리스트의 입원 클릭시 실행.
patient_hospitalized_dr.jsp | patient_hospitalized.jsp에서 입원 환자를 담당할 의사를 리스트에서 선택하여 값을 전송
patient_hospitalized2.jsp | patient_hospitalized.jsp의 입원 정보를 확인하고 mysql에 저장

###### 기능 체크
🟢완료 🟡구현중 🔴필요
> 🟢 환자 추가([신규] → 환자정보입력 → mysql 저장 완료)</br>
> 🟢 환자 리스트 출력(patient_page.jsp, mysql에서 환자 정보 읽기 가능)</br>
> 🟢 환자 검색(patient_page.jsp, 환자 이름을 이용해 mysql에서 해당 이름의 환자 가져오기 가능)</br>
> 🟢 환자 정보([정보] → this_patient.jsp → 선택한 환자의 기본 정보+입원 정보 출력 가능)</br>
> 🟡 환자 입원([입원]→입력한 입원 정보(의사 정보 팝업 불러오기X) mysql에 추가 가능)</br>
> 🔴 입원 환자 - 간호사 내용</br>
> 🔴 환자 입원시 부서의 사용 병상수 +1</br>

***

#### 💡 병원 관리 💡
소스 | 내용
---- | ----
hospital_form.jsp | 부서, 직원, 치료 form으로 이동

###### 기능 체크
🟢완료 🟡 구현중 🔴필요
> 🔴 로그인(병원 관리 시스템 접속)</br>
> 🟡 부서 관리(추가, 수정)</br>
> 🔴 직원(의사, 간호사) 관리(추가, 수정)</br>
> 🔴 치료 관리 (추가, 수정)

***

#### 💡 부서 관리 💡
소스 | 내용
---- | ----
department_page.jsp | 부서 정보를 확인, 추가, 수정
department_add.jsp | 신규 부서 추가(책임자=null)
department_add2.jsp | department_add.jsp에서 입력한 정보로 mysql에 새로운 행 추가
department_update.jsp | 선택한 부서의 정보 수정

###### 기능 체크
🟢완료 🟡구현중 🔴필요
> 🟢 부서 리스트 구현</br>
> 🟢 부서 추가(department_add.jsp)
> 🔴 부서 수정 기능

***

#### 💡 직원 관리 💡
소스 | 내용
---- | ----
member_page.jsp | 직원 정보를 확인, 추가, 수정
member_add.jsp | 신규 직원 추가
member_add2.jsp | member_add.jsp에서 입력한 정보로 mysql에 새로운 행 추가
member_add_find_belong.jsp | 팝업창에서 소속 부서 검색
this_member.jsp | 선택한 직원의 정보

###### 기능 체크
🟢완료 🟡구현중 🔴필요
> 🟢 직원 리스트 구현</br>
> 🟡 직원 추가(member_add_find_belong.jsp → id값 전달 X 문제)</br>
> 🟢 직원 정보(this_member.jsp)</br>
> 🔴 직원 수정
