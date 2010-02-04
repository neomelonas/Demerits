use MISGroup1;


--1 GetDemeritInformation
Create Function fnGetDemeritInformation
(
	@DemeritID int
)

returns @tblDemeritInformation table ( teacherID int, adTimestamp smalldatetime, assignedDemeritID int, studentID int)
as begin
	insert into @tblDemeritInformation
	select AD.teacherID , AD.adTimestamp , AD.assignedDemeritID , UD.studentID 
	from AssignedDemerits AD
	Inner Join DemeritList DL on AD.assignedDemeritID = DL.assignedDemeritID
	Inner Join UserDemerits UD on DL.assignedDemeritID = UD.assignedDemeritID
	where DL.demeritID=@DemeritID;
	
	
	return;
end;

/*
select * from fnGetDemeritInformation('2');
*/


--drop function fnGetDemeritInformation