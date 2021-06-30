### 소스 목록

#### 💡 메인 💡
소스 | 내용
---- | ----
manage_form.jsp | 병원 관리 시스템의 첫화면. 환자/병원을 선택하여 해당 관리자 메뉴로 이동</BR> 환자 선택 → patient_page.jsp </BR>병원 선택 → hospital_page.jsp <BR>

![image](https://user-images.githubusercontent.com/85846475/123762673-fe515280-d8fd-11eb-9522-3754e60e48bf.png)

</BR></BR>

#### 💡 환자 관리 💡
소스 | 내용
---- | ----
patient_page.jsp | 환자 정보를 검색, 추가. </BR> 이름입력+검색</BR> 신규 클릭 → patient_add.jsp
patient_search.jsp | 해당 이름의 환자 리스트를 출력(hidden)
patient_add.jsp | 신규 환자 등록 페이지 </BR> SQL에 insert 신규 환자 데이터
patient_add2.jsp | patient_add.jsp에서 입력한 데이터 확인 </BR> null값, 자리수 체크(hisory back();)
