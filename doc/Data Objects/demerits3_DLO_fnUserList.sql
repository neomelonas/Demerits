CREATE FUNCTION fnUserList
(
	@role varchar(20)
)
RETURNS @tblUserList TABLE (userID int, userFName varchar(15), userLName varchar(15))
AS BEGIN
	INSERT INTO @tblUserList
	SELECT DU.userID,DU.userFName,DU.userLName
	FROM DUser DU
	INNER JOIN UserRole UR ON DU.userID=UR.userID
	INNER JOIN UserRoles URS ON UR.roleID=URS.roleID
	WHERE URS.roleName=@role;
	
	RETURN;
END;

/*
SELECT * FROM fnUserList('Student');
*/
