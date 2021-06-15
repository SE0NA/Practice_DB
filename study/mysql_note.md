cmd 이용

##### 📘 mySQL 접속
 [ >mysql -uroot -p ]
 
 : mySQL을 root(관리자)로 접속함을 의미. -p는 패스워드.
   엔터키를 누르면 패스워드를 입력

##### 📘 mySQL 종료
[ > exit ]



***

※ 세미콜론(;) 필수

##### 📒 DATABASE 생성
 > CREATE DATABASE databasename; 
 
 : 데이터베이스 생성 명령어 다음, 생성할 데이터베이스의 이름 작성.
   → 해당 이름을 가진 데이터베이스가 이미 존재하면 에러 발생
   → 다른 이름을 사용하거나, 필요없을 경우 데이터베이스를 삭제해주어야 함.


##### 📒 DATABASE 삭제
 > DROP DATABASE databasename; 
 
 : 데이터베이스 삭제 명령어 다음, 삭제하고자 하는 데이터 베이스의 이름 작성.



##### 📒 DATABASE 리스트 보기
 > SHOW DATABASES; 

 > SHOW SCHEMAS; 

![image](https://user-images.githubusercontent.com/85846475/122110343-65302f80-ce59-11eb-810e-d67c245fcffd.png)
 
 
##### 📒 DATABASE 선택
 > USE databasename;
 
 : 선택한 데이터베이스를 사용할 것임을 선언
 

***

##### 📕 TABLE 생성
  > CREATE TABLE tablename( 
      ~
    );


***

##### 📗 Datatypes

- INT(n): Standard integer value.(-2147483648 ~ 214748367)
   + BIGINT(m): Big integer value.

- CHAR(n): 문자열 (~255)
- VARCHAR(n): 가변 길이 문자열 (~255)
   + TEXT(n) / MEDIUMTEXT(n) / LONGTEXT(n) 

- DATETIME: 시간

