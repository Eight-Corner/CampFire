-- 
CREATE SEQUENCE SEQ_REVIEW_BOARD;

-- DROP TABLE TBL_REVIEW_BOARD CASCADE CONSTRAINTS;
CREATE TABLE TBL_REVIEW_BOARD(
	BNO NUMBER(10),
	TITLE VARCHAR2(200) NOT NULL,
	CONTENT VARCHAR2(2000) NOT NULL,
	WRITER VARCHAR2(200) NOT NULL,
	REGDATE DATE DEFAULT SYSDATE,
	UPDATEDATE DATE DEFAULT SYSDATE,
	LIKECNT NUMBER DEFAULT 0,
	READCNT NUMBER DEFAULT 0,
	REPLYCNT NUMBER DEFAULT 0,
	ZIPCODE VARCHAR2(20) NOT NULL,
	ADDRESS VARCHAR2(300) NOT NULL,
	ADDRESS_DETAIL VARCHAR2(300) NOT NULL,
	ADDRESS_ETC VARCHAR2(100) NOT NULL,
	STAR VARCHAR2(30) DEFAULT '★'
);

ALTER TABLE TBL_REVIEW_BOARD ADD CONSTRAINT PK_REVIEW_BOARD PRIMARY KEY(BNO);
ALTER TABLE TBL_REVIEW_BOARD ADD CONSTRAINT FK_REVIEW_BOARD FOREIGN KEY(WRITER) REFERENCES CF_USER(userId) ON DELETE CASCADE;

-------------------추가 컬럼---------------------------------

ALTER TABLE TBL_REVIEW_BOARD ADD (READCNT NUMBER DEFAULT 0);
ALTER TABLE TBL_REVIEW_BOARD ADD (ZIPCODE VARCHAR2(20));
ALTER TABLE TBL_REVIEW_BOARD ADD (ADDRESS VARCHAR2(300));
ALTER TABLE TBL_REVIEW_BOARD ADD (ADDRESS_DETAIL VARCHAR2(300));
ALTER TABLE TBL_REVIEW_BOARD ADD (ADDRESS_ETC VARCHAR2(100));
ALTER TABLE TBL_REVIEW_BOARD ADD (STAR VARCHAR2(30));
-------------------여기까지----------------------------------


UPDATE TBL_REVIEW_BOARD SET REPLYCNT = (SELECT COUNT(RNO) FROM TBL_REVIEW_REPLY 
WHERE TBL_REVIEW_REPLY.BNO = TBL_REVIEW_BOARD.BNO);


INSERT INTO TBL_REVIEW_BOARD
(BNO, TITLE, CONTENT, WRITER, REGDATE, ZIPCODE, ADDRESS, ADDRESS_DETAIL, ADDRESS_ETC)
VALUES(SEQ_REVIEW_BOARD.NEXTVAL, '가즈아~', '으디를 가~! !!!', 'test1', SYSDATE, '21212', '인천광역시', '부평구', '동동동' 
);

SELECT * FROM TBL_REVIEW_BOARD ORDER BY BNO desc;


INSERT INTO TBL_REVIEW_BOARD (BNO, TITLE, CONTENT, WRITER)
(SELECT SEQ_REVIEW_BOARD.NEXTVAL, TITLE, CONTENT, WRITER FROM TBL_REVIEW_BOARD);



---------------------------
-- 댓글 테이블 추가
CREATE SEQUENCE SEQ_REVIEW_REPLY;
-- DROP TABLE TBL_REVIEW_REPLY CASCADE CONSTRAINTS;
CREATE TABLE TBL_REVIEW_REPLY(
	RNO NUMBER(10),
	BNO NUMBER(10) NOT NULL,
	REPLY VARCHAR2(1000) NOT NULL, -- 댓글 
	REPLYER VARCHAR2(100) NOT NULL, -- 작성자
	REPLYDATE DATE DEFAULT SYSDATE, -- 작성날짜 
	UPDATEDATE DATE DEFAULT SYSDATE -- 수정날짜
);

ALTER TABLE TBL_REVIEW_REPLY ADD CONSTRAINT PK_REVIEW_REPLY PRIMARY KEY(RNO);
-- ALTER TABLE TBL_REPLY DROP CONSTRAINT FK_REPLY;

ALTER TABLE TBL_REVIEW_REPLY ADD CONSTRAINT FK_REVIEW_REPLY FOREIGN KEY(BNO)
REFERENCES TBL_REVIEW_BOARD(BNO) ON DELETE CASCADE;
ALTER TABLE TBL_REVIEW_REPLY ADD CONSTRAINT FK_REVIEW_WRITER_REPLY FOREIGN KEY(REPLYER) REFERENCES CF_USER(userId) ON DELETE CASCADE;

SELECT * FROM TBL_REVIEW_REPLY;

INSERT INTO TBL_REVIEW_REPLY (RNO, BNO, REPLY, REPLYER) VALUES (SEQ_REVIEW_REPLY.NEXTVAL, 4, '별로인데용?!', 'test1');


---------------------------------------
-- 파일 첨부 테이블 
DROP TABLE TBL_REVIEW_ATTACH CASCADE CONSTRAINTS;
CREATE TABLE TBL_REVIEW_ATTACH (
	UUID VARCHAR2(200) NOT NULL,
	UPLOADPATH VARCHAR2(200) NOT NULL,
	FILENAME VARCHAR2(200) NOT NULL,
--	FILETYPE CHAR(1) DEFAULT 'I',
	FILETYPE CHAR(1) CHECK(FILETYPE IN(0, 1)), -- 파일타입이 이미지인지 구분하기 위해 지정한다. 0 또는 1이 참이어야지 들어가는 조건식
	BNO NUMBER(10,0)
);

ALTER TABLE TBL_REVIEW_ATTACH ADD CONSTRAINT PK_REVIEW_ATTACH PRIMARY KEY (UUID);
ALTER TABLE TBL_REVIEW_ATTACH ADD CONSTRAINT FK_REVIEW_BOARD_ATTACH FOREIGN KEY(BNO) REFERENCES TBL_REVIEW_BOARD(BNO) ON DELETE CASCADE;

SELECT * FROM TBL_REVIEW_ATTACH;
SELECT * FROM TBL_REVIEW_BOARD ;

--------------------------------------
--리뷰 좋아요 테이블
CREATE TABLE TBL_REVIEW_LIKE (
	BNO NUMBER,
	USERID VARCHAR2(300)
);
ALTER TABLE TBL_REVIEW_LIKE ADD CONSTRAINT FK_REVIEW_BOARD_LIKE FOREIGN KEY(BNO) REFERENCES TBL_REVIEW_BOARD(BNO) ON DELETE CASCADE;
ALTER TABLE TBL_REVIEW_LIKE ADD CONSTRAINT FK_REVIEW_USERID_LIKE FOREIGN KEY(USERID) REFERENCES CF_USER(USERID) ON DELETE CASCADE;
