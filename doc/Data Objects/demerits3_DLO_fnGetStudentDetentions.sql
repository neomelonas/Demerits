CREATE FUNCTION fnGetStudentDetentions
(
	@studentID int,
	@servedStatus bit
)
RETURNS @tblStudentDetentions TABLE (detentionID int, detentionDate date, demeritID int)
AS BEGIN
	INSERT INTO @tblStudentDetentions 
	SELECT d.detentionID, d.detentionDate, ad.assignedDemeritID 
	FROM DUser u
	INNER JOIN StudentDetention sd ON u.userID=sd.studentID
	INNER JOIN Detention d ON sd.detentionID=d.detentionID
	INNER JOIN StudentDemeritDetention sdd ON d.detentionID=sdd.detentionID
	INNER JOIN AssignedDemerits ad ON sdd.assignedDemeritID=ad.assignedDemeritID
	WHERE sd.studentID=@studentID AND sd.served=@servedStatus;
	RETURN;
END;

/*
select * from fnGetStudentDetentions(7,1);
*/