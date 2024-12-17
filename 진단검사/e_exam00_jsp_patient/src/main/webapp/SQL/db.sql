create table TBL_PATIENT_202004(	
P_NO char(4) not null primary key,
P_NAME varchar2(20),
P_BIRTH char(8),
P_GENDER char(1),
P_TEL1 char(3),
P_TEL2 char(4),
P_TEL3 char(4),
P_CITY char(2)
);

drop table TBL_PATIENT_202004;

insert into TBL_PATIENT_202004 values('1001','김환자','19850301','M','010','2222','0001', '10');
insert into TBL_PATIENT_202004 values('1002','이환자','19900301','M','010','2222','0002', '20');
insert into TBL_PATIENT_202004 values('1003','박환자','19770301','F','010','2222','0003', '30');
insert into TBL_PATIENT_202004 values('1004','조환자','19650301','F','010','2222','0004', '10');
insert into TBL_PATIENT_202004 values('1005','황환자','19400301','M','010','2222','0005', '40');
insert into TBL_PATIENT_202004 values('1006','양환자','19440301','F','010','2222','0006', '40');
insert into TBL_PATIENT_202004 values('1007','허환자','19760301','F','010','2222','0007', '10');

create table TBL_LAB_TEST_202004(	
T_CODE char(4) not null primary key,
T_NAME varchar2(20)
);

drop table TBL_LAB_TEST_202004;

insert into TBL_LAB_TEST_202004 values('T001','결핵');
insert into TBL_LAB_TEST_202004 values('T002','장티푸스');
insert into TBL_LAB_TEST_202004 values('T003','수두');
insert into TBL_LAB_TEST_202004 values('T004','홍역');
insert into TBL_LAB_TEST_202004 values('T005','콜레라');

create table TBL_RESULT_202004(
P_NO char(40) not null,
T_CODE char(40),
T_SDATE date,
T_STATUS char(10),
T_LDATE date,
T_RESULT char(10),
primary key(P_NO, T_CODE ,T_SDATE)
);

drop table tbl_result_202004;

insert into tbl_result_202004 values('1001','T001','2020-01-01','1','2020-01-02','X');
insert into tbl_result_202004 values('1002','T002','2020-01-01','2','2020-01-02','P');
insert into tbl_result_202004 values('1003','T003','2020-01-01','2','2020-01-02','N');
insert into tbl_result_202004 values('1004','T004','2020-01-01','2','2020-01-02','P');
insert into tbl_result_202004 values('1005','T005','2020-01-01','2','2020-01-02','P');
insert into tbl_result_202004 values('1006','T001','2020-01-01','2','2020-01-02','N');
insert into tbl_result_202004 values('1007','T002','2020-01-01','2','2020-01-02','P');
insert into tbl_result_202004 values('1005','T003','2020-01-01','2','2020-01-02','P');
insert into tbl_result_202004 values('1006','T004','2020-01-01','2','2020-01-02','N');
insert into tbl_result_202004 values('1007','T005','2020-01-01','2','2020-01-02','N');

select p_no, p_name, substr(p_birth, 1, 4) || '년' || substr(p_birth, 5, 2) || '월' || substr(p_birth, 7, 2) || '일', case p_gender when 'M' then '남자' when 'F' then '여자' end as gender, p_tel1 || '-' ||p_tel2 || '-' || p_tel3, case p_city when '10' then '서울' when '20' then '경기' when '30' then '강원' when '40' then '대구' end as city
from TBL_PATIENT_202004;

select * from TBL_RESULT_202004

select r.P_NO, P_NAME, t_name, to_char(T_SDATE, 'YYYY-MM-DD'), case T_STATUS when '1' then '검사중' when '2' then '검사완료' end as status, to_char(T_LDATE, 'YYYY-MM-DD'), case T_RESULT when 'X' then '미입력' when 'P' then '양성' when 'N' then '음성' end as result
FROM TBL_RESULT_202004 r, TBL_PATIENT_202004 p, TBL_LAB_TEST_202004 l
where r.p_no = p.p_no and r.t_code = l.t_code
order by p_name asc;

select p_city, case p_city when '10' then '서울' when '20' then '경기' when '30' then '강원' when '40' then '대구' end as city, count(*)
from tbl_patient_202004 t, tbl_result_202004 r
where t.p_no = r.p_no
group by p_city
order by p_city;
