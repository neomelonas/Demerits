--1)a

alter procedure procGetComments
(
	@assignedDemeritID int
)
as
begin


select commentDesc 
FROM Comments 
where @assignedDemeritID=assignedDemeritID;
end;

--execute procGetComments @assignedDemeritID=106;

--select * from Comments;