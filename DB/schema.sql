--���u�y��w�ƨt�� DDL
USE bankdb
CREATE TABLE SeatingChart (
    FLOOR_SEAT_SEQ INT IDENTITY(1,1) PRIMARY KEY,  -- �۰ʽs���y��Ǹ�
    FLOOR_NO INT NOT NULL,
    SEAT_NO INT NOT NULL,
    STATUS VARCHAR(10) DEFAULT '�Ŧ�'  -- �w�]���Ŧ�A�i�ХܨϥΪ��A
);

CREATE TABLE Employee (
    EMP_ID VARCHAR(5) PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(50),
    FLOOR_SEAT_SEQ INT,
    CONSTRAINT FK_Seat FOREIGN KEY (FLOOR_SEAT_SEQ) REFERENCES SeatingChart(FLOOR_SEAT_SEQ),
    -- CONSTRAINT uq_seat UNIQUE (FLOOR_SEAT_SEQ)  -- �O�Ҥ@�Ӯy��u�|�Q�@����u����
);

-- �ɤW���󦡰ߤ@���ޡA�u����D NULL �� FLOOR_SEAT_SEQ �ߤ@�]���\�h�� NULL�^
CREATE UNIQUE INDEX idx_unique_seat_not_null
ON Employee (FLOOR_SEAT_SEQ)
WHERE FLOOR_SEAT_SEQ IS NOT NULL;

-- Stored Procedure �d��
/*
DELIMITER $$
CREATE PROCEDURE GetSeatingChart()
BEGIN
    SELECT sc.*, e.EMP_ID FROM SeatingChart sc
    LEFT JOIN Employee e ON sc.FLOOR_SEAT_SEQ = e.FLOOR_SEAT_SEQ;
END $$
DELIMITER ;
*/