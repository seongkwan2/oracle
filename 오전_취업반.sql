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

                                    












