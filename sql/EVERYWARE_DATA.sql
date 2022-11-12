--COMPANY_CATEGORY 더미 데이터 INSERT

INSERT INTO COMPANY_CATEGORY (CATEGORY_CODE, CATEGORY_NAME ) 
VALUES ( SEQ_COM_CATEGORY_NO.NEXTVAL, '플랫폼 서비스');


COMMIT;    


--COM 더미 데이터 INSERT
INSERT INTO COM (COM_CODE, COM_CATEGORY_CODE, COM_NAME, COM_TEL, COM_FOUNDATION_DATE) 
VALUES (SEQ_COM_NO.NEXTVAL, 1, 'EVERYWARE', '0701111111', SYSDATE);

COMMIT;


--DEPT 더미 데이터 INSERT
INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, 'EVERYWARE', 0, 1);

--기획본부
INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '기획본부', 1, 2); --코드2

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '사업기획팀', 2, 3); --코드3

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '경영기획팀', 2, 3); --코드4

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '연구기획팀', 2, 3); --코드5

--경영지원본부

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '경영지원본부', 1, 2); --코드6

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '회계팀', 6, 3); --코드7

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '인사팀', 6, 3); --코드8

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '설비관리팀', 6, 3); --코드9


--영업본부

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '영업본부', 1, 2); --코드10

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '국내영업팀', 10, 3); --코드11

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '해외영업팀', 10, 3); --코드12


--마케팅본부

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '마케팅본부', 1, 2); --코드13

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '국내마케팅팀', 13, 3); --코드14

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '해외마케팅팀', 13, 3); --코드15

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '홍보팀', 13, 3); --코드16



--연구개발본부

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '연구개발본부', 1, 2); --코드17

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '개발팀', 17, 3); --코드18

INSERT INTO DEPT (DEPT_CODE, DEPT_NAME, HIGH_DEPT_CODE, DEPT_DEPTH)
VALUES (SEQ_DEPT_NO.NEXTVAL, '데이터관리팀', 17, 3); --코드19


COMMIT;




--RANK 더미 데이터 INSERT
INSERT INTO RANK (RANK_CODE, RANK_NAME, RANK_LEVEL)
VALUES (SEQ_RANK_NO.NEXTVAL, '대표이사', 1);


INSERT INTO RANK (RANK_CODE, RANK_NAME, RANK_LEVEL)
VALUES (SEQ_RANK_NO.NEXTVAL, '이사', 2);

INSERT INTO RANK (RANK_CODE, RANK_NAME, RANK_LEVEL)
VALUES (SEQ_RANK_NO.NEXTVAL, '부장', 3);

INSERT INTO RANK (RANK_CODE, RANK_NAME, RANK_LEVEL)
VALUES (SEQ_RANK_NO.NEXTVAL, '차장', 4);

INSERT INTO RANK (RANK_CODE, RANK_NAME, RANK_LEVEL)
VALUES (SEQ_RANK_NO.NEXTVAL, '과장', 5);

INSERT INTO RANK (RANK_CODE, RANK_NAME, RANK_LEVEL)
VALUES (SEQ_RANK_NO.NEXTVAL, '대리', 6);

INSERT INTO RANK (RANK_CODE, RANK_NAME, RANK_LEVEL)
VALUES (SEQ_RANK_NO.NEXTVAL, '사원', 7);

INSERT INTO RANK (RANK_CODE, RANK_NAME, RANK_LEVEL)
VALUES (SEQ_RANK_NO.NEXTVAL, '계약사원', 8);

INSERT INTO RANK (RANK_CODE, RANK_NAME, RANK_LEVEL)
VALUES (SEQ_RANK_NO.NEXTVAL, '인턴', 8); --코드 : 9


COMMIT;

--JOB 더미 데이터 INSERT
INSERT INTO JOB (JOB_CODE, JOB_NAME)
VALUES (SEQ_JOB_NO.NEXTVAL, '경영관리');

INSERT INTO JOB (JOB_CODE, JOB_NAME)
VALUES (SEQ_JOB_NO.NEXTVAL, '기획');

INSERT INTO JOB (JOB_CODE, JOB_NAME)
VALUES (SEQ_JOB_NO.NEXTVAL, '회계');

INSERT INTO JOB (JOB_CODE, JOB_NAME)
VALUES (SEQ_JOB_NO.NEXTVAL, '인사');

INSERT INTO JOB (JOB_CODE, JOB_NAME)
VALUES (SEQ_JOB_NO.NEXTVAL, '설비관리');

INSERT INTO JOB (JOB_CODE, JOB_NAME)
VALUES (SEQ_JOB_NO.NEXTVAL, '영업');

INSERT INTO JOB (JOB_CODE, JOB_NAME)
VALUES (SEQ_JOB_NO.NEXTVAL, '홍보/마케팅');

INSERT INTO JOB (JOB_CODE, JOB_NAME)
VALUES (SEQ_JOB_NO.NEXTVAL, '개발');

INSERT INTO JOB (JOB_CODE, JOB_NAME)
VALUES (SEQ_JOB_NO.NEXTVAL, '데이터관리');

INSERT INTO JOB (JOB_CODE, JOB_NAME)
VALUES (SEQ_JOB_NO.NEXTVAL, '생산');

COMMIT;

--RIGHT 더미 데이터 INSERT
INSERT INTO RIGHT (RIGHT_CODE, RIGHT_NAME) 
VALUES (SEQ_RIGHT_NO.NEXTVAL, '관리자');

INSERT INTO RIGHT (RIGHT_CODE, RIGHT_NAME) 
VALUES (SEQ_RIGHT_NO.NEXTVAL, '인사관리자');

INSERT INTO RIGHT (RIGHT_CODE, RIGHT_NAME) 
VALUES (SEQ_RIGHT_NO.NEXTVAL, '결재관리자');

INSERT INTO RIGHT (RIGHT_CODE, RIGHT_NAME) 
VALUES (SEQ_RIGHT_NO.NEXTVAL, '일반');

COMMIT;




--EMP 더미 데이터 INSERT


--대표이사
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 1
    , 1
    , 1
    , 1
    , '김대표'
    , 'admin'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--기획본부 이사
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
    , EMP_E_MAIL
    , EMP_PHONE
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 2
    , 2
    , 1
    , 4
    , '이이사'
    , 'user01'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
    , 'everyware1234@naver.com'
    , '01012341234'
)
;

--경영지원본부 이사
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 6
    , 2
    , 1
    , 2
    , '박이사'
    , 'insa'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--영업본부 이사
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 10
    , 2
    , 1
    , 4
    , '최이사'
    , 'user03'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--마케팅본부 이사
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 13
    , 2
    , 1
    , 4
    , '정이사'
    , 'user04'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--연구개발본부 이사
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 17
    , 2
    , 1
    , 4
    , '심이사'
    , 'user05'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--사업기획 부장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 3
    , 3
    , 2
    , 4
    , '강부장'
    , 'user06'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--사업기획 차장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 3
    , 4
    , 2
    , 4
    , '나차장'
    , 'user008'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--사업기획 과장1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 3
    , 5
    , 2
    , 4
    , '무과장'
    , 'user009'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--사업기획 과장2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 3
    , 5
    , 2
    , 4
    , '장과장'
    , 'user010'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--사업기획 대리1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 3
    , 6
    , 2
    , 4
    , '손대리'
    , 'user011'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--사업기획 대리2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 3
    , 6
    , 2
    , 4
    , '백대리'
    , 'user012'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--사업기획 사원1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 3
    , 7
    , 2
    , 4
    , '허사원'
    , 'user013'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--사업기획 계약사원
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 3
    , 8
    , 2
    , 4
    , '양계약'
    , 'user014'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--경영기획 부장 
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 4
    , 3
    , 2
    , 4
    , '조부장'
    , 'user07'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--경영기획 차장 
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 4
    , 4
    , 2
    , 4
    , '양차장'
    , 'user002'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--경영기획 과장 
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 4
    , 5
    , 2
    , 4
    , '남과장'
    , 'user003'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--경영기획 대리1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 4
    , 6
    , 2
    , 4
    , '류대리'
    , 'user004'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--경영기획 대리2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 4
    , 6
    , 2
    , 4
    , '신대리'
    , 'user005'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--경영기획 대리3
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 4
    , 6
    , 2
    , 4
    , '천대리'
    , 'user006'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--경영기획 사원
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 4
    , 7
    , 2
    , 4
    , '황사원'
    , 'user007'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--연구기획 부장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 5
    , 3
    , 2
    , 4
    , '윤부장'
    , 'user08'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--연구기획 차장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 5
    , 4
    , 2
    , 4
    , '오차장'
    , 'user93'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--연구기획 과장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 5
    , 5
    , 2
    , 4
    , '곽과장'
    , 'user94'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--연구기획 대리1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 5
    , 6
    , 2
    , 4
    , '김대리'
    , 'user95'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--연구기획 대리2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 5
    , 6
    , 2
    , 4
    , '백대리'
    , 'user96'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--연구기획 사원1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 5
    , 7
    , 2
    , 4
    , '허사원'
    , 'user97'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--연구기획 사원2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 5
    , 7
    , 2
    , 4
    , '유사원'
    , 'user98'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--연구기획 사원3
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 5
    , 7
    , 2
    , 4
    , '손사원'
    , 'user99'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--연구기획 계약사원
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 5
    , 8
    , 2
    , 4
    , '배계약'
    , 'user001'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--회계 부장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 7
    , 3
    , 2
    , 4
    , '강부장'
    , 'user09'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;
--회계 과장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 7
    , 5
    , 2
    , 4
    , '신과장'
    , 'user89'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--회계 대리
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 7
    , 6
    , 2
    , 4
    , '안대리'
    , 'user90'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--회계 대리2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 7
    , 6
    , 2
    , 4
    , '한대리'
    , 'user91'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--회계 사원
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 7
    , 7
    , 2
    , 4
    , '선사원'
    , 'user92'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--인사 부장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 8
    , 3
    , 4
    , 4
    , '황부장'
    , 'user10'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--인사 차장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 8
    , 4
    , 4
    , 2
    , '한차장'
    , 'insa01'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--인사 과장1 (인사관리자)
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 8
    , 5
    , 4
    , 2
    , '나과장'
    , 'insa02'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--인사 과장2 (결재관리자)
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 8
    , 5
    , 4
    , 3
    , '결과장'
    , 'admin2'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--인사 대리
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 8
    , 6
    , 4
    , 2
    , '현대리'
    , 'insa03'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;


--인사 사원1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 8
    , 7
    , 4
    , 4
    , '철사원'
    , 'user86'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--인사 사원2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 8
    , 7
    , 4
    , 4
    , '박사원'
    , 'user87'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;



--설비관리 부장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 9
    , 3
    , 5
    , 4
    , '권부장'
    , 'user11'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--설비관리 차장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 9
    , 4
    , 5
    , 4
    , '배차장'
    , 'user74'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--설비관리 과장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 9
    , 5
    , 5
    , 4
    , '율과장'
    , 'user75'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--설비관리 대리1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 9
    , 6
    , 5
    , 4
    , '빙대리'
    , 'user76'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--설비관리 대리2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 9
    , 6
    , 5
    , 4
    , '수대리'
    , 'user77'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--설비관리 사원1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 9
    , 7
    , 5
    , 4
    , '화사원'
    , 'user78'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--설비관리 사원2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 9
    , 7
    , 5
    , 4
    , '회사원'
    , 'user79'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--설비관리 사원3
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 9
    , 7
    , 5
    , 4
    , '갑사원'
    , 'user80'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--설비관리 인턴
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 9
    , 9
    , 5
    , 4
    , '필인턴'
    , 'user81'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--국내영업 부장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 11
    , 3
    , 6
    , 4
    , '윤부장'
    , 'user12'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--국내영업 차장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 11
    , 4
    , 6
    , 4
    , '구차장'
    , 'user66'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--국내영업 과장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 11
    , 5
    , 6
    , 4
    , '우과장'
    , 'user67'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--국내영업 대리1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 11
    , 6
    , 6
    , 4
    , '주대리'
    , 'user68'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--국내영업 대리2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 11
    , 6
    , 6
    , 4
    , '차대리'
    , 'user69'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--국내영업 사원1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 11
    , 7
    , 6
    , 4
    , '성사원'
    , 'user70'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--국내영업 사원2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 11
    , 7
    , 6
    , 4
    , '남사원'
    , 'user71'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;


--국내영업 사원3
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 11
    , 7
    , 6
    , 4
    , '유사원'
    , 'user72'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--국내영업 인턴
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 11
    , 9
    , 6
    , 4
    , '손인턴'
    , 'user73'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 부장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 12
    , 3
    , 6
    , 4
    , '장부장'
    , 'user13'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 차장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 12
    , 4
    , 6
    , 4
    , '갑차장'
    , 'user58'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 과장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 12
    , 5
    , 6
    , 4
    , '을과장'
    , 'user59'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 대리1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 12
    , 6
    , 6
    , 4
    , '병대리'
    , 'user60'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 대리2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 12
    , 6
    , 6
    , 4
    , '정대리'
    , 'user61'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 사원1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 12
    , 7
    , 6
    , 4
    , '무사원'
    , 'user62'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 사원2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 12
    , 7
    , 6
    , 4
    , '기사원'
    , 'user63'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 사원3
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 12
    , 7
    , 6
    , 4
    , '경사원'
    , 'user64'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 인턴
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 12
    , 9
    , 6
    , 4
    , '신인턴'
    , 'user65'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--국내마케팅 부장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 14
    , 3
    , 7
    , 4
    , '임부장'
    , 'user14'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--국내마케팅 차장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 14
    , 4
    , 7
    , 4
    , '김차장'
    , 'user51'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--국내마케팅 과장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 14
    , 5
    , 7
    , 4
    , '이과장'
    , 'user52'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--국내마케팅 대리1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 14
    , 6
    , 7
    , 4
    , '박대리'
    , 'user53'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--국내마케팅 대리2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 14
    , 6
    , 7
    , 4
    , '최대리'
    , 'user54'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--국내마케팅 사원1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 14
    , 7
    , 7
    , 4
    , '정사원'
    , 'user55'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--국내마케팅 사원2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 14
    , 7
    , 7
    , 4
    , '강사원'
    , 'user56'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;


--국내마케팅 인턴
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 14
    , 9
    , 7
    , 4
    , '윤인턴'
    , 'user57'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외마케팅 부장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 15
    , 3
    , 7
    , 4
    , '한부장'
    , 'user15'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 차장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 15
    , 4
    , 7
    , 4
    , '노차장'
    , 'user43'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 과장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 15
    , 5
    , 7
    , 4
    , '정과장'
    , 'user44'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 대리
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 15
    , 6
    , 7
    , 4
    , '곽대리'
    , 'user45'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 대리2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 15
    , 6
    , 7
    , 4
    , '성대리'
    , 'user46'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 사원1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 15
    , 7
    , 7
    , 4
    , '차사원'
    , 'user47'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 사원2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 15
    , 7
    , 7
    , 4
    , '주사원'
    , 'user48'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 사원3
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 15
    , 7
    , 7
    , 4
    , '우사원'
    , 'user49'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--해외영업 인턴
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 15
    , 9
    , 7
    , 4
    , '구인턴'
    , 'user50'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;






--홍보팀 부장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 16
    , 3
    , 7
    , 4
    , '오부장'
    , 'user16'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--홍보 차장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 16
    , 4
    , 7
    , 4
    , '유차장'
    , 'user35'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--홍보 과장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 16
    , 5
    , 7
    , 4
    , '남과장'
    , 'user36'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--홍보 대리1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 16
    , 6
    , 7
    , 4
    , '노대리'
    , 'user37'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--홍보 대리2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 16
    , 6
    , 7
    , 4
    , '정대리'
    , 'user38'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--홍보 사원1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 16
    , 7
    , 7
    , 4
    , '하사원'
    , 'user39'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--홍보 사원2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 16
    , 7
    , 7
    , 4
    , '곽사원'
    , 'user40'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--홍보 사원3
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 16
    , 7
    , 7
    , 4
    , '성사원'
    , 'user41'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--홍보 인턴
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 16
    , 9
    , 7
    , 4
    , '차인턴'
    , 'user42'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

--개발 부장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 18
    , 3
    , 8
    , 4
    , '서부장'
    , 'user17'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

-- 개발 차장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 18
    , 4
    , 8
    , 4
    , '양차장'
    , 'user27'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

-- 개발 과장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 18
    , 5
    , 8
    , 4
    , '송과장'
    , 'user28'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

-- 개발 대리1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 18
    , 6
    , 8
    , 4
    , '손대리'
    , 'user29'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

-- 개발 대리2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 18
    , 6
    , 8
    , 4
    , '배대리'
    , 'user30'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

-- 개발 사원1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 18
    , 7
    , 8
    , 4
    , '조사원'
    , 'user31'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

-- 개발 사원2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 18
    , 7
    , 8
    , 4
    , '백사원'
    , 'user32'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

SELECT * FROM EMP;

-- 개발 사원3
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 18
    , 7
    , 8
    , 4
    , '허사원'
    , 'user33'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

-- 개발 인턴
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 18
    , 9
    , 8
    , 4
    , '유인턴'
    , 'user34'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

-- 데이터관리 부장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 19
    , 3
    , 9
    , 4
    , '신부장'
    , 'user18'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;


-- 데이터관리 차장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 19
    , 4
    , 9
    , 4
    , '안차장'
    , 'user19'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

-- 데이터관리 과장
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 19
    , 5
    , 9
    , 4
    , '송과장'
    , 'user20'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

-- 데이터관리 대리1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 19
    , 6
    , 9
    , 4
    , '류대리'
    , 'user21'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

-- 데이터관리 대리2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 19
    , 6
    , 9
    , 4
    , '문대리'
    , 'user22'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

-- 데이터관리 사원1
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 19
    , 7
    , 9
    , 4
    , '전사원'
    , 'user23'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

-- 데이터관리 사원2
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 19
    , 7
    , 9
    , 4
    , '홍사원'
    , 'user24'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

-- 데이터관리 사원3
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 19
    , 7
    , 9
    , 4
    , '고사원'
    , 'user25'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;

-- 데이터관리 인턴
INSERT INTO EMP (
    EMP_CODE
    , COM_CODE
    , DEPT_CODE
    , RANK_CODE
    , EMP_JOB_CODE
    , RIGHT_CODE
    , EMP_NAME
    , EMP_ID
    , EMP_PWD
) VALUES (
    SEQ_EMP_NO.NEXTVAL
    , 1
    , 19
    , 9
    , 9
    , 4
    , '문인턴'
    , 'user26'
    , '$2a$10$G/ZyLA3N/MpOiZlCKHRlwuivRAE5jHF3FvEp45DR3WKImeXpWioLS'
)
;


COMMIT;



--CEO 더미 데이터 INSERT
INSERT INTO CEO (CEO_CODE, COM_CODE, EMP_CODE, CEO_TEL, CEO_REGISTER_DATE)
VALUES (SEQ_CEO_NO.NEXTVAL, 1, 1,'0702222222', SYSDATE);


COMMIT;


--결재문서 보존연한----------------------------------------------------------------
INSERT INTO DOC_RETENTION_PERIOD (PERIOD_CODE, PERIOD) VALUES (SEQ_DOC_RETENTION_PERIOD_CODE.NEXTVAL, '1년');
INSERT INTO DOC_RETENTION_PERIOD (PERIOD_CODE, PERIOD) VALUES (SEQ_DOC_RETENTION_PERIOD_CODE.NEXTVAL, '3년');
INSERT INTO DOC_RETENTION_PERIOD (PERIOD_CODE, PERIOD) VALUES (SEQ_DOC_RETENTION_PERIOD_CODE.NEXTVAL, '5년');
INSERT INTO DOC_RETENTION_PERIOD (PERIOD_CODE, PERIOD) VALUES (SEQ_DOC_RETENTION_PERIOD_CODE.NEXTVAL, '10년');
INSERT INTO DOC_RETENTION_PERIOD (PERIOD_CODE, PERIOD) VALUES (SEQ_DOC_RETENTION_PERIOD_CODE.NEXTVAL, '영구');

--결재타입------------------------------------------------------------------------
INSERT INTO APPROVAL_TYPE (APPR_TYPE_CODE, APPR_TYPE_NAME) VALUES (SEQ_APPROVAL_TYPE_CODE.NEXTVAL, '신청');
INSERT INTO APPROVAL_TYPE (APPR_TYPE_CODE, APPR_TYPE_NAME) VALUES (SEQ_APPROVAL_TYPE_CODE.NEXTVAL, '합의');
INSERT INTO APPROVAL_TYPE (APPR_TYPE_CODE, APPR_TYPE_NAME) VALUES (SEQ_APPROVAL_TYPE_CODE.NEXTVAL, '처리');
INSERT INTO APPROVAL_TYPE (APPR_TYPE_CODE, APPR_TYPE_NAME) VALUES (SEQ_APPROVAL_TYPE_CODE.NEXTVAL, '결재');

--문서양식------------------------------------------------------------------------
INSERT INTO DOC_FORM (FORM_CODE, FORM_NAME, FORM_INTRO) VALUES (SEQ_DOC_FORM_CODE.NEXTVAL, '지출결의서', '지출결의서 입니다');
INSERT INTO DOC_FORM (FORM_CODE, FORM_NAME, FORM_INTRO) VALUES (SEQ_DOC_FORM_CODE.NEXTVAL, '품의서', '품의서 입니다');
INSERT INTO DOC_FORM (FORM_CODE, FORM_NAME, FORM_INTRO) VALUES (SEQ_DOC_FORM_CODE.NEXTVAL, '업무연락', '업무연락 입니다');
INSERT INTO DOC_FORM (FORM_CODE, FORM_NAME, FORM_INTRO) VALUES (SEQ_DOC_FORM_CODE.NEXTVAL, '기업용공문', '기업용공문 입니다');

--문서양식상세 템플릿------------------------------------------------------------------------
INSERT INTO DOC_FORM_DETAIL_TEMPLATE (FORM_DETAIL_CODE, FORM_DETAIL_NAME, FORM_DETAIL_TYPE) VALUES (SEQ_DOC_FORM_DETAIL_TEMPLATE_CODE.NEXTVAL, '내용', 'textarea');
INSERT INTO DOC_FORM_DETAIL_TEMPLATE (FORM_DETAIL_CODE, FORM_DETAIL_NAME, FORM_DETAIL_TYPE) VALUES (SEQ_DOC_FORM_DETAIL_TEMPLATE_CODE.NEXTVAL, '회계월', 'month');
INSERT INTO DOC_FORM_DETAIL_TEMPLATE (FORM_DETAIL_CODE, FORM_DETAIL_NAME, FORM_DETAIL_TYPE) VALUES (SEQ_DOC_FORM_DETAIL_TEMPLATE_CODE.NEXTVAL, '적요', 'textarea');
INSERT INTO DOC_FORM_DETAIL_TEMPLATE (FORM_DETAIL_CODE, FORM_DETAIL_NAME, FORM_DETAIL_TYPE) VALUES (SEQ_DOC_FORM_DETAIL_TEMPLATE_CODE.NEXTVAL, '지출자', 'text');
INSERT INTO DOC_FORM_DETAIL_TEMPLATE (FORM_DETAIL_CODE, FORM_DETAIL_NAME, FORM_DETAIL_TYPE) VALUES (SEQ_DOC_FORM_DETAIL_TEMPLATE_CODE.NEXTVAL, '거래처', 'text');
INSERT INTO DOC_FORM_DETAIL_TEMPLATE (FORM_DETAIL_CODE, FORM_DETAIL_NAME, FORM_DETAIL_TYPE) VALUES (SEQ_DOC_FORM_DETAIL_TEMPLATE_CODE.NEXTVAL, '은행명', 'text');
INSERT INTO DOC_FORM_DETAIL_TEMPLATE (FORM_DETAIL_CODE, FORM_DETAIL_NAME, FORM_DETAIL_TYPE) VALUES (SEQ_DOC_FORM_DETAIL_TEMPLATE_CODE.NEXTVAL, '계좌번호', 'number');
INSERT INTO DOC_FORM_DETAIL_TEMPLATE (FORM_DETAIL_CODE, FORM_DETAIL_NAME, FORM_DETAIL_TYPE) VALUES (SEQ_DOC_FORM_DETAIL_TEMPLATE_CODE.NEXTVAL, '예금주', 'text');
INSERT INTO DOC_FORM_DETAIL_TEMPLATE (FORM_DETAIL_CODE, FORM_DETAIL_NAME, FORM_DETAIL_TYPE) VALUES (SEQ_DOC_FORM_DETAIL_TEMPLATE_CODE.NEXTVAL, '송금액', 'number');
INSERT INTO DOC_FORM_DETAIL_TEMPLATE (FORM_DETAIL_CODE, FORM_DETAIL_NAME, FORM_DETAIL_TYPE) VALUES (SEQ_DOC_FORM_DETAIL_TEMPLATE_CODE.NEXTVAL, '지출액', 'number');
INSERT INTO DOC_FORM_DETAIL_TEMPLATE (FORM_DETAIL_CODE, FORM_DETAIL_NAME, FORM_DETAIL_TYPE) VALUES (SEQ_DOC_FORM_DETAIL_TEMPLATE_CODE.NEXTVAL, '송금요청일', 'date');
INSERT INTO DOC_FORM_DETAIL_TEMPLATE (FORM_DETAIL_CODE, FORM_DETAIL_NAME, FORM_DETAIL_TYPE) VALUES (SEQ_DOC_FORM_DETAIL_TEMPLATE_CODE.NEXTVAL, '수신', 'text');
INSERT INTO DOC_FORM_DETAIL_TEMPLATE (FORM_DETAIL_CODE, FORM_DETAIL_NAME, FORM_DETAIL_TYPE) VALUES (SEQ_DOC_FORM_DETAIL_TEMPLATE_CODE.NEXTVAL, '참조', 'text');
INSERT INTO DOC_FORM_DETAIL_TEMPLATE (FORM_DETAIL_CODE, FORM_DETAIL_NAME, FORM_DETAIL_TYPE) VALUES (SEQ_DOC_FORM_DETAIL_TEMPLATE_CODE.NEXTVAL, '발신일', 'date');

--문서양식-항목 매핑------------------------------------------------------------------------
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (1, 2, 1);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (1, 3, 2);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (1, 4, 3);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (1, 5, 4);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (1, 6, 5);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (1, 7, 6);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (1, 10, 7);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (2, 1, 1);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (2, 5, 2);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (2, 6, 3);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (2, 7, 4);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (2, 8, 5);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (2, 9, 6);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (2, 11, 7);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (3, 1, 1);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (4, 12, 1);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (4, 13, 2);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (4, 14, 3);
INSERT INTO DOC_FORM_MAPPING (FORM_CODE, FORM_DETAIL_CODE, FORM_DETAIL_SEQ) VALUES (4, 1, 4);

--문서------------------------------------------------------------------------
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,1,40,'2022.11.11 현대리 여수 출장비 지급 요청',to_timestamp('22/11/11 03:46:35.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,40,'헉 잘못 작성한 문서',to_timestamp('22/11/11 03:50:03.000000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('22/11/11 03:50:08.000000000','RR/MM/DD HH24:MI:SSXFF'),'D',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,1,40,'임시저장한 문서 1',to_timestamp('22/11/11 03:51:11.000000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('22/11/11 03:51:21.000000000','RR/MM/DD HH24:MI:SSXFF'),'D',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,1,40,'임시저장한 문서 1',to_timestamp('22/11/11 03:51:43.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'T',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,40,'임시저장 ~~ ',to_timestamp('22/11/11 03:52:19.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'T',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,2,40,'품의서 .. 인데 임시저장',to_timestamp('22/11/11 03:53:06.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'T',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,40,'보존연한 초과 결재 문서 복구 건',to_timestamp('22/11/11 04:03:31.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,42,'업무 분담 건',to_timestamp('22/11/11 04:16:01.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 18:09:20.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,2,42,'복리후생비 지급 건',to_timestamp('22/11/11 04:18:00.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,1,42,'개인카드 사용 업무비용 지출 건',to_timestamp('22/11/11 04:20:55.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,42,'2022년 인사고과 평가의 건',to_timestamp('22/11/11 04:22:36.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,4,42,'기업용 공문 올립니다.',to_timestamp('22/11/11 04:35:16.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,42,'결재 완료 문서',to_timestamp('22/11/11 04:37:15.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 18:08:52.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,40,'연락 드립니다.',to_timestamp('22/11/11 15:39:04.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 15:45:04.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,39,'2022.11 부서별 비품 지급 건',to_timestamp('22/11/11 15:42:16.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,2,39,'2022 업무용 차량 점검의 건',to_timestamp('22/11/11 15:44:24.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,39,'인사팀 부서비용 지출 증빙 건',to_timestamp('22/11/11 15:48:59.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 16:38:07.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,2,40,'품의서 입니다',to_timestamp('22/11/11 16:35:40.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,1,40,'지출결의서 입니다',to_timestamp('22/11/11 16:36:19.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 17:01:36.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,40,'업무연락 입니다',to_timestamp('22/11/11 16:36:44.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 17:01:28.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,4,40,'기업용공문 입니다',to_timestamp('22/11/11 16:37:19.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 17:01:17.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,42,'2022.11 건물 미화 인력 보충 건',to_timestamp('22/11/11 16:39:28.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,42,'2023 임원급 품위유지비 예산 안',to_timestamp('22/11/11 16:40:32.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,2,42,'품의 드립니다',to_timestamp('22/11/11 16:42:42.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 18:09:56.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,42,'2022.10 사내 임직원 급여 정리 ',to_timestamp('22/11/11 16:52:25.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,1,42,'문서',to_timestamp('22/11/11 16:54:47.000000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('22/11/11 17:00:45.000000000','RR/MM/DD HH24:MI:SSXFF'),'N',to_timestamp('22/11/11 16:57:21.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,2,42,' 품의서',to_timestamp('22/11/11 16:55:32.000000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('22/11/11 17:00:33.000000000','RR/MM/DD HH24:MI:SSXFF'),'N',to_timestamp('22/11/11 16:57:14.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,42,'업무연락',to_timestamp('22/11/11 16:55:56.000000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('22/11/11 17:00:21.000000000','RR/MM/DD HH24:MI:SSXFF'),'N',to_timestamp('22/11/11 16:57:06.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,4,42,'기업용공문',to_timestamp('22/11/11 16:56:22.000000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('22/11/11 17:00:09.000000000','RR/MM/DD HH24:MI:SSXFF'),'N',to_timestamp('22/11/11 16:57:01.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,4,40,'2023 직장 필수 교육 공문서',to_timestamp('22/11/11 17:18:11.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,1,40,'2022.11.11 현대리 차량유지비 지급 요청',to_timestamp('22/11/11 17:19:25.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,1,40,'지출결의서 입니다',to_timestamp('22/11/11 18:08:43.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,40,'업무연락 입니다',to_timestamp('22/11/11 18:11:30.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 18:12:02.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,1,39,'2022.11.11 야근식대 지급 요청',to_timestamp('22/11/11 18:13:15.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,1,39,'2022.11.11  결과장 유류비 지급 요청',to_timestamp('22/11/11 18:13:59.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,1,39,'2022.11.11 결과장 교통비 지급 요청',to_timestamp('22/11/11 18:14:31.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,2,39,'2023 사내 봉사활동 계획서',to_timestamp('22/11/11 18:16:31.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',null);
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,1,42,'결재 완료 문서',to_timestamp('22/11/11 18:58:04.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 19:00:48.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,42,'결재 완료 문서',to_timestamp('22/11/11 18:58:36.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 19:00:52.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,4,42,'결재 완료 문서',to_timestamp('22/11/11 18:58:48.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 19:00:45.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,1,42,'결재 완료 문서',to_timestamp('22/11/11 18:59:08.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 19:00:38.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,1,42,'결재 완료 문서',to_timestamp('22/11/11 18:59:37.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 19:00:35.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,2,40,'결재 완료 문서',to_timestamp('22/11/11 19:01:38.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 19:02:54.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,3,40,'결재 완료 문서',to_timestamp('22/11/11 19:01:57.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 19:02:51.000000000','RR/MM/DD HH24:MI:SSXFF'));
INSERT INTO APPROVAL_DOC (DOC_CODE,PERIOD_CODE,DOC_FORM_CODE,EMP_CODE,DOC_TITLE,DOC_ENROLL_DATE,DOC_UPDATED,DOC_STATUS,DOC_APPR_DATE) 
VALUES (SEQ_APPROVAL_DOC_CODE.NEXTVAL,1,4,40,'결재 완료 문서',to_timestamp('22/11/11 19:02:13.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'N',to_timestamp('22/11/11 19:02:48.000000000','RR/MM/DD HH24:MI:SSXFF'));

-- 첨부파일------------------------------------------------------------------------
INSERT INTO APPROVAL_FILE (FILE_CODE,DOC_CODE,ORIGIN_NAME,UPLOAD_NAME) values (SEQ_APPROVAL_FILE_CODE.NEXTVAL,1,'현대리_출장_카드내역.xlsx','1668105995393_87252.xlsx');

--결재자 리스트------------------------------------------------------------------------
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (1,4,36,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (1,4,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (1,4,31,3,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (2,3,13,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (2,3,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (2,3,11,3,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (3,4,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (3,4,6,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (4,4,6,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (4,4,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (5,4,10,3,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (5,3,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (5,3,2,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (6,3,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (6,3,5,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (7,2,109,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (7,2,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (7,2,106,3,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (8,4,40,2,to_date('22/11/11','RR/MM/DD'),'C');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (8,4,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (9,4,40,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (9,4,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (9,4,39,3,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (9,4,1,5,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (9,4,36,4,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (10,4,39,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (10,4,1,5,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (10,4,36,4,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (10,4,38,3,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (10,4,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (11,2,40,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (11,2,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (11,2,39,3,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (11,4,1,4,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (12,4,2,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (12,4,1,3,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (12,4,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (13,4,40,2,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (13,4,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (14,2,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (14,2,39,2,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (15,3,39,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (15,3,42,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (16,3,39,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (16,3,40,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (17,3,42,2,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (17,3,39,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (18,4,39,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (19,4,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (19,4,39,2,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (20,4,39,2,to_date('22/11/11','RR/MM/DD'),'C');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (20,4,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (21,4,39,2,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (21,4,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (22,3,40,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (22,3,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (23,4,39,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (24,4,40,2,to_date('22/11/11','RR/MM/DD'),'C');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (24,4,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (25,4,40,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (25,4,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (26,3,40,2,to_date('22/11/11','RR/MM/DD'),'C');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (26,3,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (27,3,40,2,to_date('22/11/11','RR/MM/DD'),'C');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (27,3,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (28,3,40,2,to_date('22/11/11','RR/MM/DD'),'C');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (28,3,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (29,3,40,2,to_date('22/11/11','RR/MM/DD'),'C');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (29,3,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (30,4,38,3,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (30,4,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (30,4,39,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (30,4,37,4,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (30,4,36,5,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (31,4,39,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (31,4,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (32,3,39,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (32,3,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (33,3,39,2,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (33,3,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (34,3,40,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (34,3,39,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (35,3,40,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (35,3,39,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (36,3,40,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (36,3,39,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (37,3,40,2,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (37,3,39,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (37,4,37,3,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (37,4,36,4,null,'W');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (38,3,40,2,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (38,3,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (39,3,40,2,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (39,3,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (40,3,40,2,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (40,3,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (41,3,40,2,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (41,3,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (42,3,40,2,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (42,3,42,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (43,3,39,2,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (43,3,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (44,3,39,2,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (44,3,40,1,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (45,4,39,2,to_date('22/11/11','RR/MM/DD'),'A');
INSERT INTO APPROVAL_LIST (DOC_CODE,APPR_TYPE_CODE,APPR_EMP_CODE,APPR_SEQ,APPR_DATE,APPR_STATUS) 
VALUES (45,4,40,1,to_date('22/11/11','RR/MM/DD'),'A');

--참조인------------------------------------------------------------------------
INSERT INTO APPROVAL_REF (DOC_CODE,REF_EMP_CODE,CHECK_YN) VALUES (15,40,'N');
INSERT INTO APPROVAL_REF (DOC_CODE,REF_EMP_CODE,CHECK_YN) VALUES (16,1,'N');
INSERT INTO APPROVAL_REF (DOC_CODE,REF_EMP_CODE,CHECK_YN) VALUES (17,40,'N');
INSERT INTO APPROVAL_REF (DOC_CODE,REF_EMP_CODE,CHECK_YN) VALUES (10,40,'N');
INSERT INTO APPROVAL_REF (DOC_CODE,REF_EMP_CODE,CHECK_YN) VALUES (11,2,'N');
INSERT INTO APPROVAL_REF (DOC_CODE,REF_EMP_CODE,CHECK_YN) VALUES (19,40,'N');
INSERT INTO APPROVAL_REF (DOC_CODE,REF_EMP_CODE,CHECK_YN) VALUES (23,40,'N');
INSERT INTO APPROVAL_REF (DOC_CODE,REF_EMP_CODE,CHECK_YN) VALUES (28,40,'N');
INSERT INTO APPROVAL_REF (DOC_CODE,REF_EMP_CODE,CHECK_YN) VALUES (29,40,'N');
INSERT INTO APPROVAL_REF (DOC_CODE,REF_EMP_CODE,CHECK_YN) VALUES (37,38,'N');
INSERT INTO APPROVAL_REF (DOC_CODE,REF_EMP_CODE,CHECK_YN) VALUES (37,41,'N');
INSERT INTO APPROVAL_REF (DOC_CODE,REF_EMP_CODE,CHECK_YN) VALUES (37,42,'N');
INSERT INTO APPROVAL_REF (DOC_CODE,REF_EMP_CODE,CHECK_YN) VALUES (39,40,'N');
INSERT INTO APPROVAL_REF (DOC_CODE,REF_EMP_CODE,CHECK_YN) VALUES (41,40,'N');

--문서 작성 데이터------------------------------------------------------------------------
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (1,2,'2022-11');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (1,3,'221111 현대리 출장비(여수) 출장비 지급');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (1,4,'현대리');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (1,5,'여수');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (1,6,'농협');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (1,7,'123456789123');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (1,10,'120000');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (2,1,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (3,2,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (3,3,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (3,4,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (3,5,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (3,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (3,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (3,10,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (4,2,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (4,3,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (4,4,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (4,5,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (4,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (4,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (4,10,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (5,1,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (6,1,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (6,5,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (6,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (6,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (6,8,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (6,9,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (6,11,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (7,1,'안녕하세요 인사팀 현대리 입니다.

보존 연한 초과 문서 복구의 건으로 업무연락 드립니다.
');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (8,1,'업무 많이 나눠 주세요');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (9,1,'임직원이 신청한 10월 복리후생비  11.17 지급 예정');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (9,5,'-');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (9,6,'우리');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (9,7,'111111111111');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (9,8,'임직원');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (9,9,'2700000');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (9,11,'2022-11-17');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (10,2,'2022-11');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (10,3,'221111 개인카드 사용 업무비용 지출 건');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (10,4,'박사원');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (10,5,'봉된장');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (10,6,'신한');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (10,7,'111122223456');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (10,10,'50000');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (11,1,'인사고과 평가 어떻게 하면 좋을까요 ?');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (12,12,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (12,13,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (12,14,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (12,1,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (13,1,'결재 완료 문서');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (14,1,'연락 드렸습니다.');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (15,1,'현대리는 확인하세요 ~~');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (16,1,'12월 업무용 차량 (소나타) 점검 예정입니다');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (16,5,'점검소');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (16,6,'은행');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (16,7,'12341234123412');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (16,8,'점검소');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (16,9,'1000000');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (16,11,'2022-11-14');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (17,1,'업무처리 - 박사원
업무책임 - 현대리');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (18,1,'결재 완료 더미데이터');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (18,5,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (18,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (18,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (18,8,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (18,9,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (18,11,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (19,2,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (19,3,'지출결의서 더미데이터');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (19,4,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (19,5,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (19,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (19,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (19,10,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (20,1,'업무연락 더미데이터');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (21,12,'현대리');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (21,13,'현대리');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (21,14,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (21,1,'기업용 공문 더미데이터');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (22,1,'건물미화 인력 보충 건의가 들어오고 있습니다.
확인 부탁드립니다.');
Insert into DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) values (23,1,'2023 임원급 품위유지비 예산 
확인 부탁드립니다');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (24,1,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (24,5,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (24,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (24,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (24,8,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (24,9,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (24,11,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (25,1,'2022.10 사내 임직원 급여 정리 하여 보내드립니다.');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (26,2,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (26,3,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (26,4,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (26,5,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (26,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (26,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (26,10,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (27,1,'결재 반려 품의서');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (27,5,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (27,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (27,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (27,8,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (27,9,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (27,11,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (28,1,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (29,12,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (29,13,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (29,14,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (29,1,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (30,12,'인사팀');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (30,13,'전직원');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (30,14,'2022-11-11');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (30,1,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (31,2,'2022-11');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (31,3,'2022.11.11 현대리 업무관련 차량유지비용');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (31,4,'현대리');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (31,5,'오케이주유소');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (31,6,'농협');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (31,7,'123412341234');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (31,10,'40000');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (32,2,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (32,3,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (32,4,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (32,5,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (32,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (32,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (32,10,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (33,1,'업무연락 입니다');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (34,2,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (34,3,'2022.11.11 야근식대 지급 요청');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (34,4,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (34,5,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (34,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (34,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (34,10,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (35,2,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (35,3,'2022.11.11 결과장 유류비 지급 요청');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (35,4,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (35,5,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (35,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (35,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (35,10,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (36,2,'2022-11');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (36,3,'2022.11.11 결과장 교통비 지급 요청');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (36,4,'결과장');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (36,5,'결과장');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (36,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (36,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (36,10,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (37,1,'2023 사내 봉사활동 계획서 확인 요망');
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (37,5,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (37,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (37,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (37,8,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (37,9,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (37,11,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (38,2,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (38,3,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (38,4,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (38,5,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (38,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (38,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (38,10,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (39,1,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (40,12,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (40,13,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (40,14,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (40,1,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (41,2,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (41,3,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (41,4,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (41,5,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (41,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (41,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (41,10,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (42,2,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (42,3,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (42,4,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (42,5,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (42,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (42,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (42,10,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (43,1,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (43,5,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (43,6,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (43,7,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (43,8,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (43,9,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (43,11,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (44,1,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (45,12,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (45,13,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (45,14,null);
INSERT INTO DOC_DATA (DOC_CODE,FORM_DETAIL_CODE,DOC_CONTENT) VALUES (45,1,null);

--의견 남기기------------------------------------------------------------------------
INSERT INTO DOC_COMMENT (COMMENT_CODE,DOC_CODE,WRITER_CODE,COM_ENROLL_DATE,COM_UPDATED,COM_CONTENT,COM_STATUS) 
VALUES (SEQ_DOC_COMMENT_CODE.NEXTVAL,29,40,to_timestamp('22/11/11 16:57:01.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'반려합니다','C');
INSERT INTO DOC_COMMENT (COMMENT_CODE,DOC_CODE,WRITER_CODE,COM_ENROLL_DATE,COM_UPDATED,COM_CONTENT,COM_STATUS) 
VALUES (SEQ_DOC_COMMENT_CODE.NEXTVAL,28,40,to_timestamp('22/11/11 16:57:06.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'반려합니다','C');
INSERT INTO DOC_COMMENT (COMMENT_CODE,DOC_CODE,WRITER_CODE,COM_ENROLL_DATE,COM_UPDATED,COM_CONTENT,COM_STATUS) 
VALUES (SEQ_DOC_COMMENT_CODE.NEXTVAL,27,40,to_timestamp('22/11/11 16:57:14.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'반려합니다','C');
INSERT INTO DOC_COMMENT (COMMENT_CODE,DOC_CODE,WRITER_CODE,COM_ENROLL_DATE,COM_UPDATED,COM_CONTENT,COM_STATUS) 
VALUES (SEQ_DOC_COMMENT_CODE.NEXTVAL,26,40,to_timestamp('22/11/11 16:57:21.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'반려합니다','C');
INSERT INTO DOC_COMMENT (COMMENT_CODE,DOC_CODE,WRITER_CODE,COM_ENROLL_DATE,COM_UPDATED,COM_CONTENT,COM_STATUS) 
VALUES (SEQ_DOC_COMMENT_CODE.NEXTVAL,20,39,to_timestamp('22/11/11 17:01:28.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'반려합니다','C');
INSERT INTO DOC_COMMENT (COMMENT_CODE,DOC_CODE,WRITER_CODE,COM_ENROLL_DATE,COM_UPDATED,COM_CONTENT,COM_STATUS) 
VALUES (SEQ_DOC_COMMENT_CODE.NEXTVAL,8,40,to_timestamp('22/11/11 18:09:20.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'반려합니다','C');
INSERT INTO DOC_COMMENT (COMMENT_CODE,DOC_CODE,WRITER_CODE,COM_ENROLL_DATE,COM_UPDATED,COM_CONTENT,COM_STATUS) 
VALUES (SEQ_DOC_COMMENT_CODE.NEXTVAL,24,40,to_timestamp('22/11/11 18:09:56.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'반려합니다','C');




--COMMUTE 더미데이터

INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(883, 75, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(885, 11, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(886, 21, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(887, 22, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(888, 25, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(889, 28, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(890, 32, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(891, 42, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(892, 52, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(893, 62, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(894, 72, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(895, 82, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(896, 92, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(897, 102, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(898, 33, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(899, 35, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(901, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/02 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(902, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/03 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(903, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/04 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(904, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/05 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(905, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/06 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(906, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/07 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(907, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/08 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(908, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/09 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(909, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/10 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(910, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/11 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(911, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/12 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(912, 2, '19:00:00', '7:00:00 PM', '19:00:01', '7:00:01 PM', '22/10/13 17:34:26.000000000',  '결근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(913, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/14 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(914, 2, '9:00:00', '9:00:00 AM', '17:33:33', '5:33:33 PM', '22/10/15 17:34:26.000000000',  '조기퇴근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(915, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/16 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(916, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/17 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(917, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/18 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(918, 2, '9:00:00', '9:00:00 AM', '17:33:33', '5:33:33 PM', '22/10/19 17:34:26.000000000',  '조기퇴근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(919, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/20 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(920, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/21 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(921, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/22 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(922, 2, '9:12:00', '9:12:00 AM', '18:33:33', '6:33:33 PM', '22/10/23 17:34:26.000000000',  '지각');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(923, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/24 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(924, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/25 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(925, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/26 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(926, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/27 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(927, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/28 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(928, 2, '9:12:00', '9:12:00 AM', '18:33:33', '6:33:33 PM', '22/10/29 17:34:26.000000000',  '지각');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(929, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/30 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(930, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/10/31 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(932, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/01 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(933, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/02 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(934, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/03 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(935, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/04 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(936, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/05 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(937, 2, '19:00:00', '7:00:00 PM', '19:00:01', '7:00:01 PM', '22/11/06 17:34:26.000000000',  '결근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(938, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/07 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(939, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/08 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(940, 2, '9:00:00', '9:00:00 AM', '17:33:33', '5:33:33 PM', '22/11/09 17:34:26.000000000',  '조기퇴근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(941, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/10 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(942, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/11 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(943, 2, '9:00:00', '9:00:00 AM', '18:33:33', '6:33:33 PM', '22/11/12 17:34:26.000000000',  '정상출근');
INSERT INTO COMMUTE (COM_CODE, ECODE, START_TIME, START_TIME_FORMAT, END_TIME, END_TIME_FORMAT, ENROLL_DATE, COM_STATUS) 
VALUES(944, 2, '9:12:00', '9:12:00 AM', '18:33:33', '6:33:33 PM', '22/11/13 17:34:26.000000000',  '지각');

COMMIT;

-- OVERWORK 더미데이터
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 5, 5, '2022-11-09', 3, '본사 미팅', '비고', 'W');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 75, 5, '2022-11-11', 2, '연구 개발 회의', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 43, 5, '2022-11-12', 3, '행사 정리', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 6, 5, '2022-11-13', 2, '보고서 정리', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 55, 5, '2022-11-09', 3, '파견 근무', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 60, 5, '2022-11-11', 2, '본사 출장', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 77, 5, '2022-11-12', 3, '연구 수정', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 36, 5, '2022-11-13', 2, '보고서 정리', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 27, 5, '2022-11-09', 3, '파견 근무', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 43, 5, '2022-11-11', 2, '타 팀과 회의 있습니다.', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 19, 5, '2022-11-12', 3, '개발팀 회의', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 99, 5, '2022-11-13', 2, '연구 수정', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-10-12', 3, '본사 출장', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-10-12', 3, '교육', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-10-12', 3, '지방 출장있습니다.', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-10-12', 3, '보고서 정리', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-10-12', 3, '보고서 정리', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-10-12', 3, '보고서 정리', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-10-12', 3, '보고서 정리', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-10-14', 2, '개발팀 회의', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-10-15', 1, '연구 수정', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-10-16', 2, '파견 근무', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-10-18', 3, '본사 출장', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-10-19', 2, '교육', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-10-21', 3, '개발팀 회의', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-10-22', 1, '지방 출장', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-10-25', 2, '기획본부팀 회의', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-10-27', 3, '테스트 코드 작성', '비고', 'C');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-11-01', 4, '본사 행사', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-11-03', 2, '출장', '비고', 'C');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-11-04', 1, '연구 개발 회의', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-11-05', 2, '보고서 정리', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-11-07', 2, '파견 근무', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-11-08', 1, '지방 출장', '비고', 'C');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-11-09', 3, '본사 미팅', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-11-11', 2, '본사 출장', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-11-12', 3, '행사 정리', '비고', 'A');
INSERT INTO OVERWORK (OVER_CODE, ECODE, DEPT_CODE, OVER_DATE, OVER_TIME, OVER_NAME, OVER_REASON, OVER_APPROVAL)
VALUES (SEQ_OVER_CODE_NO.NEXTVAL, 2, 5, '2022-11-13', 2, '보고서 정리', '비고', 'A');

COMMIT;


--DAYOFF 더미데이터 
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 5, 2, '2022-11-01','2022-11-02', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 3, 1, '2022-10-01','2022-10-05', 2, '부산여행', 'W');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 4, 2, '2022-10-01','2022-10-05', 2, '속초 여행 갑니다', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 5, 3, '2022-11-06','2022-11-07', 2, '해외 여행', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 6, 4, '2022-10-01','2022-10-05', 2, '강원도 홍천', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 7, 2, '2022-11-11','2022-11-11', 1, '예비군 훈련', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 8, 6, '2022-10-01','2022-10-05', 2, '동아리 워크샵', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 9, 7, '2022-10-01','2022-10-05', 2, '경주', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 10, 2, '2022-11-13','2022-11-14', 2, '부산여행', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 11, 2, '2022-11-09','2022-11-10', 2, '여수여행', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 12, 5, '2022-10-01','2022-10-05', 2, '광인리', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 13, 4, '2022-10-01','2022-10-05', 2, '속초 여행 갑니다', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 14, 11, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 15, 3, '2022-10-01','2022-10-05', 2, '부산여행', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 16, 7, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 17, 9, '2022-10-01','2022-10-05', 2, '속초 여행 갑니다', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 18, 11, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 24, 15, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 23, 1, '2022-10-01','2022-10-05', 2, '부산여행', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 34, 6, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 56, 5, '2022-11-07','2022-11-08', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 67, 5, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 78, 3, '2022-10-01','2022-10-05', 2, '속초 여행 갑니다', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 89, 9, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 90, 8, '2022-10-01','2022-10-05', 2, '광인리', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 12, 7, '2022-10-01','2022-10-05', 2, '부산여행', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 43, 6, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 54, 4, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 76, 5, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 33, 3, '2022-10-01','2022-10-05', 2, '속초 여행 갑니다', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 88, 2, '2022-10-01','2022-10-05', 2, '부산여행', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 55, 3, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 77, 4, '2022-10-01','2022-10-05', 2, '광인리', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 99, 8, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 39, 10, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 49, 5, '2022-10-01','2022-10-05', 2, '부산여행', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 19, 4, '2022-11-01','2022-11-02', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 72, 10, '2022-11-07','2022-11-08', 2, '속초 여행 갑니다', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 62, 11, '2022-10-01','2022-10-05', 2, '광인리', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 32, 2, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 22, 5, '2022-10-01','2022-10-05', 2, '광인리', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 97, 1, '2022-10-01','2022-10-05', 2, '부산여행', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 42, 8, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 76, 6, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 30, 3, '2022-10-01','2022-10-05', 2, '광인리', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 80, 4, '2022-10-01','2022-10-05', 2, '속초 여행 갑니다', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 81, 14, '2022-11-09','2022-11-11', 3, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 84, 15, '2022-11-12','2022-11-12', 1, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 85, 16, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 86, 17, '2022-10-01','2022-10-05', 2, '속초 여행 갑니다', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 91, 13, '2022-10-01','2022-10-05', 2, '부산여행', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 88, 11, '2022-10-01','2022-10-05', 2, '광인리', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 85, 12, '2022-10-01','2022-10-05', 2, '해오름', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 84, 14, '2022-10-01','2022-10-05', 2, '속초 여행 갑니다', 'A');
INSERT INTO DAYOFF (OFF_CODE, ECODE, DEPT_CODE, OFF_START_DATE, OFF_END_DATE, OFF_DAYS, OFF_REASON, OFF_APPROVAL)
VALUES (SEQ_DAYOFF_CODE_NO.NEXTVAL, 61, 5, '2022-10-01','2022-10-05', 2, '광인리', 'A');


COMMIT;


--DAYOFF_COUNT 더미데이터
INSERT INTO DAYOFF_COUNT (COUNT_CODE, RANK_CODE, OFF_ALL)
VALUES(SEQ_DAYOFF_COUNT_CODE_NO.NEXTVAL, 1, 25);

INSERT INTO DAYOFF_COUNT (COUNT_CODE, RANK_CODE, OFF_ALL)
VALUES(SEQ_DAYOFF_COUNT_CODE_NO.NEXTVAL, 2, 23);

INSERT INTO DAYOFF_COUNT (COUNT_CODE, RANK_CODE, OFF_ALL)
VALUES(SEQ_DAYOFF_COUNT_CODE_NO.NEXTVAL, 3, 20);

INSERT INTO DAYOFF_COUNT (COUNT_CODE, RANK_CODE, OFF_ALL)
VALUES(SEQ_DAYOFF_COUNT_CODE_NO.NEXTVAL, 4, 19);

INSERT INTO DAYOFF_COUNT (COUNT_CODE, RANK_CODE, OFF_ALL)
VALUES(SEQ_DAYOFF_COUNT_CODE_NO.NEXTVAL, 5, 18);

INSERT INTO DAYOFF_COUNT (COUNT_CODE, RANK_CODE, OFF_ALL)
VALUES(SEQ_DAYOFF_COUNT_CODE_NO.NEXTVAL, 6, 16);

INSERT INTO DAYOFF_COUNT (COUNT_CODE, RANK_CODE, OFF_ALL)
VALUES(SEQ_DAYOFF_COUNT_CODE_NO.NEXTVAL, 7, 15);

INSERT INTO DAYOFF_COUNT (COUNT_CODE, RANK_CODE, OFF_ALL)
VALUES(SEQ_DAYOFF_COUNT_CODE_NO.NEXTVAL, 8, 10);

INSERT INTO DAYOFF_COUNT (COUNT_CODE, RANK_CODE, OFF_ALL)
VALUES(SEQ_DAYOFF_COUNT_CODE_NO.NEXTVAL, 9, 5);

COMMIT;




-----------------------
--더미 데이터
-----------------------

--메인 홈페이지 더미
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,1 ,'프로젝트 기획' ,'WORK' ,'2022/10/17' ,'2022/10/24' ,'TRUE ' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,1 ,'프론트엔드구현' ,'WORK' ,'2022/10/25' ,'2022/10/31 11:00:00' ,'TRUE ' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,1 ,'백엔드구현' ,'WORK' ,'2022/11/01' ,'2022/11/14' ,'TRUE ' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,1 ,'프로젝트 발표' ,'WORK' ,'2022/11/15' ,'2022/11/15' ,'TRUE ' ,'N' ) ;

INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,1 ,'주간보고' ,'WORK' ,'2022/11/14 10:30:00' ,'2022/11/14 11:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,1 ,'간부회의' ,'WORK' ,'2022/11/15 13:30:00' ,'2022/11/15 15:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,1 ,'기획회의' ,'WORK' ,'2022/11/17 15:30:00' ,'2022/11/17 17:00:00' ,'FALSE' ,'N' ) ;

INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,1 ,'샘송 미팅' ,'HOME' ,'2022/11/11 15:30:00' ,'2022/11/11 17:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,1 ,'규글 미팅' ,'HOME' ,'2022/11/15 15:30:00' ,'2022/11/15 17:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,1 ,'넷플릭뜨 미팅' ,'HOME' ,'2022/11/16 15:30:00' ,'2022/11/16 17:00:00' ,'FALSE' ,'N' ) ;

INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,1 ,'사원들 빼빼로 사주기' ,'HOME' ,'2022/11/11 12:30:00' ,'2022/11/11 13:00:00' ,'TRUE ' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,1 ,'결재 진행' ,'HOME' ,'2022/11/11 12:30:00' ,'2022/11/11 13:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,1 ,'예약물품 체크하기' ,'HOME' ,'2022/11/11 12:30:00' ,'2022/11/11 13:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,1 ,'공지사항 확인' ,'HOME' ,'2022/11/11 12:30:00' ,'2022/11/11 13:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,1 ,'이메일 확인' ,'HOME' ,'2022/11/11 12:30:00' ,'2022/11/11 13:00:00' ,'TRUE ' ,'N' ) ;

--EMPCODE 98번 시연용 일정추가 송과장 98번 user28 / 1234
--부서일정
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'프로젝트 기획' ,'WORK' ,'2022/10/17' ,'2022/10/24' ,'TRUE ' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'프론트엔드구현' ,'WORK' ,'2022/10/25' ,'2022/10/31 11:00:00' ,'TRUE ' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'백엔드구현' ,'WORK' ,'2022/11/01' ,'2022/11/14' ,'TRUE ' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'프로젝트 발표' ,'WORK' ,'2022/11/15' ,'2022/11/15' ,'TRUE ' ,'N' ) ;

INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'주간보고' ,'WORK' ,'2022/11/14 10:30:00' ,'2022/11/14 11:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'간부회의' ,'WORK' ,'2022/11/15 13:30:00' ,'2022/11/15 15:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'기획회의' ,'WORK' ,'2022/11/17 15:30:00' ,'2022/11/17 17:00:00' ,'FALSE' ,'N' ) ;

INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'프로젝트 기획' ,'WORK' ,'2022/11/17' ,'2022/11/24' ,'TRUE ' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'프론트엔드구현' ,'WORK' ,'2022/11/25' ,'2022/11/30 11:00:00' ,'TRUE ' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'백엔드구현' ,'WORK' ,'2022/12/01' ,'2022/12/14' ,'TRUE ' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'프로젝트 발표' ,'WORK' ,'2022/12/15' ,'2022/12/15' ,'TRUE ' ,'N' ) ;


INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'신제품 홍보 방향 및 진행상황' ,'WORK' ,'2022/11/1 11:30:00' ,'2022/11/4 17:00:00' ,'TRUE ' ,'N' ) ;

--개인일정


INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'샘송 미팅' ,'HOME' ,'2022/11/11 15:30:00' ,'2022/11/11 17:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'규글 미팅' ,'HOME' ,'2022/11/15 15:30:00' ,'2022/11/15 17:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'넷플릭뜨 미팅' ,'HOME' ,'2022/11/16 15:30:00' ,'2022/11/16 17:00:00' ,'FALSE' ,'N' ) ;

INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'사원들 빼빼로 사주기' ,'HOME' ,'2022/11/11 12:30:00' ,'2022/11/11 13:00:00' ,'TRUE ' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'결재 진행' ,'HOME' ,'2022/11/11 12:30:00' ,'2022/11/11 13:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'예약물품 체크하기' ,'HOME' ,'2022/11/11 12:30:00' ,'2022/11/11 13:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'공지사항 확인' ,'HOME' ,'2022/11/11 12:30:00' ,'2022/11/11 13:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'이메일 확인' ,'HOME' ,'2022/11/11 12:30:00' ,'2022/11/11 13:00:00' ,'TRUE ' ,'N' ) ;

INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,98 ,'회식' ,'HOME' ,'2022/11/15 18:30:00' ,'2022/11/11 19:00:00' ,'TRUE ' ,'N' ) ;

--더미 데이터
--EMPCODE 101번 시연용 일정추가 개발팀 조사원 user31 / 1234
--같은 부서번호라서 추가X
--개인일정
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,101 ,'백엔드 MVC 구현하기' ,'HOME' ,'2022/11/01 12:30:00' ,'2022/11/03 15:00:00' ,'TRUE ' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,101 ,'백엔드 마무리 작업' ,'HOME' ,'2022/11/10 12:30:00' ,'2022/11/12 15:00:00' ,'TRUE ' ,'N' ) ;

INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,101 ,'송과장님 샘송 미팅 말씀드리기' ,'HOME' ,'2022/11/11 12:30:00' ,'2022/11/11 15:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,101 ,'송과장님 규글 미팅 말씀드리기' ,'HOME' ,'2022/11/15 13:30:00' ,'2022/11/15 15:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,101 ,'송과장님 넷플릭뜨 미팅 말씀드리기' ,'HOME' ,'2022/11/16 15:00:00' ,'2022/11/16 16:30:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,101 ,'아침 회의 준비' ,'HOME' ,'2022/11/14 09:30:00' ,'2022/11/14 10:00:00' ,'TRUE ' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,101 ,'선임 빼빼로 사드리기' ,'HOME' ,'2022/11/11 12:30:00' ,'2022/11/11 13:00:00' ,'TRUE ' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,101 ,'예약물품 올리기' ,'HOME' ,'2022/11/11 12:30:00' ,'2022/11/11 13:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,101 ,'공지사항 확인하고 말씀드리기' ,'HOME' ,'2022/11/11 12:30:00' ,'2022/11/11 13:00:00' ,'FALSE' ,'N' ) ;
INSERT INTO CALENDAR ( CAL_CODE , EMP_CODE , CAL_TITLE , CAL_TYPE, CAL_START , CAL_END , CAL_ALLDAY , CAL_HOLIDAY ) VALUES ( SEQ_CAL_CODE.NEXTVAL ,101 ,'이메일 확인 ' ,'HOME' ,'2022/11/11 12:30:00' ,'2022/11/11 13:00:00' ,'TRUE ' ,'N' ) ;
COMMIT;

--더미 데이터

--EMPCODE 98번 시연용 파일매니저 파일추가 송과장 98번 user28 / 1234
INSERT INTO FILECLOUD ( FILE_CODE , EMP_CODE , FILE_TITLE , FILE_CONTENT , FILE_NAME , FILE_URL , FILE_ENROLLDATE , FILE_TYPE , FILE_SIZE )  VALUES ( SEQ_FILE_CODE.NEXTVAL , 98 , 'UI 구현 이미지 사진' , 'UI구현 했을때 캡처한 사진입니다.' , '1666872785465_17777.png' , 'D:\devFinal\ws\EveryWare\src\main\webapp\resources\upload\filemanager\' , SYSDATE , 'png' , '36KB' );
INSERT INTO FILECLOUD ( FILE_CODE , EMP_CODE , FILE_TITLE , FILE_CONTENT , FILE_NAME , FILE_URL , FILE_ENROLLDATE , FILE_TYPE , FILE_SIZE )  VALUES ( SEQ_FILE_CODE.NEXTVAL , 98 , '제가 만든 쿠키입니다' , '널 위해 구웠지' , '1666874923549_85432.jpg' , 'D:\devFinal\ws\EveryWare\src\main\webapp\resources\upload\filemanager\' , SYSDATE , 'jpg' , '8KB' );
INSERT INTO FILECLOUD ( FILE_CODE , EMP_CODE , FILE_TITLE , FILE_CONTENT , FILE_NAME , FILE_URL , FILE_ENROLLDATE , FILE_TYPE , FILE_SIZE )  VALUES ( SEQ_FILE_CODE.NEXTVAL , 98 , '인물 아이콘 사진' , '인물 아이콘 사진입니다.' , '1666873632009_57231.png' , 'D:\devFinal\ws\EveryWare\src\main\webapp\resources\upload\filemanager\' , SYSDATE , 'png' , '16KB' );
INSERT INTO FILECLOUD ( FILE_CODE , EMP_CODE , FILE_TITLE , FILE_CONTENT , FILE_NAME , FILE_URL , FILE_ENROLLDATE , FILE_TYPE , FILE_SIZE )  VALUES ( SEQ_FILE_CODE.NEXTVAL , 98 , '에브리웨어 로고 사진입니다!' , '로그 사진 첨부했습니다. ' , '1667372036602_56190.png' , 'D:\devFinal\ws\EveryWare\src\main\webapp\resources\upload\filemanager\' , SYSDATE , 'png' , '15KB' );

INSERT INTO FILECLOUD ( FILE_CODE , EMP_CODE , FILE_TITLE , FILE_CONTENT , FILE_NAME , FILE_URL , FILE_ENROLLDATE , FILE_TYPE , FILE_SIZE, FILE_BOOKMARK )  VALUES ( SEQ_FILE_CODE.NEXTVAL , 98 , '코로나 방지 관련 이미지 파일' , '코로나 방지 관련 이미지 파일입니다. ' , '1668153574964_19142.zip' , 'D:\devFinal\ws\EveryWare\src\main\webapp\resources\upload\filemanager\' , SYSDATE , 'zip' , '37KB', '1' );
INSERT INTO FILECLOUD ( FILE_CODE , EMP_CODE , FILE_TITLE , FILE_CONTENT , FILE_NAME , FILE_URL , FILE_ENROLLDATE , FILE_TYPE , FILE_SIZE )  VALUES ( SEQ_FILE_CODE.NEXTVAL , 98 , '작년 사진' , '추억의 사진' , '1668153408093_71902.jpg' , 'D:\devFinal\ws\EveryWare\src\main\webapp\resources\upload\filemanager\' , SYSDATE , 'png' , '1MB' );

--EMPCODE 101번 시연용 파일매니저 파일추가 개발팀 조사원 user31 / 1234


--NOTICE

INSERT INTO NOTICE (NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT ,NOTICE_DATE ,NOTICE_UPDATE)
VALUES (SEQ_NOTICE_CODE.NEXTVAL, '공지사항입니다1', '안녕하세요 EVERYWARE 관리자입니다', SYSDATE, SYSDATE);

INSERT INTO NOTICE_FILE (NOTICE_FILE_CODE, NOTICE_CODE, NOTICE_ORIGIN_NAME, NOTICE_CHANGE_NAME, NOTICE_FILE_ROOT)
		VALUES
		(
		 SEQ_NOTICE_FILE_CODE.NEXTVAL
		 ,SEQ_NOTICE_CODE.CURRVAL
		 ,'guest.png'
		 ,'1668140356406_77200  '
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\notice\'
		);


INSERT INTO NOTICE (NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT ,NOTICE_DATE ,NOTICE_UPDATE)
VALUES (SEQ_NOTICE_CODE.NEXTVAL, '공지사항입니다2', '안녕하세요 EVERYWARE 관리자입니다2', SYSDATE, SYSDATE);

INSERT INTO NOTICE_FILE (NOTICE_FILE_CODE, NOTICE_CODE, NOTICE_ORIGIN_NAME, NOTICE_CHANGE_NAME, NOTICE_FILE_ROOT)
		VALUES
		(
		 SEQ_NOTICE_FILE_CODE.NEXTVAL
		 ,SEQ_NOTICE_CODE.CURRVAL
		 ,'1.jpg'
		 ,'1668139644688_67624 '
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\notice\'
		);

INSERT INTO NOTICE (NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT ,NOTICE_DATE ,NOTICE_UPDATE)
VALUES (SEQ_NOTICE_CODE.NEXTVAL, '공지사항입니다3', '안녕하세요 EVERYWARE 관리자입니다3', SYSDATE, SYSDATE);

 INSERT INTO NOTICE_FILE (NOTICE_FILE_CODE, NOTICE_CODE, NOTICE_ORIGIN_NAME, NOTICE_CHANGE_NAME, NOTICE_FILE_ROOT)
		VALUES
		(
		 SEQ_NOTICE_FILE_CODE.NEXTVAL
		 ,SEQ_NOTICE_CODE.CURRVAL
		 ,'2.jpg'
		 ,'1668139572971_21010 '
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\notice\'
		);
INSERT INTO NOTICE (NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT ,NOTICE_DATE ,NOTICE_UPDATE)
VALUES (SEQ_NOTICE_CODE.NEXTVAL, '공지사항입니다4', '안녕하세요 EVERYWARE 관리자입니다', SYSDATE, SYSDATE);
 
 INSERT INTO NOTICE_FILE (NOTICE_FILE_CODE, NOTICE_CODE, NOTICE_ORIGIN_NAME, NOTICE_CHANGE_NAME, NOTICE_FILE_ROOT)
		VALUES
		(
		 SEQ_NOTICE_FILE_CODE.NEXTVAL
		 ,SEQ_NOTICE_CODE.CURRVAL
		 ,'4.jpg'
		 ,'1668139111683_27214'
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\notice\'
		);


INSERT INTO NOTICE (NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT ,NOTICE_DATE ,NOTICE_UPDATE)
VALUES (SEQ_NOTICE_CODE.NEXTVAL, '공지사항입니다5', '안녕하세요 EVERYWARE 관리자입니다', SYSDATE, SYSDATE);

INSERT INTO NOTICE_FILE (NOTICE_FILE_CODE, NOTICE_CODE, NOTICE_ORIGIN_NAME, NOTICE_CHANGE_NAME, NOTICE_FILE_ROOT)
		VALUES
		(
		 SEQ_NOTICE_FILE_CODE.NEXTVAL
		 ,SEQ_NOTICE_CODE.CURRVAL
		 ,'guest.png'
		 ,'1668140356406_77200  '
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\notice\'
		);

INSERT INTO NOTICE (NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT ,NOTICE_DATE ,NOTICE_UPDATE)
VALUES (SEQ_NOTICE_CODE.NEXTVAL, '공지사항입니다6', '안녕하세요 EVERYWARE 관리자입니다', SYSDATE, SYSDATE);

INSERT INTO NOTICE_FILE (NOTICE_FILE_CODE, NOTICE_CODE, NOTICE_ORIGIN_NAME, NOTICE_CHANGE_NAME, NOTICE_FILE_ROOT)
		VALUES
		(
		 SEQ_NOTICE_FILE_CODE.NEXTVAL
		 ,SEQ_NOTICE_CODE.CURRVAL
		 ,'1.jpg'
		 ,'1668139644688_67624 '
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\notice\'
		);

INSERT INTO NOTICE (NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT ,NOTICE_DATE ,NOTICE_UPDATE)
VALUES (SEQ_NOTICE_CODE.NEXTVAL, '공지사항입니다7', '안녕하세요 EVERYWARE 관리자입니다', SYSDATE, SYSDATE);


 INSERT INTO NOTICE_FILE (NOTICE_FILE_CODE, NOTICE_CODE, NOTICE_ORIGIN_NAME, NOTICE_CHANGE_NAME, NOTICE_FILE_ROOT)
		VALUES
		(
		 SEQ_NOTICE_FILE_CODE.NEXTVAL
		 ,SEQ_NOTICE_CODE.CURRVAL
		 ,'2.jpg'
		 ,'1668139572971_21010 '
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\notice\'
		);

INSERT INTO NOTICE (NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT ,NOTICE_DATE ,NOTICE_UPDATE)
VALUES (SEQ_NOTICE_CODE.NEXTVAL, '공지사항입니다8', '안녕하세요 EVERYWARE 관리자입니다', SYSDATE, SYSDATE);

 INSERT INTO NOTICE_FILE (NOTICE_FILE_CODE, NOTICE_CODE, NOTICE_ORIGIN_NAME, NOTICE_CHANGE_NAME, NOTICE_FILE_ROOT)
		VALUES
		(
		 SEQ_NOTICE_FILE_CODE.NEXTVAL
		 ,SEQ_NOTICE_CODE.CURRVAL
		 ,'4.jpg'
		 ,'1668139111683_27214'
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\notice\'
		);

INSERT INTO NOTICE (NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT ,NOTICE_DATE ,NOTICE_UPDATE)
VALUES (SEQ_NOTICE_CODE.NEXTVAL, '공지사항입니다9', '안녕하세요 EVERYWARE 관리자입니다', SYSDATE, SYSDATE);
INSERT INTO NOTICE_FILE (NOTICE_FILE_CODE, NOTICE_CODE, NOTICE_ORIGIN_NAME, NOTICE_CHANGE_NAME, NOTICE_FILE_ROOT)
		VALUES
		(
		 SEQ_NOTICE_FILE_CODE.NEXTVAL
		 ,SEQ_NOTICE_CODE.CURRVAL
		 ,'guest.png'
		 ,'1668140356406_77200  '
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\notice\'
		);
INSERT INTO NOTICE (NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT ,NOTICE_DATE ,NOTICE_UPDATE)
VALUES (SEQ_NOTICE_CODE.NEXTVAL, '공지사항입니다10', '안녕하세요 EVERYWARE 관리자입니다', SYSDATE, SYSDATE);
INSERT INTO NOTICE_FILE (NOTICE_FILE_CODE, NOTICE_CODE, NOTICE_ORIGIN_NAME, NOTICE_CHANGE_NAME, NOTICE_FILE_ROOT)
		VALUES
		(
		 SEQ_NOTICE_FILE_CODE.NEXTVAL
		 ,SEQ_NOTICE_CODE.CURRVAL
		 ,'1.jpg'
		 ,'1668139644688_67624 '
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\notice\'
		);
INSERT INTO NOTICE (NOTICE_CODE, NOTICE_TITLE, NOTICE_CONTENT ,NOTICE_DATE ,NOTICE_UPDATE)
VALUES (SEQ_NOTICE_CODE.NEXTVAL, '공지사항입니다11', '안녕하세요 EVERYWARE 관리자입니다', SYSDATE, SYSDATE);

INSERT INTO NOTICE_FILE (NOTICE_FILE_CODE, NOTICE_CODE, NOTICE_ORIGIN_NAME, NOTICE_CHANGE_NAME, NOTICE_FILE_ROOT)
		VALUES
		(
		 SEQ_NOTICE_FILE_CODE.NEXTVAL
		 ,SEQ_NOTICE_CODE.CURRVAL
		 ,'2.jpg'
		 ,'1668139572971_21010 '
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\notice\'
		);

COMMIT;



INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '1','admin@everyware.com', '확인 바랍니다', '테스트용 1', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL_FILE (MAIL_FILE_CODE, MAIL_CODE, MAIL_ORIGIN_NAME, MAIL_CHANGE_NAME, MAIL_FILE_ROOT)
		VALUES
		(
		 SEQ_MAIL_FILE_CODE.NEXTVAL
		 ,SEQ_MAIL_CODE.CURRVAL
		 ,'guest.png'
		 ,'1668143830727_12028'
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\mail\'
		);
INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '1','admin@everyware.com', '수신 바랍니다', '오늘은 금요일입니다', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL_FILE (MAIL_FILE_CODE, MAIL_CODE, MAIL_ORIGIN_NAME, MAIL_CHANGE_NAME, MAIL_FILE_ROOT)
		VALUES
		(
		 SEQ_MAIL_FILE_CODE.NEXTVAL
		 ,SEQ_MAIL_CODE.CURRVAL
		 ,'1.jpg'
		 ,'1668144328960_76516'
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\mail\'
		);      
        
INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '1','admin@everyware.com', '수신 바랍니다', '오늘은 금요일입니다', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL_FILE (MAIL_FILE_CODE, MAIL_CODE, MAIL_ORIGIN_NAME, MAIL_CHANGE_NAME, MAIL_FILE_ROOT)
		VALUES
		(
		 SEQ_MAIL_FILE_CODE.NEXTVAL
		 ,SEQ_MAIL_CODE.CURRVAL
		 ,'2.jpg'
		 ,'1668144328966_12249'
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\mail\'
		);
        
INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '1','admin@everyware.com', '수신 바랍니다2', '오늘은 금요일입니다', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL_FILE (MAIL_FILE_CODE, MAIL_CODE, MAIL_ORIGIN_NAME, MAIL_CHANGE_NAME, MAIL_FILE_ROOT)
		VALUES
		(
		 SEQ_MAIL_FILE_CODE.NEXTVAL
		 ,SEQ_MAIL_CODE.CURRVAL
		 ,'3.jpg'
		 ,'1668144328970_86315'
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\mail\'
		);
 INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '1','admin@everyware.com', '확인 바랍니다', '테스트용 1', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL_FILE (MAIL_FILE_CODE, MAIL_CODE, MAIL_ORIGIN_NAME, MAIL_CHANGE_NAME, MAIL_FILE_ROOT)
		VALUES
		(
		 SEQ_MAIL_FILE_CODE.NEXTVAL
		 ,SEQ_MAIL_CODE.CURRVAL
		 ,'guest.png'
		 ,'1668143830727_12028'
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\mail\'
		);
INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '1','admin@everyware.com', '수신 바랍니다', '오늘은 금요일입니다', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL_FILE (MAIL_FILE_CODE, MAIL_CODE, MAIL_ORIGIN_NAME, MAIL_CHANGE_NAME, MAIL_FILE_ROOT)
		VALUES
		(
		 SEQ_MAIL_FILE_CODE.NEXTVAL
		 ,SEQ_MAIL_CODE.CURRVAL
		 ,'1.jpg'
		 ,'1668144328960_76516'
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\mail\'
		);      
        
INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '1','admin@everyware.com', '수신 바랍니다', '오늘은 금요일입니다', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL_FILE (MAIL_FILE_CODE, MAIL_CODE, MAIL_ORIGIN_NAME, MAIL_CHANGE_NAME, MAIL_FILE_ROOT)
		VALUES
		(
		 SEQ_MAIL_FILE_CODE.NEXTVAL
		 ,SEQ_MAIL_CODE.CURRVAL
		 ,'2.jpg'
		 ,'1668144328966_12249'
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\mail\'
		);
        
INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '1','admin@everyware.com', '수신 바랍니다2', '오늘은 금요일입니다', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL_FILE (MAIL_FILE_CODE, MAIL_CODE, MAIL_ORIGIN_NAME, MAIL_CHANGE_NAME, MAIL_FILE_ROOT)
		VALUES
		(
		 SEQ_MAIL_FILE_CODE.NEXTVAL
		 ,SEQ_MAIL_CODE.CURRVAL
		 ,'3.jpg'
		 ,'1668144328970_86315'
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\mail\'
		); 
  INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '1','admin@everyware.com', '확인 바랍니다', '테스트용 1', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL_FILE (MAIL_FILE_CODE, MAIL_CODE, MAIL_ORIGIN_NAME, MAIL_CHANGE_NAME, MAIL_FILE_ROOT)
		VALUES
		(
		 SEQ_MAIL_FILE_CODE.NEXTVAL
		 ,SEQ_MAIL_CODE.CURRVAL
		 ,'guest.png'
		 ,'1668143830727_12028'
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\mail\'
		);
INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '1','admin@everyware.com', '수신 바랍니다', '오늘은 금요일입니다', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL_FILE (MAIL_FILE_CODE, MAIL_CODE, MAIL_ORIGIN_NAME, MAIL_CHANGE_NAME, MAIL_FILE_ROOT)
		VALUES
		(
		 SEQ_MAIL_FILE_CODE.NEXTVAL
		 ,SEQ_MAIL_CODE.CURRVAL
		 ,'1.jpg'
		 ,'1668144328960_76516'
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\mail\'
		);      
        
INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '1','admin@everyware.com', '수신 바랍니다', '오늘은 금요일입니다', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL_FILE (MAIL_FILE_CODE, MAIL_CODE, MAIL_ORIGIN_NAME, MAIL_CHANGE_NAME, MAIL_FILE_ROOT)
		VALUES
		(
		 SEQ_MAIL_FILE_CODE.NEXTVAL
		 ,SEQ_MAIL_CODE.CURRVAL
		 ,'2.jpg'
		 ,'1668144328966_12249'
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\mail\'
		);
        
INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '1','admin@everyware.com', '수신 바랍니다2', '오늘은 금요일입니다', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL_FILE (MAIL_FILE_CODE, MAIL_CODE, MAIL_ORIGIN_NAME, MAIL_CHANGE_NAME, MAIL_FILE_ROOT)
		VALUES
		(
		 SEQ_MAIL_FILE_CODE.NEXTVAL
		 ,SEQ_MAIL_CODE.CURRVAL
		 ,'3.jpg'
		 ,'1668144328970_86315'
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\mail\'
		);       
        
INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '3','user02@everyware.com', '확인 바랍니다', '테스트용 1', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL_FILE (MAIL_FILE_CODE, MAIL_CODE, MAIL_ORIGIN_NAME, MAIL_CHANGE_NAME, MAIL_FILE_ROOT)
		VALUES
		(
		 SEQ_MAIL_FILE_CODE.NEXTVAL
		 ,SEQ_MAIL_CODE.CURRVAL
		 ,'guest.png'
		 ,'1668143830727_12028'
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\mail\'
		);     
        COMMIT;        

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '3','user02@everyware.com', '확인 바랍니다2', '테스트용 1', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '3','user02@everyware.com', '확인 바랍니다3', '사내 공지에 대해 수정사항 있습니다', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '3','user02@everyware.com', '확인 바랍니다4', '사내 공지에 대해 수정사항 있습니다 1', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '3','user02@everyware.com', '확인 바랍니다5', '사내 공지에 대해 수정사항 있습니다 2', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '3','user02@everyware.com', '확인 바랍니다5', '사내 공지에 대해 수정사항 있습니다 2', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '3','user02@everyware.com', '확인 바랍니다5', '사내 공지에 대해 수정사항 있습니다 2', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '3','user02@everyware.com', '확인 바랍니다5', '사내 공지에 대해 수정사항 있습니다 2', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '3','user02@everyware.com', '확인 바랍니다5', '사내 공지에 대해 수정사항 있습니다 2', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '3','user02@everyware.com', '확인 바랍니다5', '사내 공지에 대해 수정사항 있습니다 2', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '3','user02@everyware.com', '확인 바랍니다5', '사내 공지에 대해 수정사항 있습니다 2', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '3','user02@everyware.com', '확인 바랍니다5', '사내 공지에 대해 수정사항 있습니다 2', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '3','user02@everyware.com', '확인 바랍니다5', '사내 공지에 대해 수정사항 있습니다 2', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '3','user02@everyware.com', '확인 바랍니다5', '사내 공지에 대해 수정사항 있습니다 2', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '3','user02@everyware.com', '확인 바랍니다5', '사내 공지에 대해 수정사항 있습니다 2', SYSDATE,'user01@everyware.com');


INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '반갑습니다', '금일 회의에 대해 말씀드릴게 있습니다', SYSDATE,'admin@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '반갑습니다', '금일 회의에 대해 말씀드릴게 있습니다2', SYSDATE,'admin@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '반갑습니다', '금일 회의에 대해 말씀드릴게 있습니다3', SYSDATE,'admin@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '반갑습니다', '금일 회의에 대해 말씀드릴게 있습니다4', SYSDATE,'admin@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '반갑습니다', '금일 회의에 대해 말씀드릴게 있습니다5', SYSDATE,'admin@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '반갑습니다', '금일 회의에 대해 말씀드릴게 있습니다6', SYSDATE,'admin@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '반갑습니다', '금일 회의에 대해 말씀드릴게 있습니다7', SYSDATE,'admin@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '반갑습니다', '금일 회의에 대해 말씀드릴게 있습니다8', SYSDATE,'admin@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '반갑습니다', '금일 회의에 대해 말씀드릴게 있습니다9', SYSDATE,'admin@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '반갑습니다', '금일 회의에 대해 말씀드릴게 있습니다10', SYSDATE,'admin@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '반갑습니다', '금일 회의에 대해 말씀드릴게 있습니다11', SYSDATE,'admin@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '3','user02@everyware.com', '이미지 확인 바랍니다', '테스트용 1', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL_FILE (MAIL_FILE_CODE, MAIL_CODE, MAIL_ORIGIN_NAME, MAIL_CHANGE_NAME, MAIL_FILE_ROOT)
		VALUES
		(
		 SEQ_MAIL_FILE_CODE.NEXTVAL
		 ,SEQ_MAIL_CODE.CURRVAL
		 ,'guest.png'
		 ,'1668143830727_12028'
		 ,'D:\EveryWare hi\ws\EveryWare\src\main\webapp\resources\upload\mail\'
		);     
        
INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '내게 쓰기 메모', '내게 쓴 내용', SYSDATE,'user01@everyware.com');


INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '내게 쓰기 메모2', '내게 쓴 내용', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '내게 쓰기 메모3', '내게 쓴 내용', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '내게 쓰기 메모4', '내게 쓴 내용', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '내게 쓰기 메모5', '내게 쓴 내용', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '내게 쓰기 메모6', '내게 쓴 내용', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '내게 쓰기 메모7', '내게 쓴 내용', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '내게 쓰기 메모8', '내게 쓴 내용', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '내게 쓰기 메모9', '내게 쓴 내용', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '내게 쓰기 메모10', '내게 쓴 내용', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '내게 쓰기 메모', '내게 쓴 내용', SYSDATE,'user01@everyware.com');

INSERT INTO MAIL (MAIL_CODE, EMP_CODE, MAIL_SENDER, MAIL_TITLE, MAIL_CONTENT, MAIL_SENDDATE, MAIL_RECEIVER)
VALUES (SEQ_MAIL_CODE.NEXTVAL, '2','user01@everyware.com', '내게 쓰기 메모', '내게 쓴 내용', SYSDATE,'user01@everyware.com');

COMMIT;

--주소록 더미데이터--------------------------------------------------
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '서예린', 'kh01@gmail.com', '010-3465-5325', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '이아름', 'kh02@gmail.com', '010-3463-5625', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '박상언', 'kh03@gmail.com', '010-3092-1225', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '고은비', 'kh04@gmail.com', '010-9965-0105', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '김우인', 'kh05@gmail.com', '010-8321-0455', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '박준혁', 'kh06@gmail.com', '010-9941-1473', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '권효정', 'kh07@gmail.com', '010-3335-7811', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '서예원', 'kh08@gmail.com', '010-2278-3678', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '김충희', 'kh09@gmail.com', '010-3865-5305', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '신현지', 'kh10@gmail.com', '010-3565-0005', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '오준혁', 'kh11@gmail.com', '010-8542-3446', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '오귀석', 'kh12@gmail.com', '010-3904-2941', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '조아연', 'kh13@gmail.com', '010-2039-3943', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '조은진', 'kh14@gmail.com', '010-3003-5325', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '서준영', 'kh15@gmail.com', '010-3039-0881', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '박서영', 'kh16@gmail.com', '010-2003-1923', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '박한솔', 'kh17@gmail.com', '010-3004-1234', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '박찬수', 'kh18@gmail.com', '010-4988-2358', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '서교상', 'kh19@gmail.com', '010-3379-3406', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');
INSERT INTO CONTACTS (CON_NO, CON_WRITER, CON_NAME, CON_EMAIL, CON_TEL, CON_COMPANY, CON_MEMO, FILE_NAME)
VALUES (SEQ_CONTACTS_NO.NEXTVAL, '1', '심원용', 'kh20@gmail.com', '010-9812-7553', 'KH COMPANY', '주소록 등록 완료' , '1666956520181_55956.png');


--예약 더미데이터----------------------------------------------------
INSERT INTO BOOKING (BK_NO, BK_WRITER, BK_TYPE, BK_TARGET_NO, BK_START, START_TIME, BK_END, END_TIME)
VALUES (SEQ_BOOKING_NO.NEXTVAL, '1', 'A', '1', TO_DATE('2022/11/14', 'YYYY/MM/DD'), TO_DATE('16:00', 'HH24:MI'), TO_DATE('2022/11/14', 'YYYY/MM/DD'), TO_DATE('18:00', 'HH24:MI'));
INSERT INTO BOOKING (BK_NO, BK_WRITER, BK_TYPE, BK_TARGET_NO, BK_START, START_TIME, BK_END, END_TIME)
VALUES (SEQ_BOOKING_NO.NEXTVAL, '1', 'A', '2', TO_DATE('2022/11/14', 'YYYY/MM/DD'), TO_DATE('16:00', 'HH24:MI'), TO_DATE('2022/11/14', 'YYYY/MM/DD'), TO_DATE('18:00', 'HH24:MI'));
INSERT INTO BOOKING (BK_NO, BK_WRITER, BK_TYPE, BK_TARGET_NO, BK_START, START_TIME, BK_END, END_TIME)
VALUES (SEQ_BOOKING_NO.NEXTVAL, '1', 'A', '3', TO_DATE('2022/11/14', 'YYYY/MM/DD'), TO_DATE('15:00', 'HH24:MI'), TO_DATE('2022/11/14', 'YYYY/MM/DD'), TO_DATE('16:00', 'HH24:MI'));
INSERT INTO BOOKING (BK_NO, BK_WRITER, BK_TYPE, BK_TARGET_NO, BK_START, START_TIME, BK_END, END_TIME)
VALUES (SEQ_BOOKING_NO.NEXTVAL, '1', 'M', '4', TO_DATE('2022/11/14', 'YYYY/MM/DD'), TO_DATE('14:00', 'HH24:MI'), TO_DATE('2022/11/14', 'YYYY/MM/DD'), TO_DATE('16:00', 'HH24:MI'));
INSERT INTO BOOKING (BK_NO, BK_WRITER, BK_TYPE, BK_TARGET_NO, BK_START, START_TIME, BK_END, END_TIME)
VALUES (SEQ_BOOKING_NO.NEXTVAL, '1', 'M', '5', TO_DATE('2022/11/14', 'YYYY/MM/DD'), TO_DATE('17:00', 'HH24:MI'), TO_DATE('2022/11/14', 'YYYY/MM/DD'), TO_DATE('18:00', 'HH24:MI'));


-- 타겟 더미데이터----------------------------------------------------        
INSERT INTO TARGET ( TARGET_NO ,TARGET_NAME , TARGET_TAG, TARGET_IMAGE)
VALUES ( SEQ_TARGET_NO.NEXTVAL , '빔프로젝트' , '비품' , 'bim.png');
INSERT INTO TARGET ( TARGET_NO ,TARGET_NAME , TARGET_TAG, TARGET_IMAGE)
VALUES ( SEQ_TARGET_NO.NEXTVAL , '커피머신' , '비품' , 'illy.png');
INSERT INTO TARGET ( TARGET_NO ,TARGET_NAME , TARGET_TAG, TARGET_IMAGE)
VALUES ( SEQ_TARGET_NO.NEXTVAL , '노트북' , '비품' , 'laptop.png');
INSERT INTO TARGET ( TARGET_NO ,TARGET_NAME , TARGET_TAG, TARGET_IMAGE)
VALUES ( SEQ_TARGET_NO.NEXTVAL , '회의실01' , '회의실' , 'meeting_room01.png');
INSERT INTO TARGET ( TARGET_NO ,TARGET_NAME , TARGET_TAG, TARGET_IMAGE)
VALUES ( SEQ_TARGET_NO.NEXTVAL , '회의실02' , '회의실' , 'meeting_room02.png');

COMMIT;
