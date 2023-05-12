--���̺� ����--
create table person(
    num number,
    name varchar2(20) not null,  --����20byte
    birth varchar2(20),
    tel varchar2(20),
    primary key(num)    --�ߺ���� x , not null
);
select * from tab; --��� ���̺� ����

--���̺� �� ����ֱ�               ������� �Է�
insert into person values(1001,'ȫ�浿','20230509','010-xx'); --����Ŭ���� ���ڿ��� '' �Է�
insert into person(num,name,birth,tel)
                    values(1002,'�谳��','20230509','010-xx');
insert into person(num,name) values(1003,'�谳��');
                --���� ���� �͸� �����ؼ� ���� ���� �� �ִ�.
                    
-- �˻��ϱ� --
select * from tab; --��� ���̺� ����
select * from person; -- person ���̺��� ��� �� ����
select num, name from person; --person ���̺��� num,name �� �� ����

select * from person where name = 'ȫ�浿';    -- person���̺��� name���� ȫ�浿���� �˻�--
select * from person where num = 1002;        -- person���̺��� num���� 1002�� �˻�--

--������ ����--
update person set name = '�谳��', tel='111' where num = 1001;
                                            --num�� 1001�� ������� name�� �谳������, tel�� 111�� ����

--������ ����--
delete from person; -- person���̺��� ��ü ����(������) ����
delete from person where num = 1002;    --num�� 1002�� ����ڸ� ����


--person ���� Ȯ��--
select * from person;
                                            
                                            
commit; --Ȯ��(���尳��)

rollback;   -- Ŀ���� �Ǿ��� �������� �ѹ��Ŵ(�����ͺ��̽��� �ִ� ������ �ѹ�)








--2023.05.10--


create table test_table(num number);

desc test_table;    --���̺��� Ʋ Ȯ���ϱ�

alter table test_table add(name varchar2(10));      --��ü �߰�
alter table test_table modify(name number);         --��ü Ÿ�� ����
alter table test_table drop column name;            --�� ����
alter table test_table rename column num to num_b;  --�̸� ����
                                --DB������ �ռ�� _ �� ǥ��


drop table test_table ;      --���̺� ��ü�� ����

create user test_java IDENTIFIED by 1234;
select * from all_users;
drop user test_java;
-- ���� ������ ���̺� �����ϴ� ��� cascade�� ����ؾ� �Ѵ�.
drop user test_java cascade;


--2023.05.10 ��������--
create table STUDENT(
    id varchar2(10),
    name varchar2(10),
    kor varchar2(5),
    eng varchar2(5),
    math varchar2(5),
    primary key(id)
);

select * from tab;

insert into STUDENT VALUES('2014030017','ȫ�浿','70','80','90');
insert into STUDENT VALUES('2014030018','�̸���','80','70','90');
insert into STUDENT VALUES('2014030019','�̼���','100','50','50');

select * from STUDENT;

update STUDENT set kor = '100', eng='100', math='100'
            where id = '2014030017';
            
select * from STUDENT;
            
commit;

delete from STUDENT;

select * from STUDENT;

ROLLBACK;


--������ ����

select * from STUDENT;

select * from student where eng >= 90;   --eng�� 90�̻��ΰ͵� ���
select * from student where kor != 100;  --kor�� 100�� �ƴѰ��� ���
select * from student where kor = 90;    --kor�� 90�ΰ��� ���

select math from student where name = 'ȫ�浿';    --����ó�����
select math/2 from student where name = 'ȫ�浿';  --���갡��
select math+100 from student where name = 'ȫ�浿';
select math*20 from student where name = 'ȫ�浿';

select * from student;

select * from student where kor >= 90 and math = 100;
                --and ������ ���   kor�� 90�̻� �̸鼭, math�� 100
            
select * from student where kor >= 90 or math = 100;
                --or ������ ���    kor�� 90�̻� �̰ų�, math�� 100
                                    
select * from student where not kor >= 90;
                --not ������ ���    kor�� 90�̻��� �ƴ� ��
                                    
                                    
select * from student where kor >= 90 and kor <= 100;   --90�� 100����
select * from student where kor between 90 and 100;     --�ΰ��� ������
                                                        --between���

create table test_number(
    numps number(5,2),  --��ü�ڸ��� 5�� �Ҽ��� 2��
    nump number(3),     --��ü�ڸ��� 3�� �Ҽ��� 0��
    num number          --��� ���� ���
);

insert into test_number values(1.12345,1.12345,1.12345);


SELECT * FROM test_number;      --�� 1.12 / 1 / 1.12345 �� ��µ�

insert into test_number values(123.12345,123.12345,123.12345);
SELECT * FROM test_number;  --�� 123.12 / 123 / 12345

--insert into test_number values(1234.12345,123.12345,123.12345);
                            --1234.12345���� �����߻�
                            --1234.12   6���ڰ� �Ǿ����
                            

create table test_date(
    my_date date
);

insert into test_date values(sysdate); --���� ��¥�� �߰��� sysdate
insert into test_date values('2000/12/24'); --������ ��¥�� �߰��Ҽ��� ����.
select * from test_date;

alter session set nls_date_format = 'YYYY/MM/DD HH:MI:SS';
--������ �����ϴ� �ڵ� (������ �ʱ��� ������ �ǰ��־���)

select * from test_date;

select * from test_date where my_date < '2019/12/12';
                            --��¥ ���� ��°���


CREATE TABLE TEST_CHAR(
    CH CHAR(5),         --����ũ��
    VCH VARCHAR2(20)    --����ũ��
);

insert into test_char values('1','1');
select lengthb(ch), lengthb(vch) from test_char;
--lengthb(����)�� ���̸� �����Ҽ� �ִ�.





--��������--
CREATE TABLE employee(
    name varchar2(15),
    salary number,
    job varchar2(20),
    join_company date
);

insert into employee values('ȫ�浿',2000000,'��ǻ��',sysdate);

select * from employee;

alter SESSION set nls_date_format = 'YYYY/MM/DD';   --���ĺ���

select * from employee;

delete from employee;



insert into employee values('����ġ',1800000,'�Ｚ','2017/10/24');
insert into employee values('�ι�Ʈ',1850000,'����','2019/01/04');
insert into employee values('����',2200000,'����','2017/11/06');
insert into employee values('�谳��',2500000,'SK','2017/04/14');
insert into employee values('�����',2410000,'������','2018/01/09');
insert into employee values('����',1900000,'�Ｚ','2019/10/24');
insert into employee values('�Ҹ�',1800000,'����','2019/12/04');
insert into employee values('�ɽ���',4630000,'����','2015/04/02');
insert into employee values('�����',2770000,'SK','2017/01/24');
insert into employee values('�ո���',3650000,'������','2016/08/04');
insert into employee values('�Ӹ���',4210000,'�Ｚ','2015/03/18');
insert into employee values('������',2720000,'����','2017/01/04');
insert into employee values('��ġ��',4320000,'����','2015/06/07');
insert into employee values('�ȱ��',3490000,'SK','2015/09/07');
insert into employee values('��¯',2200000,'������','2017/05/04');
insert into employee values('����',1920000,'�Ｚ','2018/11/24');
insert into employee values('���',3420000,'����','2016/07/29');
insert into employee values('������',1800000,'����','2018/12/24');
insert into employee values('������',2230000,'SK','2018/01/05');
insert into employee values('�Ұ��',1800000,'������','2019/01/09');
insert into employee values('¥���',2100000,'�Ｚ','2017/10/24');
insert into employee values('�Ұ�â',2200000,'����','2017/11/04');
insert into employee values('���̽�',1950000,'����','2017/10/24');
insert into employee values('����',1800000,'SK','2018/10/24');
insert into employee values('������',1800000,'������','2019/12/07');
insert into employee values('�ϰ��',1880000,'�Ｚ','2018/11/14');
insert into employee values('���̽�',1970000,'����','2019/06/04');
insert into employee values('�ڵ���',7200000,'����','2010/01/27');
insert into employee values('�򽺺�',3570000,'SK','2015/02/17');
insert into employee values('�����',3200000,'������','2015/11/24');
insert into employee values('���̴�',2400000,'�Ｚ','2017/09/26');
insert into employee values('�踻��',7000000,'����','2010/01/21');
insert into employee values('������',6230000,'����','2011/08/19');

insert into employee values('������',3710000,'SK','2015/08/19');
insert into employee values('ȭ����',1770000,'������','2019/04/28');
insert into employee values('��ȭ��',1920000,'�Ｚ','2019/10/07');
insert into employee values('��ȿ��',2670000,'����','2017/11/24');
insert into employee values('�Ǻ���',3120000,'����','2016/05/19');
insert into employee values('�����',4190000,'SK','2015/01/02');
insert into employee values('������',4280000,'������','2015/01/02');
insert into employee values('���߱�',3700000,'�Ｚ','2016/02/17');
insert into employee values('��ȫ��',2220000,'����','2018/02/04');
insert into employee values('������',2760000,'����','2017/10/14');
insert into employee values('��â��',2620000,'SK','2017/09/04');
insert into employee values('���ڶ�',2500000,'������','2017/11/20');
insert into employee values('�߽���',1970000,'�Ｚ','2017/10/30');
insert into employee values('����',  2720000,'����','2018/11/11');
insert into employee values('������',2600000,'����','2015/11/19');
insert into employee values('������',5670000,'SK','2017/10/16');
insert into employee values('��ȿ��',3750000,'������','2015/09/15');
insert into employee values('��ä��',3400000,'�Ｚ','2016/02/09');
insert into employee values('�ְ��',8900000,'����','2010/01/04');
insert into employee values('��ȭ��',1860000,'����','2017/10/24');
insert into employee values('���빮',1790000,'SK','2017/10/24');
insert into employee values('���빮',2880000,'������','2016/02/27');
insert into employee values('�����',2320000,'�Ｚ','2016/05/24');
insert into employee values('������',1780000,'����','2019/01/09');
insert into employee values('���ҹ�',2900000,'����','2016/10/22');
insert into employee values('���ʿ�',3000000,'SK','2015/10/10');
insert into employee values('���ѱ�',3200000,'������','2015/11/11');
insert into employee values('���ѱ�',2500000,'�Ｚ','2016/12/19');
insert into employee values('¥����',1850000,'����','2018/04/03');
insert into employee values('�̽±�',1900000,'����','2018/01/01');
insert into employee values('������',1790000,'SK','2018/05/02');
insert into employee values('��Ÿ�',2700000,'������','2016/07/20');

SELECT * FROM employee;

--������ 1���� �Ѵ»�� ���
SELECT * FROM employee WHERE salary * 12 > 100000000;

--2015�⵵ ����(2014�⵵ ����) �Ի��� ����� �̸��� �Ի�⵵�� ���
select * from employee where join_company < '2015/01/01';

--�޿��� 280 ~ 300���� ���̿� �ִ� ������� ����Ͻÿ� (�ΰ� �� ����)
select * from employee where salary  between 2800000 and 3000000;
select * from employee where salary >= 2800000 and salary <=3000000;


--like
select * from employee where name like '��%';    -- ������ �����ϴ°� ����
select * from employee where name like '%��';    -- ������ �����°� ����
select * from employee where name like '%��%';   -- ���� ���� ����



--����
select * from employee order by join_company desc; --�������� (ū������)
select * from employee order by join_company asc;  --�������� (����������)
select * from employee order by join_company asc, salary asc;
            --�Ի���� ������������ �ϵ� �Ի����� ������ ���޵� �������� ����






--��������2--


--�Ի�⵵�� 2015�� �̻��̸� ������ 6000���� �̻��� ������� ����ϱ�
select * from employee where 
    join_company > '2014/12/31' and salary*12 >= 60000000;
    

--ȸ�簡 �Ｚ�̰ų� �����̸� ������ 5000���� �̻��� ������� ����ϱ�
--2016�⵵ ���� �Ի�
select * from employee where
    join_company <= '2015/12/31'
    and job = '�Ｚ' or job = '����'
    and salary*12 >= 50000000;

--ȸ��� ������������ �����ϰ� ������ ������������ �����ϰ�
--�̸��� '��'�� ���� ������ 3000���� �̻��� ��� ������ ����ϱ�

select * from employee where name like '%��%' and salary*12 >= 30000000
order by job asc, salary desc;
--��ordey by ������ where���� �ڿ� ���;� �Ѵ�.��

                                    

--------------------------------------------------------------



--2023-05-11


create table test_func(
    id number, 
    num varchar2(20)
);

insert into test_func values(1, '34.5678');         --����Ŭ������ ���ڿ��ȿ� ���ڸ� ������
                                                    --������ �����ϴ�.

select * from test_func where id = 1;


--�ݿø� round
select round(num,2) from test_func where id = 1;        --34.57
select round(num/2,2) from test_func where id = 1;      --17.28

--���� trunc
select trunc(num,2) from test_func where id = 1;        --34.56

--MOD �Լ��� ù ��° �μ��� �� ��° �μ��� ���� '������'�� ��ȯ
--�����Ⱑ / �ƴϰ� % �̴�.
select mod(num,2) from test_func where id = 1;
                                            --34.5678 % 2 -> 0.5678

insert into test_func values(2, '55');
select mod(num ,2) from test_func where id = 2;


--------------------------------------------------------------


--��������--
insert into test_func values(3,'77');
insert into test_func values(4,'67.123');
insert into test_func values(5,'123.123');
insert into test_func values(6,'99');
insert into test_func values(7,'99.456');
insert into test_func values(8,'128');
insert into test_func values(9,'123.777');
insert into test_func values(10,'101.44');

--Ȧ�� id ������ ��� ����ϱ�
select * from test_func where mod(id,2)=1;
                                --id %2 == 1; �̶� ���� ��
--¦�� id ������ 2�� ������ �Ҽ��� 2�ڸ����� ǥ��(�ݿø�)
select id , round(num/2,2) from test_func where mod(id,2)=0;
-- *�� ������� �ʰ� ���� ����ϸ鼭 ������ �ۼ�


insert into test_func values(11, 'welcome To oracle');
select * from test_func where id = 11;               --�Ϲ�
select upper(num) from test_func where id = 11;      --�빮��
select lower(num) from test_func where id = 11;      --�ҹ���
select initcap(num) from test_func where id = 11;    --ù ���� �빮��

--------------------------------------------------------------

--��������2--
create table test_company(
  name varchar2(20),
  ���� varchar2(20),
  class varchar2(20)
);
insert into test_company values('hong gil dong_M','3600','Manager');
insert into test_company values('kim gea ddong_M','2555','ManaGer');
insert into test_company values('Go gil dong_M','2800','ManaGER');
insert into test_company values('hong gil dong_E','3111','EmpLoyee');
insert into test_company values('kim gea ddong_E','2600','EmpLoYee');
insert into test_company values('Go gil dong_E','2950','employee');

--������ manager�� ����� �˻��Ͽ� ���
select * from test_company where lower(class) = 'manager';

--������ employee �̸鼭 ������ 2800�̻��� ����� ��� ���
select * from test_company where lower(class) = 'employee' and ���� >= 2800;

--��� ����� �̸��� ù��° ���ڴ� �빮�ڷ� ����ϰ� �Ѵ� �޿��� ���(�Ҽ������ϴ� ����)
SELECT INITCAP(name), TRUNC(����/12), lower(class) FROM test_company;


--------------------------------------------------------------

create table test_class(
    class varchar2(10), 
    score number
);

Insert into test_class values('A��',11);
insert into test_class values('A��',12);
insert into test_class values('A��',13);
insert into test_class values('B��',21);
insert into test_class values('B��',22);
insert into test_class values('B��',23);
insert into test_class values('1',31);
insert into test_class values('1',32);
insert into test_class values('1',33);
insert into test_class values('',40);


--������ ���ϴ� �Լ� sum
select sum(score) from test_class;

--����� ���ϴ� �Լ� avg
select avg(score) from test_class;

--�ִ��� ���ϴ� �Լ� max
select max(score) from test_class;

--�ּҰ��� ���ϴ� �Լ� min
select min(score) from test_class;

--null���� ó������ ����
select count(class) from test_class;

--null���� �� ����
select count(*) from test_class;


--�׷� �Լ�
select * from test_class;
select class, sum(score) from test_class group by class;
                                --���� �̸����� �������
                                        
select class, sum(score) from test_class group by class having sum(score)>60;
                                --group by������ where�� �ƴ� having �� �̿�
                                
--��������
--�� Ŭ���� �� ������ ����Ͻÿ�
select class, sum(score) from test_class group by class;

--�� Ŭ���� �� ����� ���ϰ� ��� �� ������������ �����Ͽ� ����Ͻÿ�
SELECT class, AVG(score)FROM test_class GROUP BY class ORDER BY class DESC;


--�� Class���� ���� ū ���� ���� ���� ���� ����Ͻÿ�
select class, max(score),min(score) from test_class group by class;



------------------------------------------------------------------


create table testName(id varchar2(20), class varchar2(20));
insert into testName values('ȫ�浿','A��');
insert into testName values('�谳��','B��');
insert into testName values('��浿','C��');

create table testLesson(id varchar2(20), lesson varchar2(20), score number);
insert into testLesson values('ȫ�浿','python',80);
insert into testLesson values('ȫ�浿','java',90);
insert into testLesson values('ȫ�浿','c���',70);
insert into testLesson values('�谳��','server2012',70);
insert into testLesson values('�谳��','linux',90);
insert into testLesson values('��浿','jsp',100);

select * from testname;
select * from testlesson;

select * from testname, testlesson;
select N.* , L.lesson, L.score from testname N, testlesson L;
                                    --testname = N , testlesson = L (��������)
-- N�� ������ ��� L�� lesson,score�� ���

select * from testname N inner join testlesson L on N.id = L.id;
                --testname�� testlesson�� ��ġ�ڴ�. 

select N.*, L.lesson, L.score from testname N inner join testlesson L on N.id = L.id;
                                                                --N��id�� L��id�� ��ģ��.

--��������

--id�� ȫ�浿�� ����� ���������� ��� �Ͻÿ�
--id, class, score�� ����Ͻÿ�.
select N.*, L.lesson, L.score from 
    testname N inner join testlesson L on N.id = L.id;  --�׳� ��ģ���

select N.id, N.class,L.lesson,L.score from 
    testName N inner join testlesson L on N.id = L.id and N.id = 'ȫ�浿';  --��ģ�� id�� ȫ�浿�� ���
    
    
    
--�� �̸�, Ŭ������ �հ�� ����� ��� �Ͻÿ�
--id�� testName���̺��� �޾ƿ���,
--������ ���� testLesson ���̺��� ������ �̿��ؼ� ǥ���Ͻÿ�

select N.id, N.class , sum(L.score), avg(L.score) 
    from testname N inner join testlesson L on N.id = L.id group by N.id, N.class;
    

select N.id, N.class, sum(L.score), avg(L.score) 
    from testname N inner join testlesson L on N.id = L.id group by N.id, N.class;

--������������ ����
select N.id, N.CLASS, sum(L.score), avg(L.score) from 
        testName N inner join testlesson L on N.id=L.id group by N.id,N.CLASS order by class asc;
        
        
        
        
--------2023-05-12---------

-- ���̺� ���� SQL - membership
CREATE TABLE membership
(
    m_id      VARCHAR2(20)    NOT NULL, 
    m_pwd     VARCHAR2(20)    NULL, 
    m_name    VARCHAR2(20)    NULL, 
    m_addr    VARCHAR2(20)    NULL, 
     PRIMARY KEY (m_id)
);


-- ���̺� ���� SQL - board
CREATE TABLE board
(
    b_num        INT             NOT NULL, 
    b_id         VARCHAR2(20)    NULL, 
    b_title      VARCHAR2(20)    NULL, 
    b_content    VARCHAR2(20)    NULL, 
    b_date       DATE            NULL, 
     PRIMARY KEY (b_num)
);


-- Auto Increment�� ���� Sequence �߰� SQL - board.b_num
CREATE SEQUENCE board_SEQ
START WITH 1
INCREMENT BY 1;

--������ ���� ��ɾ�
drop sequence board_seq;


-- Foreign Key ���� SQL - board(b_id) -> membership(m_id)
ALTER TABLE board
    ADD CONSTRAINT FK_board_b_id_membership_m_id FOREIGN KEY (b_id)
        REFERENCES membership (m_id) ;



insert into membership(m_id, m_pwd, m_name, m_addr)
                values('aaa','aaa','ȫ�浿','���¥��');
                
select * from membership;

drop table membership;
drop table board;

insert into board(b_num, b_id, b_title, b_content, b_date)
                values(board_seq.nextval,'bbb','����','����',sysdate);

insert into membership(m_id, m_pwd, m_name, m_addr)
                values('bbb','aaa','ȫ�浿','���¥��');
                
select * from membership;
select * from board;


--������ �̷���� ������ �ڽĺ��� �������� �ؾ���(�ܷ�Ű) (���ŷο�� �Ʒ��� �������� ����)
delete from membership where m_id = 'aaa';
delete from board where b_id = 'aaa';

delete from membership where m_id = 'bbb';
delete from board where b_id = 'bbb';


--���������� �����ϸ� ���� ���� ���ε��� �ΰ�
-- Foreign Key ���� SQL - board(b_id)
ALTER TABLE board
DROP CONSTRAINT FK_board_b_id_membership_m_id;



select * from membership;
select * from board;


insert into board(b_num, b_id, b_title, b_content, b_date)
                values(board_seq.nextval,'bbb','����','����',sysdate);

insert into membership(m_id, m_pwd, m_name, m_addr)
                values('bbb','aaa','ȫ�浿','���¥��');
                
delete from membership where m_id = 'bbb';
delete from board where b_id = 'bbb';


------�θ� �����Ǹ� �ڽĵ� ����-------
-- Foreign Key ���� SQL - board(b_id) -> membership(m_id)
ALTER TABLE board
    ADD CONSTRAINT FK_board_b_id_membership_m_id FOREIGN KEY (b_id)
        REFERENCES membership (m_id) on delete CASCADE; --�θ� �����Ǹ� �ڽĵ� ����(��������)

insert into membership(m_id, m_pwd, m_name, m_addr)
                values('bbb','aaa','ȫ�浿','���¥��');
                
insert into board(b_num, b_id, b_title, b_content, b_date)
                values(board_seq.nextval,'bbb','����','����',sysdate); --����������




select * from membership;          
select * from board;


delete from membership where m_id = 'bbb';  --����� bbb������ ����� board�� bbb�� ���� ����

drop table membership;                      --����Ǿ��ִ� ���¿��� ���̺� ������ �ȵ�
drop table membership CASCADE CONSTRAINTS;  --������ �Ǿ� �־ ������ ����
drop table board;



--��������


-- ���̺� ���� SQL - member
CREATE TABLE member
(
    m_id      VARCHAR2(20)    NOT NULL, 
    m_pwd     VARCHAR2(20)    NULL, 
    m_name    VARCHAR2(20)    NULL, 
    m_addr    VARCHAR2(20)    NULL, 
     PRIMARY KEY (m_id)
);

-- ���̺� ���� SQL - goods
CREATE TABLE goods
(
    g_num          INT             NOT NULL, 
    g_id           VARCHAR2(20)    NULL, 
    g_name         VARCHAR2(20)    NULL, 
    g_price        INT             NULL, 
    g_count        INT             NULL, 
    g_price_sum    INT             NULL, 
    g_date         DATE            NULL, 
     PRIMARY KEY (g_num)
);

-- Auto Increment�� ���� Sequence �߰� SQL - goods.g_num
CREATE SEQUENCE goods_SEQ
START WITH 1
INCREMENT BY 1;


-- Foreign Key ���� SQL - goods(g_id) -> member(m_id)
ALTER TABLE goods
    ADD CONSTRAINT FK_g_id_m_id FOREIGN KEY (g_id)
        REFERENCES member (m_id) ;

-- Foreign Key ���� SQL - goods(g_id)
-- ALTER TABLE goods
-- DROP CONSTRAINT FK_g_id_m_id;

insert into member(m_id, m_pwd, m_name, m_addr)
                values('aaa','aaa','ȫ�浿','���¥��');
insert into member(m_id, m_pwd, m_name, m_addr)
                values('bbb','bbb','�谳��','���˺�');
insert into member(m_id, m_pwd, m_name, m_addr)
                values('ccc','ccc','��浿','������');
insert into member(m_id, m_pwd, m_name, m_addr)
                values('ddd','ddd','�踻��','�н���');
                
insert into goods(g_num, g_id, g_name, g_price, g_count, g_price_sum, g_date)
        values(goods_SEQ.nextval,'aaa','�ȭ',75000,2,150000,sysdate);
insert into goods(g_num, g_id, g_name, g_price, g_count, g_price_sum, g_date)
        values(goods_SEQ.nextval,'aaa','Ƽ����',15000,5,75000,sysdate);
insert into goods(g_num, g_id, g_name, g_price, g_count, g_price_sum, g_date)
        values(goods_SEQ.nextval,'bbb','����',450000,1,450000,sysdate);
insert into goods(g_num, g_id, g_name, g_price, g_count, g_price_sum, g_date)
        values(goods_SEQ.nextval,'bbb','å',35000,2,70000,sysdate);


        
select * from member;
select * from goods;

--������ 1�� �ʱ�ȭ
alter sequence goods_seq increment by 1;

delete from member;
delete from goods;

drop sequence goods_seq;
drop table goods;

--1�� ������ ��
SELECT M.*, G.g_num, G.g_id, G.g_name, G.g_price, G.g_count, G.g_price_sum, G.g_date
FROM member M INNER JOIN goods G ON M.m_id = G.g_id;

--2�� ������ ��
SELECT M.m_id,M.m_name, G.g_name, G.g_price_sum
FROM member M INNER JOIN goods G ON M.m_id = G.g_id;

--3�� ������ �� (Sum�Լ��� �̿��Ͽ� ���̵� �� �ݾ��� ����ϱ�)
SELECT M.m_id,M.m_name, M.m_addr, sum(G.g_price_sum)
FROM member M INNER JOIN goods G ON M.m_id = G.g_id 
group by M.m_id, M.m_name, M.m_addr;

--��� ���̵��, ��� �̸��� ��������� ��������� '�ѻ������ ��������'
--�׸��� �� ����� ������ ������ ��ħ



--JAVA���� �ǽ�--
create table newst(
id varchar2(20),
name varchar2(20),
age number,
primary key(id)
);

insert into newst values('111','Hong',23);
insert into newst values('222','Kim',20);
insert into newst values('333','Go',30);

commit;

select * from newst;
select * from newst where id ='111';


insert into newst(id, name, age) values('555','������',20);
commit; --Ŀ�Ա��� �غ��� �ٽ� �ߺ����α��� Ȯ��


delete from newst where id = '111';











