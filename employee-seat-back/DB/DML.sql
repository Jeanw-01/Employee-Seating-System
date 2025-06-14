--員工座位安排系統 DML
USE bankdb
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (1, 1, '已佔用');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (1, 2, '空位');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (1, 3, '空位');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (1, 4, '空位');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (2, 1, '空位');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (2, 2, '已佔用');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (2, 3, '空位');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (2, 4, '空位');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (3, 1, '空位');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (3, 2, '空位');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (3, 3, '已佔用');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (3, 4, '空位');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (4, 1, '空位');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (4, 2, '空位');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (4, 3, '空位');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (4, 4, '已佔用');

INSERT INTO Employee (EMP_ID, NAME, EMAIL, FLOOR_SEAT_SEQ)
VALUES ('10101', '王小美', 'mei@example.com', 1);

INSERT INTO Employee (EMP_ID, NAME, EMAIL, FLOOR_SEAT_SEQ)
VALUES ('12345', '林大強', 'strong@example.com', 6);

INSERT INTO Employee (EMP_ID, NAME, EMAIL, FLOOR_SEAT_SEQ)
VALUES ('14725', '黃小倫', 'lun@example.com', 11);

INSERT INTO Employee (EMP_ID, NAME, EMAIL, FLOOR_SEAT_SEQ)
VALUES ('10203', '鄭小麗', 'li@example.com', 16);

-- 插入還沒安排座位的員工
INSERT INTO Employee (EMP_ID, NAME, EMAIL)
VALUES ('10102', '王小明', 'ming@example.com');

INSERT INTO Employee (EMP_ID, NAME, EMAIL)
VALUES ('12356', '陳大文', 'wen@example.com');

INSERT INTO Employee (EMP_ID, NAME, EMAIL)
VALUES ('10106', '李大帥', 'handsome@example.com');
