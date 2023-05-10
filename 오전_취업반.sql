--테이블 생성--
create table person(
    num number,
    name varchar2(20) not null,  --문자20byte
    birth varchar2(20),
    tel varchar2(20),
    primary key(num)    --중복허용 x , not null
);
select * from tab; --모든 테이블 보기

--테이블에 값 집어넣기               순서대로 입력
insert into person values(1001,'홍길동','20230509','010-xx'); --오라클에선 문자열에 '' 입력
insert into person(num,name,birth,tel)
                    values(1002,'김개똥','20230509','010-xx');
insert into person(num,name) values(1003,'김개똥');
                --값을 넣을 것만 지정해서 값을 넣을 수 있다.
                    
-- 검색하기 --
select * from tab; --모든 테이블 보기
select * from person; -- person 테이블의 모든 값 보기
select num, name from person; --person 테이블의 num,name 값 만 보기

select * from person where name = '홍길동';    -- person테이블의 name에서 홍길동으로 검색--
select * from person where num = 1002;        -- person테이블의 num에서 1002로 검색--

--데이터 수정--
update person set name = '김개똥', tel='111' where num = 1001;
                                            --num이 1001인 사용자의 name을 김개똥으로, tel은 111로 설정

--데이터 삭제--
delete from person; -- person테이블의 전체 내용(데이터) 삭제
delete from person where num = 1002;    --num이 1002인 사용자만 삭제


--person 정보 확인--
select * from person;
                                            
                                            
commit; --확정(저장개념)

rollback;   -- 커밋이 되었던 순간까지 롤백시킴(데이터베이스에 있는 값으로 롤백)








--2023.05.10--


create table test_table(num number);

desc test_table;    --테이블의 틀 확인하기

alter table test_table add(name varchar2(10));      --객체 추가
alter table test_table modify(name number);         --객체 타입 변경
alter table test_table drop column name;            --열 삭제
alter table test_table rename column num to num_b;  --이름 변경
                                --DB에서는 합성어를 _ 로 표현


drop table test_table ;      --테이블 자체를 삭제

create user test_java IDENTIFIED by 1234;
select * from all_users;
drop user test_java;
-- 계정 삭제시 테이블 존재하는 경우 cascade를 사용해야 한다.
drop user test_java cascade;


--2023.05.10 연습문제--
create table STUDENT(
    id varchar2(10),
    name varchar2(10),
    kor varchar2(5),
    eng varchar2(5),
    math varchar2(5),
    primary key(id)
);

select * from tab;

insert into STUDENT VALUES('2014030017','홍길동','70','80','90');
insert into STUDENT VALUES('2014030018','이몽룡','80','70','90');
insert into STUDENT VALUES('2014030019','이순신','100','50','50');

select * from STUDENT;

update STUDENT set kor = '100', eng='100', math='100'
            where id = '2014030017';
            
select * from STUDENT;
            
commit;

delete from STUDENT;

select * from STUDENT;

ROLLBACK;


--쿼리문 연산

select * from STUDENT;

select * from student where eng >= 90;   --eng가 90이상인것들 출력
select * from student where kor != 100;  --kor이 100이 아닌것을 출력
select * from student where kor = 90;    --kor이 90인것을 출력

select math from student where name = '홍길동';    --가상시나리오
select math/2 from student where name = '홍길동';  --연산가능
select math+100 from student where name = '홍길동';
select math*20 from student where name = '홍길동';

select * from student;

select * from student where kor >= 90 and math = 100;
                --and 연산자 사용   kor이 90이상 이면서, math가 100
            
select * from student where kor >= 90 or math = 100;
                --or 연산자 사용    kor이 90이상 이거나, math가 100
                                    
select * from student where not kor >= 90;
                --not 연산자 사용    kor이 90이상이 아닌 것
                                    
                                    
select * from student where kor >= 90 and kor <= 100;   --90과 100사이
select * from student where kor between 90 and 100;     --두개가 같은식
                                                        --between사용

create table test_number(
    numps number(5,2),  --전체자리수 5개 소수점 2개
    nump number(3),     --전체자리수 3개 소수점 0개
    num number          --모든 숫자 허용
);

insert into test_number values(1.12345,1.12345,1.12345);


SELECT * FROM test_number;      --각 1.12 / 1 / 1.12345 로 출력됨

insert into test_number values(123.12345,123.12345,123.12345);
SELECT * FROM test_number;  --각 123.12 / 123 / 12345

--insert into test_number values(1234.12345,123.12345,123.12345);
                            --1234.12345에서 오류발생
                            --1234.12   6글자가 되어버림
                            

create table test_date(
    my_date date
);

insert into test_date values(sysdate); --현재 날짜가 추가됨 sysdate
insert into test_date values('2000/12/24'); --지정된 날짜를 추가할수도 있음.
select * from test_date;

alter session set nls_date_format = 'YYYY/MM/DD HH:MI:SS';
--형식을 변경하는 코드 (실제로 초까지 저장이 되고있었음)

select * from test_date;

select * from test_date where my_date < '2019/12/12';
                            --날짜 비교후 출력가능


CREATE TABLE TEST_CHAR(
    CH CHAR(5),         --고정크기
    VCH VARCHAR2(20)    --가변크기
);

insert into test_char values('1','1');
select lengthb(ch), lengthb(vch) from test_char;
--lengthb(변수)로 길이를 측정할수 있다.





--연습문제--
CREATE TABLE employee(
    name varchar2(15),
    salary number,
    job varchar2(20),
    join_company date
);

insert into employee values('홍길동',2000000,'컴퓨터',sysdate);

select * from employee;

alter SESSION set nls_date_format = 'YYYY/MM/DD';   --형식변경

select * from employee;

delete from employee;



insert into employee values('설까치',1800000,'삼성','2017/10/24');
insert into employee values('로버트',1850000,'애플','2019/01/04');
insert into employee values('고도리',2200000,'엘지','2017/11/06');
insert into employee values('김개똥',2500000,'SK','2017/04/14');
insert into employee values('리우뚱',2410000,'샤오미','2018/01/09');
insert into employee values('강민',1900000,'삼성','2019/10/24');
insert into employee values('할리',1800000,'애플','2019/12/04');
insert into employee values('심심해',4630000,'엘지','2015/04/02');
insert into employee values('놀아줘',2770000,'SK','2017/01/24');
insert into employee values('왕만두',3650000,'샤오미','2016/08/04');
insert into employee values('머리빨',4210000,'삼성','2015/03/18');
insert into employee values('마리오',2720000,'애플','2017/01/04');
insert into employee values('최치우',4320000,'엘지','2015/06/07');
insert into employee values('안깔쌈',3490000,'SK','2015/09/07');
insert into employee values('끝짱',2200000,'샤오미','2017/05/04');
insert into employee values('막장',1920000,'삼성','2018/11/24');
insert into employee values('드라마',3420000,'애플','2016/07/29');
insert into employee values('개똥이',1800000,'엘지','2018/12/24');
insert into employee values('마포구',2230000,'SK','2018/01/05');
insert into employee values('소고기',1800000,'샤오미','2019/01/09');
insert into employee values('짜장면',2100000,'삼성','2017/10/24');
insert into employee values('소곱창',2200000,'애플','2017/11/04');
insert into employee values('참이슬',1950000,'엘지','2017/10/24');
insert into employee values('뤼우뚱',1800000,'SK','2018/10/24');
insert into employee values('위메프',1800000,'샤오미','2019/12/07');
insert into employee values('북경시',1880000,'삼성','2018/11/14');
insert into employee values('스미스',1970000,'애플','2019/06/04');
insert into employee values('핸드폰',7200000,'엘지','2010/01/27');
insert into employee values('빅스비',3570000,'SK','2015/02/17');
insert into employee values('노라줘',3200000,'샤오미','2015/11/24');
insert into employee values('사이다',2400000,'삼성','2017/09/26');
insert into employee values('김말이',7000000,'애플','2010/01/21');
insert into employee values('오도독',6230000,'엘지','2011/08/19');

insert into employee values('쌈지돈',3710000,'SK','2015/08/19');
insert into employee values('화장지',1770000,'샤오미','2019/04/28');
insert into employee values('소화기',1920000,'삼성','2019/10/07');
insert into employee values('박효신',2670000,'애플','2017/11/24');
insert into employee values('판빙빙',3120000,'엘지','2016/05/19');
insert into employee values('김재욱',4190000,'SK','2015/01/02');
insert into employee values('송혜교',4280000,'샤오미','2015/01/02');
insert into employee values('송중기',3700000,'삼성','2016/02/17');
insert into employee values('손홍민',2220000,'애플','2018/02/04');
insert into employee values('백종원',2760000,'엘지','2017/10/14');
insert into employee values('오창석',2620000,'SK','2017/09/04');
insert into employee values('스텔라',2500000,'샤오미','2017/11/20');
insert into employee values('멕스웰',1970000,'삼성','2017/10/30');
insert into employee values('조현',  2720000,'애플','2018/11/11');
insert into employee values('류현진',2600000,'엘지','2015/11/19');
insert into employee values('은지원',5670000,'SK','2017/10/16');
insert into employee values('전효성',3750000,'샤오미','2015/09/15');
insert into employee values('이채은',3400000,'삼성','2016/02/09');
insert into employee values('최고봉',8900000,'애플','2010/01/04');
insert into employee values('광화문',1860000,'엘지','2017/10/24');
insert into employee values('동대문',1790000,'SK','2017/10/24');
insert into employee values('서대문',2880000,'샤오미','2016/02/27');
insert into employee values('대통령',2320000,'삼성','2016/05/24');
insert into employee values('예지원',1780000,'애플','2019/01/09');
insert into employee values('정소민',2900000,'엘지','2016/10/22');
insert into employee values('워너원',3000000,'SK','2015/10/10');
insert into employee values('북한군',3200000,'샤오미','2015/11/11');
insert into employee values('남한군',2500000,'삼성','2016/12/19');
insert into employee values('짜투리',1850000,'애플','2018/04/03');
insert into employee values('이승기',1900000,'엘지','2018/01/01');
insert into employee values('기차길',1790000,'SK','2018/05/02');
insert into employee values('길거리',2700000,'샤오미','2016/07/20');

SELECT * FROM employee;

--연봉이 1억이 넘는사람 출력
SELECT * FROM employee WHERE salary * 12 > 100000000;

--2015년도 이전(2014년도 부터) 입사한 사람의 이름과 입사년도를 출력
select * from employee where join_company < '2015/01/01';

--급여가 280 ~ 300만원 사이에 있는 사람들을 출력하시오 (두개 다 정답)
select * from employee where salary  between 2800000 and 3000000;
select * from employee where salary >= 2800000 and salary <=3000000;


--like
select * from employee where name like '김%';    -- 김으로 시작하는것 전부
select * from employee where name like '%똥';    -- 똥으로 끝나는것 전부
select * from employee where name like '%김%';   -- 김이 들어간것 전부



--정렬
select * from employee order by join_company desc; --내림차순 (큰수부터)
select * from employee order by join_company asc;  --오름차순 (작은수부터)
select * from employee order by join_company asc, salary asc;
            --입사순은 오름차순으로 하되 입사일이 같으면 월급도 오름차순 정렬






--연습문제2--


--입사년도가 2015년 이상이며 연봉이 6000만원 이상인 사람들을 출력하기
select * from employee where 
    join_company > '2014/12/31' and salary*12 >= 60000000;
    

--회사가 삼성이거나 엘지이며 연봉이 5000만원 이상인 사람들을 출력하기
--2016년도 이전 입사
select * from employee where
    join_company <= '2015/12/31'
    and job = '삼성' or job = '엘지'
    and salary*12 >= 50000000;

--회사는 오름차순으로 정렬하고 연봉은 내림차순으로 정렬하고
--이름에 '김'이 들어가며 연봉은 3000만원 이상인 모든 내용을 출력하기

select * from employee where name like '%김%' and salary*12 >= 30000000
order by job asc, salary desc;
--★ordey by 구문은 where구문 뒤에 나와야 한다.★

                                    












