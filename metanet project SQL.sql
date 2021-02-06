--테이블 초기화--
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE IMAGE CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;


--시퀀스 제거--
DROP SEQUENCE reply_SEQ;
DROP SEQUENCE Board_SEQ;
DROP SEQUENCE image_SEQ;
DROP SEQUENCE User_SEQ;

-------------테이블 생성-----------------
--게시판 테이블 생성--

CREATE TABLE Board
(
    post_code      NUMBER            NULL,  
    post_title       VARCHAR2(300)     NULL,
    post_content     VARCHAR2(3000)    NULL,
    post_love        NUMBER            DEFAULT 0 NULL,
    post_count       NUMBER            DEFAULT 0 NULL, 
    write_date       DATE              DEFAULT SYSDATE NULL,
    modify_date      DATE              DEFAULT SYSDATE NULL,
    user_code        NUMBER            NULL,
    region_code      NUMBER            NOT NULL,
    region_name      VARCHAR(200)      NOT NULL,
    region_GB        NUMBER            NOT NULL,
    CONSTRAINT BOARD_PK PRIMARY KEY (post_code)
);

--게시판 코멘트 생성--
COMMENT ON TABLE Board IS '게시판';

COMMENT ON COLUMN Board.post_code IS '게시물코드';

COMMENT ON COLUMN Board.user_code IS '사용자코드';

COMMENT ON COLUMN Board.write_date IS '작성일';

COMMENT ON COLUMN Board.post_count IS '조회수';

COMMENT ON COLUMN Board.post_love IS '좋아요수';

COMMENT ON COLUMN Board.post_content IS '내용';

COMMENT ON COLUMN Board.post_title IS '제목';

COMMENT ON COLUMN Board.modify_date IS '수정일';

-- CREATE TABLE Board
-- (
--     post_code      NUMBER            NULL,  
--     post_title       VARCHAR2(300)     NULL,
--     post_content     VARCHAR2(3000)    NULL,
--     post_love        NUMBER            DEFAULT 0 NULL,
--     post_count       NUMBER            DEFAULT 0 NULL, 
--     issue_post_yn    VARCHAR2(3)       DEFAULT 0 NULL, 
--     write_date       DATE              DEFAULT SYSDATE NULL,
--     modify_date      DATE              DEFAULT SYSDATE NULL,
--     user_code        NUMBER            NULL,
--     board_code       NUMBER            NOT NULL,
--     CONSTRAINT BOARD_PK PRIMARY KEY (post_code)
-- );

--유저 테이블 생성--        
CREATE TABLE MEMBER
(
    user_code     NUMBER          NOT NULL, 
    user_id       VARCHAR2(50)    NULL, 
    user_pwd      VARCHAR2(50)    NULL, 
    user_email    VARCHAR2(50)    NULL, 
    user_name     VARCHAR2(50)    NULL, 
    user_tel      VARCHAR2(20)    NULL, 
    sign_date     DATE            DEFAULT SYSDATE NULL , 
    CONSTRAINT USER_PK PRIMARY KEY (user_code)
);

--유저테이블 코멘트 생성--
COMMENT ON TABLE MEMBER IS '사용자';
COMMENT ON COLUMN MEMBER.user_code IS '사용자코드';
COMMENT ON COLUMN MEMBER.user_id IS '아이디';
COMMENT ON COLUMN MEMBER.user_pwd IS '비밀번호';
COMMENT ON COLUMN MEMBER.user_email IS '이메일';
COMMENT ON COLUMN MEMBER.user_name IS '이름';
COMMENT ON COLUMN MEMBER.user_tel IS '핸드폰번호';
COMMENT ON COLUMN MEMBER.sign_date IS '가입일자';

--이미지 테이블 생성--
CREATE TABLE image
(
    file_code        NUMBER           NOT NULL, 
    file_path        VARCHAR2(50)     NULL, 
    file_name        VARCHAR2(50)     NULL, 
    file_name_pwd    VARCHAR2(100)    NULL, 
    post_code        NUMBER           NULL, 
    CONSTRAINT IMAGE_PK PRIMARY KEY (file_code)
);

--이미지 테이블 코멘트--
COMMENT ON TABLE image IS '첨부파일';
COMMENT ON COLUMN image.file_code IS '파일코드';
COMMENT ON COLUMN image.file_path IS '파일경로';
COMMENT ON COLUMN image.file_name IS '파일명';
COMMENT ON COLUMN image.file_name_pwd IS '파일명(암호)';
COMMENT ON COLUMN image.post_code IS '게시물코드';

 --댓글 테이블 생성--       
CREATE TABLE reply
(
    reply_code          NUMBER           NOT NULL,
    reply_content       VARCHAR2(500)    NULL, 
    post_code           NUMBER           NULL, 
    reply_write_date    DATE             DEFAULT SYSDATE NULL, 
    reply_modi_date     DATE             DEFAULT SYSDATE NULL, 
    CONSTRAINT REPLY_PK PRIMARY KEY (reply_code)
);

--댓글 코멘트--
COMMENT ON TABLE reply IS '댓글';
COMMENT ON COLUMN reply.reply_code IS '댓글코드';
COMMENT ON COLUMN reply.post_code IS '게시물코드';
COMMENT ON COLUMN reply.reply_write_date IS '작성일';
COMMENT ON COLUMN reply.reply_modi_date IS '수정일';
COMMENT ON COLUMN reply.reply_content IS '댓글내용';
      
--------시퀀스 생성--------
--게시물 시퀀스 생성--
CREATE SEQUENCE Board_SEQ
START WITH 1
INCREMENT BY 1;

--유저 시퀀스 생성--
CREATE SEQUENCE User_SEQ
START WITH 1
INCREMENT BY 1;

--이미지 시퀀스 생성--
CREATE SEQUENCE image_SEQ
START WITH 1
INCREMENT BY 1;

--댓글 시퀀스 생성--
CREATE SEQUENCE reply_SEQ
START WITH 1
INCREMENT BY 1;

----------외래키 생성---------

--게시판 테이블 외래키 설정--

ALTER TABLE Board
    ADD CONSTRAINT FK_Board_user_code FOREIGN KEY (user_code)
        REFERENCES member (user_code);  

--이미지 테이블 외래키 설정--
ALTER TABLE image
    ADD CONSTRAINT FK_image_post_code FOREIGN KEY (post_code)
        REFERENCES Board (post_code);
        
--댓글 외래키 생성--
ALTER TABLE reply
    ADD CONSTRAINT FK_reply_post_code FOREIGN KEY (post_code)
        REFERENCES Board (post_code);



------------------------------------------------------------------


--회원가입
insert into Member(user_code, user_id, user_pwd, user_email, user_name, user_tel) values((select nvl(max(user_code),0)+1 as user_code from Member), 'HyeokChan@gmail.com', 'gurcks123', 'okhx4872@hanmail.net', '권혁찬', '01095584872');
--sign_date는 default sysdate처리

--글쓰기 insert
insert into Board(post_code, post_title, post_content, user_code, region_code, region_name, region_GB) values((select nvl(max(post_code),0)+1 as post_code from Board), '한강 공원1', '날씨도 좋고 너무 즐거웠어요!', 1, 10, '마포구', 0);
-- post_love는 default 0처리
-- post_count는 default 0처리
-- issue_post_yn은 default 0처리 (지금 varchar로 되어있음)
-- write_date는 default sysdate처리
-- modify_date는 default sysdate처리 (첫 작성 시에는 write_date와 같다)

--댓글 쓰기
insert into Reply(reply_code, reply_content, post_code) values((select nvl(max(reply_code),0)+1 as reply_code from Reply), '저도 가보려구요!', 1);
-- reply_write_date는 default sysdate처리
-- reply_modify_date는 default sysdate처리 (첫 작성 시에는 write_date와 같다)

--글 리스트 전체 조회
select post_code, user_code, post_title, post_content, post_love from board;

-- 글 리스트 강남 조회 (강북 region_gb=0)
select post_code, user_code, post_title, post_content, post_love from board where region_gb=1;

-- 글 리스트 특정위치 조회
select post_code, user_code, post_title, post_content, post_love from board where region_code=20;

--좋아요 증가
update board set post_love=post_love+1 where post_code=1;
--조회수 증가
update board set post_count=post_count+1 where post_code=1;

-- 통합 테이블에서 가장 좋아요가 많은 글 찾기
select aa.region_code, aa.post_love, aa.post_code from board aa, (select region_code, max(post_love) as post_love from board group by region_code) bb
where bb.post_love>0 and aa.post_love = bb.post_love and aa.region_code = bb.region_code;
--select region_code, post_love, post_code from boardtest;
--select region_code, max(post_love) as post_love from boardtest group by region_code;

----------------------------TEST--------------------------------

--게시판 관리 정보 세팅
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '도봉수', 0);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '강북구', 0);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '노원구', 0);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '은평구', 0);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '서대문구', 0);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '종로구', 0);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '성북구', 0);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '동대문구', 0);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '중랑구', 0);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '마포구', 0);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '중구', 0);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '용산구', 0);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '성동구', 0);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '광진구', 0);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '강서구', 1);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '양천구', 1);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '구로구', 1);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '영등포구', 1);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '금천구', 1);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '동작구', 1);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '관악구', 1);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '서초구', 1);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '강남구', 1);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '송파구', 1);
-- insert into Board_manage(board_code, board_name, nambuk_yn) values ((select nvl(max(board_code),0)+1 as user_code from Board_manage), '강동구', 1);


--테스트용 사용했던 데이터
-- insert into Board(post_code, post_title, post_content, user_code, region_code, region_name, region_GB) values((select nvl(max(post_code),0)+1 as post_code from Board), '한강 공원1', '날씨도 좋고 너무 즐거웠어요!', 6, 10, '마포구', 0);
-- insert into Board(post_code, post_title, post_content, user_code, region_code, region_name, region_GB) values((select nvl(max(post_code),0)+1 as post_code from Board), '한강 공원2', '날씨도 좋고 너무 즐거웠어요!', 6, 10, '마포구', 0);
-- insert into Board(post_code, post_title, post_content, user_code, region_code, region_name, region_GB) values((select nvl(max(post_code),0)+1 as post_code from Board), '한강 공원3', '날씨도 좋고 너무 즐거웠어요!', 6, 10, '마포구', 0);
-- insert into Board(post_code, post_title, post_content, user_code, region_code, region_name, region_GB) values((select nvl(max(post_code),0)+1 as post_code from Board), '한강 공원4', '날씨도 좋고 너무 즐거웠어요!', 6, 10, '마포구', 0);
-- insert into Board(post_code, post_title, post_content, user_code, region_code, region_name, region_GB) values((select nvl(max(post_code),0)+1 as post_code from Board), '한강 공원5', '날씨도 좋고 너무 즐거웠어요!', 6, 10, '마포구', 0);
-- insert into Board(post_code, post_title, post_content, user_code, region_code, region_name, region_GB) values((select nvl(max(post_code),0)+1 as post_code from Board), '한강 공원6', '날씨도 좋고 너무 즐거웠어요!', 6, 10, '마포구', 0);

-- insert into Board(post_code, post_title, post_content, user_code, region_code, region_name, region_GB) values((select nvl(max(post_code),0)+1 as post_code from Board), '한강1', '날씨도 좋고 너무 즐거웠어요!', 6, 12, '중랑구', 0);
-- insert into Board(post_code, post_title, post_content, user_code, region_code, region_name, region_GB) values((select nvl(max(post_code),0)+1 as post_code from Board), '한강2', '날씨도 좋고 너무 즐거웠어요!', 6, 12, '중랑구', 0);
-- insert into Board(post_code, post_title, post_content, user_code, region_code, region_name, region_GB) values((select nvl(max(post_code),0)+1 as post_code from Board), '한강3', '날씨도 좋고 너무 즐거웠어요!', 6, 12, '중랑구', 0);

-- insert into Board(post_code, post_title, post_content, user_code, region_code, region_name, region_GB) values((select nvl(max(post_code),0)+1 as post_code from Board), '구로구관광지1', '날씨도 좋고 너무 즐거웠어요!', 6, 20, '구로구', 1);
-- insert into Board(post_code, post_title, post_content, user_code, region_code, region_name, region_GB) values((select nvl(max(post_code),0)+1 as post_code from Board), '구로구관광지2', '날씨도 좋고 너무 즐거웠어요!', 6, 20, '구로구', 1);
-- insert into Board(post_code, post_title, post_content, user_code, region_code, region_name, region_GB) values((select nvl(max(post_code),0)+1 as post_code from Board), '구로구관광지3', '날씨도 좋고 너무 즐거웠어요!', 6, 20, '구로구', 1);

commit;
