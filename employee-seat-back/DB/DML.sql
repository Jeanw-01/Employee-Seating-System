--���u�y��w�ƨt�� DML
USE bankdb
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (1, 1, '�w����');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (1, 2, '�Ŧ�');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (1, 3, '�Ŧ�');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (1, 4, '�Ŧ�');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (2, 1, '�Ŧ�');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (2, 2, '�w����');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (2, 3, '�Ŧ�');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (2, 4, '�Ŧ�');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (3, 1, '�Ŧ�');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (3, 2, '�Ŧ�');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (3, 3, '�w����');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (3, 4, '�Ŧ�');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (4, 1, '�Ŧ�');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (4, 2, '�Ŧ�');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (4, 3, '�Ŧ�');
INSERT INTO SeatingChart (FLOOR_NO, SEAT_NO, STATUS) VALUES (4, 4, '�w����');

INSERT INTO Employee (EMP_ID, NAME, EMAIL, FLOOR_SEAT_SEQ)
VALUES ('10101', '���p��', 'mei@example.com', 1);

INSERT INTO Employee (EMP_ID, NAME, EMAIL, FLOOR_SEAT_SEQ)
VALUES ('12345', '�L�j�j', 'strong@example.com', 6);

INSERT INTO Employee (EMP_ID, NAME, EMAIL, FLOOR_SEAT_SEQ)
VALUES ('14725', '���p��', 'lun@example.com', 11);

INSERT INTO Employee (EMP_ID, NAME, EMAIL, FLOOR_SEAT_SEQ)
VALUES ('10203', '�G�p�R', 'li@example.com', 16);

-- ���J�٨S�w�Ʈy�쪺���u
INSERT INTO Employee (EMP_ID, NAME, EMAIL)
VALUES ('10102', '���p��', 'ming@example.com');

INSERT INTO Employee (EMP_ID, NAME, EMAIL)
VALUES ('12356', '���j��', 'wen@example.com');

INSERT INTO Employee (EMP_ID, NAME, EMAIL)
VALUES ('10106', '���j��', 'handsome@example.com');
