--1)b
alter procedure procAddNewComment
(
	@commentDesc text,
	@assignedDemeritID int,
	@commentLink int
)
as
begin

insert into Comments 
(commentID, commentDesc, assignedDemeritID, commentTimestamp, commentLink)
values (11, @commentDesc, @assignedDemeritID, CURRENT_TIMESTAMP, @commentLInk);

select * from Comments;

end;

/*
execute procAddNewComment 
@commentDesc='Also Added using procedure',@assignedDemeritID=106, @commentLink=10;

*/
--select * from assignedDemerits
--select * from Comments;
