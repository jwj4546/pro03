

create table member(id varchar2(20) primary key, pw varchar2(300) not null, name varchar2(100) not null, email varchar2(200) not null, tel varchar2(100) not null, addr1 varchar2(200), addr2 varchar2(100),
postcode varchar2(20), birth date, point int default 1000, regdate timestamp default sysdate);
insert into member values('admin', 'admin', 'admin', 'admin@naver.com', '010-0000-0000', '을지로', '1가', '12', '2024-05-28', default, default);
select * from member;


create table notice(no int primary key, title varchar2(200), content varchar2(1000), id varchar2(20) default 'admin', hits int default 0, resdate timestamp default sysdate);
alter table notice add constraints fk_mem foreign key(id) references member(id); 
create sequence nnoSeq start with 1 increment by 1 maxvalue 5000 minvalue 1 cycle;
insert into notice values (nnoSeq.nextval, '제목1', '내용1', 'admin', default, default);
select * from notice;
desc notice;
drop table notice;
drop sequence nnoSeq;

create table review(no int primary key, pname varchar2(50), title varchar2(200), content varchar2(1000), id varchar2(20), hits int default 0, resdate timestamp default sysdate);
alter table review add constraints fk_mem0 foreign key(id) references member(id);
alter table review add constraints fk_pname foreign key(pname) references product(pname);
alter table review modify(pname varchar2(100));
create sequence rnoSeq start with 1 increment by 1 maxvalue 5000 minvalue 1 cycle;

create table qna(no int primary key, qlevel int default 1, parno int default 0, title varchar2(200) not null, content varchar2(1000) not null, hits int default 0, resdate timestamp default sysdate, id varchar2(20));
alter table qna add constraints fk_mem1 foreign key(id) references member(id);
create sequence qnoSeq start with 1 increment by 1 maxvalue 5000 minvalue 1 cycle;

create table faq(no int primary key, category varchar2(50), title varchar2(100), content varchar2(1000), id varchar2(20), hits int default 0, resdate timestamp default sysdate);
alter table faq add constraints fk_mem2 foreign key(id) references member(id);
create sequence fnoSeq start with 1 increment by 1 maxvalue 5000 minvalue 1 cycle;


create table product(pno int primary key, category varchar2(50) not null, pname varchar2(100) not null, com varchar2(3000), price int default 1000, img varchar2(300));
create sequence pnoSeq start with 1 increment by 1 maxvalue 5000 minvalue 1 cycle;
alter table product add constraints product_pname unique(pname);
alter table product add img2 varchar2(300);
alter table product add img3 varchar2(300);
select * from product;
drop sequence pnoSeq;
alter table product modify(com varchar(3000));

create view productvo as (select p.pno as pno, p.category as category, p.pname as pname,p.com as com, p.img as img, p.img2 as img2, p.img3 as img3,
avg(i.iprice) as iprice, max(i.oprice) as oprice, sum(i.amount) as amount from product p, inventory i where p.pno=i.pno group by p.pno, p.category, p.pname, p.com, p.img, p.img2, p.img3); 


create table inventory(ino int primary key, pno int, iprice int default 1000, oprice int default 1000, amount int default 1, remark varchar2(200));
create sequence inoSeq start with 1 increment by 1 maxvalue 5000 minvalue 1 cycle;
alter table inventory add constraints fk_pno foreign key(pno) references product(pno);
alter table inventory add resdate timestamp default sysdate;
insert into inventory values(inoSeq.nextval, 19, 28000, 32000, 20, '재고있음', '2025.06.03');
select * from inventory;

create view inventoryvo as (select i.ino as ino, i.pno as pno, p.pname as pname, avg(i.iprice) as iprice, max(i.oprice) as oprice, sum(i.amount) as amount, 
i.remark as remark, max(i.resdate) as resdate from inventory i, product p where i.pno=p.pno group by i.ino, p.pname, i.remark, i.pno);

create table sales(sno int primary key, pno int, amount int default 1, tot int, id varchar2(20), paymethod varchar2(20), paynum varchar2(30), addr varchar2(300), tel varchar2(100), delcom varchar2(50), deltel varchar2(50), delno varchar2(50), delstatus varchar2(20), st varchar2(20));
alter table sales add constraints fk_mem3 foreign key(id) references member(id);
alter table sales add constraints fk_pno1 foreign key(pno) references product(pno);
alter table sales add resdate timestamp default sysdate;
create sequence snoSeq start with 1 increment by 1 maxvalue 5000 minvalue 1 cycle;

create table basket(bno int primary key, id varchar2(20), pno int, amount int, remark varchar2(100));
alter table basket add constraints fk_mem4 foreign key(id) references member(id);
alter table basket add constraints fk_pno2 foreign key(pno) references product(pno);
alter table basket add resdate timestamp default sysdate;
create sequence bnoSeq start with 1 increment by 1 maxvalue 5000 minvalue 1 cycle;

commit;