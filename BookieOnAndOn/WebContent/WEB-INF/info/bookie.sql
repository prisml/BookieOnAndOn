--도서 테이블
drop table book;
select * from book;
create table book(
   bookno number primary key,
   title varchar2(100) not null,
   bookphoto blob,
   rate number default 0,
   author varchar2(100) not null,
   pub varchar2(100) not null,
   pubdate date not null,
   genre varchar2(100) not null,
   summary clob null
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

insert into bookmember(id,password,name,tel) values ('java','1234','김래현','011');
insert into bookmember(id,password,name,tel) values ('jquery','1111','문성준','012');
select * from bookmember;
select name,tel from bookmember where id='jquery' and password='1111';
update bookmember set password='12346',name='jqueryw',tel='5432r' where id='java';
select * from bookmember where id='java';
insert into bookmember(id,password,name,tel) values('java','abcd','정우성','01011112222');
insert into bookmember(id,password,name,tel) values('jquery','dcba','전지현','01033334444');
insert into bookmember(id,password,name,tel) values('jdbc','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('java1','abcd','정우성','01011112222');
insert into bookmember(id,password,name,tel) values('java2','dcba','전지현','01033334444');
insert into bookmember(id,password,name,tel) values('java3','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('java4','abcd','정우성','01011112222');
insert into bookmember(id,password,name,tel) values('java5','dcba','전지현','01033334444');
insert into bookmember(id,password,name,tel) values('java6','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('java7','abcd','정우성','01011112222');
insert into bookmember(id,password,name,tel) values('java8','dcba','전지현','01033334444');
insert into bookmember(id,password,name,tel) values('java9','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('java10','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('java11','aaaa','아이유','01055556666');

insert into bookmember(id,password,name,tel) values('jquery1','abcd','정우성','01011112222');
insert into bookmember(id,password,name,tel) values('jquery2','dcba','전지현','01033334444');
insert into bookmember(id,password,name,tel) values('jquery3','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('jquery4','abcd','정우성','01011112222');
insert into bookmember(id,password,name,tel) values('jquery5','dcba','전지현','01033334444');
insert into bookmember(id,password,name,tel) values('jquery6','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('jquery7','abcd','정우성','01011112222');
insert into bookmember(id,password,name,tel) values('jquery8','dcba','전지현','01033334444');
insert into bookmember(id,password,name,tel) values('jquery9','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('jquery10','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('jquery11','aaaa','아이유','01055556666');

insert into bookmember(id,password,name,tel) values('jdbc1','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('jdbc2','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('jdbc3','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('jdbc4','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('jdbc5','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('jdbc6','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('jdbc7','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('jdbc8','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('jdbc9','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('jdbc10','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('jdbc11','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('jdbc12','aaaa','아이유','01055556666');

insert into bookmember(id,password,name,tel) values('ajax1','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('ajax2','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('ajax3','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('ajax4','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('ajax5','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('ajax6','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('ajax7','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('ajax8','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('ajax9','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('ajax10','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('ajax11','aaaa','아이유','01055556666');
insert into bookmember(id,password,name,tel) values('ajax12','aaaa','아이유','01055556666');

commit
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
insert into booking(senderid,receiverid) values('java','jdbc');
insert into booking(senderid,receiverid) values('java','java1');
insert into booking(senderid,receiverid) values('java','java2');
insert into booking(senderid,receiverid) values('java','java3');
insert into booking(senderid,receiverid) values('java','java4');
insert into booking(senderid,receiverid) values('java','java5');
insert into booking(senderid,receiverid) values('java','java6');
insert into booking(senderid,receiverid) values('java','java7');
insert into booking(senderid,receiverid) values('java','java8');
insert into booking(senderid,receiverid) values('java','java9');
insert into booking(senderid,receiverid) values('java','java10');
insert into booking(senderid,receiverid) values('java','java11');
insert into booking(senderid,receiverid) values('java','jquery1');
insert into booking(senderid,receiverid) values('java','jquery2');
insert into booking(senderid,receiverid) values('java','jquery3');
insert into booking(senderid,receiverid) values('java','jquery4');
insert into booking(senderid,receiverid) values('java','jquery5');
insert into booking(senderid,receiverid) values('java','jquery6');
insert into booking(senderid,receiverid) values('java','jquery7');
insert into booking(senderid,receiverid) values('java','jquery8');
insert into booking(senderid,receiverid) values('java','jquery9');
insert into booking(senderid,receiverid) values('java','jquery10');
insert into booking(senderid,receiverid) values('java','jquery11');
insert into booking(senderid,receiverid) values('java','jdbc1');
insert into booking(senderid,receiverid) values('java','jdbc2');
insert into booking(senderid,receiverid) values('java','jdbc3');
insert into booking(senderid,receiverid) values('java','jdbc4');
insert into booking(senderid,receiverid) values('java','jdbc5');
insert into booking(senderid,receiverid) values('java','jdbc6');
insert into booking(senderid,receiverid) values('java','jdbc7');
insert into booking(senderid,receiverid) values('java','jdbc8');
insert into booking(senderid,receiverid) values('java','jdbc9');
insert into booking(senderid,receiverid) values('java','jdbc10');
insert into booking(senderid,receiverid) values('java','jdbc11');
insert into booking(senderid,receiverid) values('java','jdbc12');
insert into booking(senderid,receiverid) values('java','ajax1');
insert into booking(senderid,receiverid) values('java','ajax2');
insert into booking(senderid,receiverid) values('java','ajax3');
insert into booking(senderid,receiverid) values('java','ajax4');
insert into booking(senderid,receiverid) values('java','ajax5');
insert into booking(senderid,receiverid) values('java','ajax6');
insert into booking(senderid,receiverid) values('java','ajax7');
insert into booking(senderid,receiverid) values('java','ajax8');
insert into booking(senderid,receiverid) values('java','ajax9');
insert into booking(senderid,receiverid) values('java','ajax10');
insert into booking(senderid,receiverid) values('java','ajax11');
insert into booking(senderid,receiverid) values('java','ajax12');

insert into booking(senderid,receiverid) values('jquery','java');
insert into booking(senderid,receiverid) values('jquery','java1');
insert into booking(senderid,receiverid) values('jquery','java2');
insert into booking(senderid,receiverid) values('jquery','java3');

select receiverid from booking where senderid='java';
select count(*) from booking where senderid='java';
select receiverid from booking where senderid='jquery';
select count(*) from booking where senderid='jquery';
select receiberid from booking where senderid='jdbc';
select count(*) from booking where senderid='jdbc';

-- 정우성의 부킹멤버 취소
delete from booking where senderid='java' and receiverid='java11';

-- 부킹확인
select count(*)from booking where senderid='java' and receiverid='jquery';
select count(*)from booking where senderid='jquery' and receiverid='java11';
-- 아래꺼부터 드롭
drop table book;
drop sequence bookno_seq;
drop table bookmember;
drop table review;
drop table saw;
drop table wish;
drop table booking;

-- insert BOOK 
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (1,'부의 미래',0,'앨빈 토플러','청림출판',to_date('06/08/20','RR/MM/DD'),'경영/경제');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (2,'클라우스 슈밥의 제4차 산업혁명',0,'클라우스 슈밥','새로운현재',to_date('16/04/20','RR/MM/DD'),'경영/경제');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (3,'삶의 정도',0,'윤석철','위즈덤하우스',to_date('11/01/10','RR/MM/DD'),'경영/경제');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (4,'트렌드 큐레이팅 아이디어',0,'로히트 바르가바','심포지아',to_date('17/03/09','RR/MM/DD'),'경영/경제');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (5,'기브 앤 테이크',0,'애덤 그랜트','생각연구소',to_date('13/06/07','RR/MM/DD'),'경영/경제');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (6,'어떻게 원하는 것을 얻는가',0,'스튜어트 다이아몬드','8',to_date('17/03/10','RR/MM/DD'),'경영/경제');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (7,'바젤3 모멘트',0,'박홍기','익두스',to_date('17/03/05','RR/MM/DD'),'경영/경제');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (8,'필립 코틀러의 마켓 4.0',0,'필립 코틀러 외 2명','더퀘스트',to_date('17/02/17','RR/MM/DD'),'경영/경제');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (9,'세계미래보고서 2055',0,'박영숙 외 1명','비즈니스북스',to_date('17/01/20','RR/MM/DD'),'경영/경제');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (10,'Re think, 오래된 생각의 귀환',0,'스티븐 풀','쌤앤파커스',to_date('17/02/24','RR/MM/DD'),'경영/경제');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (11,'이것이 실전회계다',0,'김수헌 외 1명','어바웃어북',to_date('16/12/23','RR/MM/DD'),'경영/경제');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (12,'영업은 배반하지 않는다',0,'임진환','쌤앤파커스',to_date('16/11/25','RR/MM/DD'),'경영/경제');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (13,'Value Timer의 전략적 가치투자',0,'신지오','이콘',to_date('09/04/10','RR/MM/DD'),'경영/경제');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (14,'윤성우의 열혈 C 프로그래밍',0,'윤성우','오렌지미디어',to_date('10/11/01','RR/MM/DD'),'IT');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (15,'Do it! 안드로이드 앱 프로그래밍',0,'정재곤','이지스퍼블리싱',to_date('17/02/21','RR/MM/DD'),'IT');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (16,'Java의 정석',0,'남궁성','도우출판',to_date('16/02/01','RR/MM/DD'),'IT');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (17,'밑바닥부터 시작하는 딥러닝',0,'사이토 고키','한빛미디어',to_date('17/01/02','RR/MM/DD'),'IT');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (18,'Growth Hacking',0,'라이언 홀리데이','길벗',to_date('15/04/13','RR/MM/DD'),'IT');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (19,'미래를 바꾼 아홉가지 알고리즘',0,'존 맥코믹','에이콘출판사',to_date('13/05/31','RR/MM/DD'),'IT');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (20,'Head First Servlets & JSP',0,'케이시 시에라','한빛미디어',to_date('09/02/27','RR/MM/DD'),'IT');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (21,'모던 웹을 위한 Node.js 프로그래밍',0,'윤인성','한빛미디어',to_date('16/07/01','RR/MM/DD'),'IT');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (22,'모던 웹을 위한 JavaScript + jQuery 입문',0,'윤인성','한빛미디어',to_date('13/09/10','RR/MM/DD'),'IT');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (23,'C로 배우는 쉬운 자료구조',0,'이지영','한빛아카데미',to_date('16/07/28','RR/MM/DD'),'IT');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (24,'알기 쉬운 알고리즘',0,'양성봉','생능출판',to_date('13/02/05','RR/MM/DD'),'IT');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (25,'프로그래밍 콘테스트 챌린징',0,'타쿠야 아키바 외 1명','로드북',to_date('11/10/24','RR/MM/DD'),'IT');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (26,'운영체제',0,'Silberschatz 외 3명','교보문고',to_date('14/09/15','RR/MM/DD'),'IT');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (27,'원피스',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (28,'나루토',0,'키시모토 마사시','대원',to_date('16/08/26','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (29,'블리치',0,'쿠보','서울문화사',to_date('17/02/24','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (30,'데스노트',0,'오바타 타케시','대원씨아이',to_date('14/10/08','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (31,'강철의 연금술사',0,'히루미 아라카와','학산문화사',to_date('15/10/15','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (32,'포켓몬스터',0,'쿠사카 히데노리','대원',to_date('99/08/31','RR/MM/DD'),'만화'); 
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (33,'너의 이름은',0,'신카이 마코토','대원씨아이',to_date('16/12/30','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (34,'언어의 정원',0,'신카이 마코토','대원씨아이',to_date('17/01/06','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (35,'시간을 달리는 소녀',0,'츠츠이 야스타카','북스토리',to_date('14/10/15','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (36,'4월은 너의 거짓말',0,'아라카와 나오시','학산문화사',to_date('16/09/30','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (37,'명탐정 코난',0,'아오야마 고쇼','서울문화사',to_date('17/02/28','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (38,'테니스의 왕자',0,'코노미 타케시','대원',to_date('16/05/04','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (39,'하울의 움직이는 성',0,'미야자키 하야오','대원',to_date('13/06/17','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (40,'정의란 무엇인가',0,'마이클 샌델','와이즈베리',to_date('14/11/20','RR/MM/DD'),'인문');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (41,'인간 불평등 기원론',0,'장 자크 루소','펭귄 클래식 코리아',to_date('15/04/08','RR/MM/DD'),'인문');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (42,'정의의 한계',0,'마이클 샌델','멜론',to_date('12/03/01','RR/MM/DD'),'인문');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (43,'언어의 온도',0,'이기주','말글터',to_date('16/08/19','RR/MM/DD'),'인문');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (44,'센서티브',0,'일자 샌드','다산3.0',to_date('17/02/15','RR/MM/DD'),'인문');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (45,'숨결이 바람될 때',0,'폴 칼라니티','흐름출판',to_date('16/08/19','RR/MM/DD'),'인문');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (46,'열한 계단',0,'채사장','웨일북',to_date('16/12/08','RR/MM/DD'),'인문');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (47,'책은 도끼다',0,'박웅현','북하우스',to_date('11/10/10','RR/MM/DD'),'인문');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (48,'백년을 살아보니',0,'김형석','덴스토리',to_date('16/08/01','RR/MM/DD'),'인문');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (49,'어떻게 질문할 것인가',0,'김대식','민음사',to_date('17/03/05','RR/MM/DD'),'인문');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (50,'미움받을 용기',0,'기시미 이치로 외 1명','인플루엔셜',to_date('14/11/17','RR/MM/DD'),'인문');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (51,'지적 대화를 위한 넓고 얕은 지식',0,'채사장','한빛비즈',to_date('14/12/05','RR/MM/DD'),'인문');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (52,'사피엔스',0,'유발 하라리','김영사',to_date('15/11/23','RR/MM/DD'),'인문');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (53,'기린의 날개',0,'히가시노 게이고','재인',to_date('17/02/06','RR/MM/DD'),'소설');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (54,'나미야 잡화점의 기적',0,'히가시노 게이고','현대문학',to_date('12/12/19','RR/MM/DD'),'소설');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (55,'공터에서',0,'김훈','해냄',to_date('17/02/01','RR/MM/DD'),'소설');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (56,'축복',0,'켄트 하루프','문학동네',to_date('17/02/27','RR/MM/DD'),'소설');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (57,'아주 긴 변명',0,'니시카와 미와','무소의뿔',to_date('17/02/15','RR/MM/DD'),'소설');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (58,'두 번 사는 사람들',0,'황현진','문학동네',to_date('17/02/28','RR/MM/DD'),'소설');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (59,'고슴도치의 소원',0,'톤 텔레헨','arte',to_date('17/02/13','RR/MM/DD'),'소설');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (60,'오래된 생각',0,'윤태영','위즈덤하우스',to_date('17/03/17','RR/MM/DD'),'소설');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (61,'당신 인생의 이야기',0,'테드 창','엘리',to_date('16/10/04','RR/MM/DD'),'소설');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (62,'소년이 온다',0,'한강','창비',to_date('14/05/09','RR/MM/DD'),'소설');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (63,'브루클린의 소녀',0,'기욤 뮈소','밝은세상',to_date('16/12/06','RR/MM/DD'),'소설');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (64,'이브',0,'윌리엄 폴 영','세계사',to_date('17/03/02','RR/MM/DD'),'소설');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (65,'앵무새 죽이기',0,'하퍼 리','열린책들',to_date('15/06/30','RR/MM/DD'),'소설');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (66,'스펙이라는 거짓말',0,'오쿠야마 노리아키 외 1명','새로운현재',to_date('14/04/10','RR/MM/DD'),'자기계발');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (67,'자존감 수업',0,'윤홍균','심플라이프',to_date('16/08/25','RR/MM/DD'),'자기계발');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (68,'완벽한 공부법',0,'고영성 외 1명','로크미디어',to_date('17/01/06','RR/MM/DD'),'자기계발');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (69,'혼자 잘해주고 상처받지 마라',0,'유은정','21세기북스',to_date('16/10/27','RR/MM/DD'),'자기계발');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (70,'1만권 독서법',0,'인나미 아쓰시','위즈덤하우스',to_date('16/01/19','RR/MM/DD'),'자기계발');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (71,'불안하면 지금 시작하라',0,'리샹룽','북플라자',to_date('17/03/10','RR/MM/DD'),'자기계발');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (72,'기적의 집중력',0,'모리 겐지로','비즈니스북스',to_date('17/02/28','RR/MM/DD'),'자기계발');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (73,'미라클 모닝',0,'할 엘로드','한빛비즈',to_date('16/02/22','RR/MM/DD'),'자기계발');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (74,'옥스퍼드,천년의가르침',0,'오카다 아키토','올댓북스',to_date('17/02/27','RR/MM/DD'),'자기계발');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (75,'멀리 보려면 높이 날아라',0,'윤정연 외 1명','RHK',to_date('17/02/28','RR/MM/DD'),'자기계발');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (76,'떨지 않고 말 잘하는 법',0,'이진희 외 1명','심플라이프',to_date('16/08/10','RR/MM/DD'),'자기계발');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (77,'카피책',0,'정철','허밍버드',to_date('16/01/25','RR/MM/DD'),'자기계발');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (78,'기획의 신',0,'임영균','스몰빅라이프',to_date('17/03/20','RR/MM/DD'),'자기계발');

Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (79,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (80,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (81,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (82,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (83,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (84,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (85,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (86,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (87,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (88,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (89,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (90,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (91,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (92,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (93,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (94,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');
Insert into SCOTT.BOOK (BOOKNO,TITLE,RATE,AUTHOR,PUB,PUBDATE,GENRE) values (95,'원피스1',0,'오다 에이치로','대원',to_date('16/11/25','RR/MM/DD'),'만화');

	select id from bookmember where name='페이커' and  tel='011';
select count(*) from bookmember where name='페이커'and tel='011';
insert into bookmember(id,password,name,tel) values ('카레보이','1234','페이커','011');


update book set rate=(select avg(star) from review where bookno=1) 
select rate from book where bookno=1
select * from book
