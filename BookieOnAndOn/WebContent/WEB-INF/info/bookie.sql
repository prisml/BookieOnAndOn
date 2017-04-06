--도서 테이블
drop table book;


create table book(
    bookno number primary key,
      title varchar2(100) not null,
   bookphoto blob not null,
   rate number default 0,
   author varchar2(100) not null,
   pub varchar2(100) not null,
   pubdate date not null,
   genre varchar2(100) not null,
   summary clob not null
)
drop sequence bookno_seq;
create sequence bookno_seq nocache;

--회원 테이블
drop table bookmember;

create table bookmember(
   id varchar2(100) primary key,
   password varchar2(100) not null,
   name varchar2(100) not null,
   tel varchar2(100) not null
)
insert into bookmember(id,password,name,tel) values('java','abcd','정우성','01011112222');
insert into bookmember(id,password,name,tel) values('jquery','dcba','전지현','01033334444');
insert into bookmember(id,password,name,tel) values('jdbc','aaaa','아이유','01055556666');
select * from bookmember;
--리뷰 테이블
drop table review;

create table review(
   bookno number,
   id varchar2(100),
   rvcontent clob not null,
   rvdate date not null,
   star number default 0,
   primary key(bookno,id),
   constraint bk_no foreign key(bookno) references book(bookno),
   constraint bk_id foreign key(id) references bookmember(id)
)

-- 봤어요
drop table saw;

create table saw(
   id varchar2(100),
   bookno number,
   primary key(bookno,id),
   constraint bk_no1 foreign key(bookno) references book(bookno),
   constraint bk_id1 foreign key(id) references bookmember(id)
)

-- 보고싶어요
drop table wish;

create table wish(
   id varchar2(100),
   bookno number,
   primary key(bookno,id),
   constraint bk_no2 foreign key(bookno) references book(bookno),
   constraint bk_id2 foreign key(id) references bookmember(id)
)

--booking
drop table booking;

create table booking(
   senderid varchar2(100),
   receiverid varchar2(100),
   primary key(senderid,receiverid),
   constraint bk_id3 foreign key(senderid) references bookmember(id),
   constraint bk_id4 foreign key(receiverid) references bookmember(id)
)
insert into booking(senderid,receiverid) values('java','jquery');
insert into booking(senderid,receiverid) values('jquery','java');
insert into booking(senderid,receiverid) values('java','jdbc');

select receiverid from booking where senderid='java';
select count(*) from booking where senderid='java';
select receiverid from booking where senderid='jquery';
-- 아래꺼부터 드롭
drop table book;
drop sequence bookno_seq;
drop table bookmember;
drop table review;
drop table saw;
drop table wish;
drop table booking;


-- insert BOOK 


