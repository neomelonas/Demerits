--
use Group1Project2010
--
/*
If you need to re-create the database, drop tables in the 
following order.

drop table StudentDemeritDetention;
drop table StudentDetention;
drop table Detention;
drop table UserComments;
drop table Comments;
drop table StudentHomeroom;
drop table Homeroom;
drop table UserAddress;
drop table UserPhone;
drop table Address;
drop table UserDemerits;
drop table DemeritList;
drop table AssignedDemerits;
drop table Demerits;
drop table UserRoles;
drop table UserRole;
drop table Student;
drop table Parent;
drop table Teacher;
drop table DUser;

*/
--
create table DUser(
	userID int not null,
	username varchar(8) not null,
	userPass varchar(45) not null,
	userFName varchar(15) not null,
	userLName varchar(15) not null,
	failCount int not null default 0,
	constraint pkUser primary key(userID),
	constraint ukUser unique(username)
);
--
create table Phone(
	userID int not null, 
	phoneNum varchar(10), 
	constraint pkPhone primary key(userID, phoneNum), 
	constraint fkPhoneToUser foreign key (userID) 
		references DUSer(userID)
);
--
create table Address(
	addressID int not null, 
	street1 varchar(50) not null, 
	street2 varchar(50) default null, 
	city varchar(40) not null, 
	state enum(
		'AL','AK','AZ','AR','CA','CO','CT','DE','DC','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','MD','MA','MI','MN','MS','MO','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY'
	) not null, 
	ZIP int(5) not null,
	constraint pkAddress primary key(addressID)
);
--
create table UserAddress(
	userID int not null, 
	addressID int not null, 
	constraint pkUserAddress primary key(userID, addressID), 
	constraint fkUAtoUser foreign key (userID) 
		references DUSer(userID), 
	constraint fkUAtoAddress foreign key (addressID) 
		references Addresss(addressID)
);
--
create table UserRoles(
	roleID int not null,
	roleName varchar(20) not null,
	constraint pkUserRoles primary key(roleID)
);
--
create table UserRole(
	userID int not null, 
	roleID int not null, 
	constraint pkUserRole primary key(userID, roleID), 
	constraint fkUserRoletoUser foreign key (userID) 
		references DUSer(userID), 
	constraint fkUserRoletoUserRoles foreign key (roleID)
		references UserRoles(roleID)
);
--
create table Parent(
	parentID int not null, 
	constraint pkParent primary key(parentID),
	constraint fkParenttoUser foreign key (parentID) 
		references DUSer(userID)
);
--
create table Student(
	studentID int not null,
	parentID, int not null,
	constraint pkStudent primary key(studentID),
	constraint fkStudentToUser foreign key (studentID)	
		references DUSer(userID), 
	constraint fkStudentToParent foreign key (parentID) 
		references Parent(parentID)
);
--
create table Teacher(
	teacherID int not null,
	constraint pkTeacher primary key(teacherID),
	constraint fkTeacherToUser foreign key (teacherID) 
		references DUSer(userID)
);
--
create table Homeroom(
	homeroomID int not null,
	classNumber int not null,
	teacherID int not null,
	constraint pkHomeroom primary key(homeroomID),
	constraint fkHomeroomToTeacher foreign key (teacherID) 
		references Teacher(teacherID)
);
--
create table StudentHomeroom(
	studentID int not null, 
	homeroomID int not null, 
	constraint pkStudentHomeroom primary key(studentID, homeroomID), 
	constraint fkStudentHomeroomToStudent foreign key (studentID) 
		references Student(studentID), 
	constraint fkStudentHomeroomToHomeroom foreign key (homeroomID) 
		references Homeroom(homeroomID)
);
--
create table AssignedDemerits(
	assignedDemeritID int not null, 
	demeritDate date not null,
	demeritTime time not null,
	teacherID int not null, 
	constraint pkAssignedDemerits primary key(assignedDemeritID),
	constraint fkAssignedDemeritsToTeacher foreign key (teacherID) 
		references Teacher(teacherID)
);
--
create table Demerits(
	demeritID int not null, 
	demeritDescription varchar(50) not null,
	constraint pkDemerits primary key(demeritID)
);
--
create table DemeritList(
	demeritID int not null,
	assignedDemeritID int not null,
	constraint pkDemeritList primary key(demeritID, assignedDemeritID), 
	constraint fkDemeritListToDemerits foreign  key (demeritID) 
		references Demerits(demeritID), 
	constraint fkDemeritListToAssignedDemerits foreign key (assignedDemeritID) 
		references AssignedDemerits(assignedDemeritID)
);
--
create table UserDemerits(
	assignedDemeritID int not null, 
	studentID int not null, 
	constraint pkUserDemerits primary key(assignedDemeriID, userID), 
	constraint fkUserDemeritsToAssignedDemerits foreign key (assignedDemeritID) 
		references AssignedDemerits(assignedDemeritID), 
	constraint fkUserDemeritsToStudent foreign key (studentID) 
		references Student(studentID)
);
--
create table Comments(
	commentID int not null,
	commentDesc text not null,
	assignedDemeritID int not null, 
	commentLink int not null, 
	constraint pkComments primary key(commentID),
	constraint fkCommentsToAssignedDemerits foreign key (assignedDemeritID) 
		references AssignedDemerits(assignedDemeritID), 
	constraint fkCommentsToComments foreign key (commentLink) 
		references Comments(commentID)
);
--
create table UserComments(
	userID int not null, 
	commentID int not null, 
	constraint pkUserComments primary key(userID, commentID), 
	constraint fkUserCommentsToUser foreign key (userID)
		references DUSer(userID), 
	constraint fkUserCommentsToComments foreign key (commentID) 
		references Comments(commentID)
);
--
create table Detention(
	detentionID int not null,
	detentionDate date not null,
	constraint pkDetention primary key(detentionID)
);
--
create table StudentDetention(
	studentID int not null, 
	detentionID int not null,
	served bit not null default 0,
	constraint pkStudentDetention primary key(studentID, detentionID), 
	constraint fkStudentDetentionToStudent foreign key (studentID)
		references Student(studentID), 
	constraint fkStudentDetentionToDetention foreign key (detentionID) 
		references Detention(detentionID)
);
--
create table StudentDemeritDetention(
	studentID int not null,
	assignedDemeritID int not null,
	detentionID int not null, 
	constraint pkStudentDemeritDetention primary key(studentID, assignedDemeritID, detentionID), 
	constraint fkStudentDemeritDetentionToStudent foreign key (studentID) 
		references Student(studentID), 
	constraint fkStudentDemeritDetentionToAssignedDemerits foreign key (assignedDemeritID) 
		references AssignedDemerits(assignedDemeritID), 
	constraint fkStudentDemeritDetentionToDetention foreign key (detentionID) 
		references Detention(detentionID)
);
--