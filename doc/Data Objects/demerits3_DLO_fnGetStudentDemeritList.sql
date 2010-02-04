use MISGroup1;

Create Function fnGetStudentDemeritList
(
	@userName varchar(8)
)
returns @tblStudentDemeritList table ( userFName varchar(15), userLName varchar(15), assignedDemeritID int, adTimestamp smalldatetime, teacherID int) 
as begin
	insert into @tblStudentDemeritList 
	select DU.userFName, DU.userLName, UD.assignedDemeritID, adTimestamp , teacherID 
	from DUser DU 
	Inner Join UserDemerits UD on DU.userID = UD.studentID
	Inner Join UserRole UR on DU.userID=UR.userID
	Inner Join AssignedDemerits AD on UD.assignedDemeritID = AD.assignedDemeritID 
	where DU.username=@userName
	return;
	
end;

/*
select * from fnGetStudentDemeritList('dmoore');
*/



--select * from StudentDemeritDetention
--select * from Student
--select * from StudentDetention
--select * from Detention
--select * from DUser