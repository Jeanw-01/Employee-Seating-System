--員工座位安排系統 Stored Procedure
CREATE PROCEDURE UpdateSeatByEmployee
    @EMP_ID VARCHAR(5),
    @NEW_SEAT_SEQ INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- 1. 取得該員工目前的座位（若有）
        DECLARE @OLD_SEAT_SEQ INT;
        SELECT @OLD_SEAT_SEQ = FLOOR_SEAT_SEQ
        FROM Employee
        WHERE EMP_ID = @EMP_ID;

        -- 2. 檢查新座位是否已被佔用（透過 Employee 反查）
        IF EXISTS (
            SELECT 1 FROM Employee
            WHERE FLOOR_SEAT_SEQ = @NEW_SEAT_SEQ AND EMP_ID != @EMP_ID
        )
        BEGIN
            RAISERROR('該座位已被其他員工使用', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- 3. 更新舊座位為空位（如果有）
        IF @OLD_SEAT_SEQ IS NOT NULL
        BEGIN
            UPDATE SeatingChart
            SET STATUS = '空位'
            WHERE FLOOR_SEAT_SEQ = @OLD_SEAT_SEQ;
        END

        -- 4. 更新新座位為已佔用
        UPDATE SeatingChart
        SET STATUS = '已佔用'
        WHERE FLOOR_SEAT_SEQ = @NEW_SEAT_SEQ;

        -- 5. 更新員工的座位編號
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
