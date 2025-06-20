--員工座位安排系統 DDL
USE bankdb
CREATE TABLE SeatingChart (
    FLOOR_SEAT_SEQ INT IDENTITY(1,1) PRIMARY KEY,  -- 自動編號座位序號
    FLOOR_NO INT NOT NULL,
    SEAT_NO INT NOT NULL,
    STATUS VARCHAR(10) DEFAULT '空位'  -- 預設為空位，可標示使用狀態
);

CREATE TABLE Employee (
    EMP_ID VARCHAR(5) PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(50),
    FLOOR_SEAT_SEQ INT,
    CONSTRAINT FK_Seat FOREIGN KEY (FLOOR_SEAT_SEQ) REFERENCES SeatingChart(FLOOR_SEAT_SEQ),
    -- CONSTRAINT uq_seat UNIQUE (FLOOR_SEAT_SEQ)  -- 保證一個座位只會被一位員工佔用
);

-- 補上條件式唯一索引，只限制非 NULL 的 FLOOR_SEAT_SEQ 唯一（允許多個 NULL）
CREATE UNIQUE INDEX idx_unique_seat_not_null
ON Employee (FLOOR_SEAT_SEQ)
WHERE FLOOR_SEAT_SEQ IS NOT NULL;

-- Stored Procedure 範例
/*
DELIMITER $$
CREATE PROCEDURE GetSeatingChart()
BEGIN
    SELECT sc.*, e.EMP_ID FROM SeatingChart sc
    LEFT JOIN Employee e ON sc.FLOOR_SEAT_SEQ = e.FLOOR_SEAT_SEQ;
END $$
DELIMITER ;
*/