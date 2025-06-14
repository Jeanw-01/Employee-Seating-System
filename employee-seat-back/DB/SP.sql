--���u�y��w�ƨt�� Stored Procedure
CREATE PROCEDURE UpdateSeatByEmployee
    @EMP_ID VARCHAR(5),
    @NEW_SEAT_SEQ INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- 1. ���o�ӭ��u�ثe���y��]�Y���^
        DECLARE @OLD_SEAT_SEQ INT;
        SELECT @OLD_SEAT_SEQ = FLOOR_SEAT_SEQ
        FROM Employee
        WHERE EMP_ID = @EMP_ID;

        -- 2. �ˬd�s�y��O�_�w�Q���Ρ]�z�L Employee �Ϭd�^
        IF EXISTS (
            SELECT 1 FROM Employee
            WHERE FLOOR_SEAT_SEQ = @NEW_SEAT_SEQ AND EMP_ID != @EMP_ID
        )
        BEGIN
            RAISERROR('�Ӯy��w�Q��L���u�ϥ�', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- 3. ��s�®y�쬰�Ŧ�]�p�G���^
        IF @OLD_SEAT_SEQ IS NOT NULL
        BEGIN
            UPDATE SeatingChart
            SET STATUS = '�Ŧ�'
            WHERE FLOOR_SEAT_SEQ = @OLD_SEAT_SEQ;
        END

        -- 4. ��s�s�y�쬰�w����
        UPDATE SeatingChart
        SET STATUS = '�w����'
        WHERE FLOOR_SEAT_SEQ = @NEW_SEAT_SEQ;

        -- 5. ��s���u���y��s��
        UPDATE Employee
        SET FLOOR_SEAT_SEQ = @NEW_SEAT_SEQ
        WHERE EMP_ID = @EMP_ID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity INT;
        SELECT @ErrMsg = ERROR_MESSAGE(), @ErrSeverity = ERROR_SEVERITY();
        RAISERROR(@ErrMsg, @ErrSeverity, 1);
    END CATCH
END;
