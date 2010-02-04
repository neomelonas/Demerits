CREATE Function fnGetDemeritInformation
(
	@demeritID int
)

returns @tblDemeritInformation table ( teacherID int, adTimestamp smalldatetime, assignedDemeritID int, studentID int)
as begin
	insert into @tblDemeritInformation
	select AD.teacherID , AD.adTimestamp , AD.assignedDemeritID , UD.studentID 
	from AssignedDemerits AD
	Inner Join DemeritList DL on AD.assignedDemeritID = DL.assignedDemeritID
	Inner Join UserDemerits UD on DL.assignedDemeritID = AD.assignedDemeritID
	inner join Demerits d on DL.demeritID=d.demeritID
	WHERE AD.assignedDemeritID=@demeritID;
	
	
	return;
end;

/*
select * from fnGetDemeritInformation('2');
*/