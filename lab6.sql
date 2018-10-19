/* Delete the tables if they already exist */
drop table if exists Movie;
drop table if exists Reviewer;
drop table if exists Rating;
CREATE DATABASE lab6;
/* Create the schema for our tables */
create table Movie(mID int, title text, year int, director text);
create table Reviewer(rID int, name text);
create table Rating(rID int, mID int, stars int, ratingDate date);
ALTER TABLE Movie
    ADD PRIMARY KEY (mID);--1

ALTER TABLE Movie
    ADD UNIQUE (title,year);--2
ALTER TABLE Reviewer
    ADD PRIMARY KEY(rID);--3
ALTER TABLE Rating
    ADD UNIQUE (rID,MID,ratingDate);--4
ALTER TABLE Reviewer
    ADD CONSTRAINT check_name CHECK (name IS NOT NULL);--5
ALTER TABLE Rating
    ADD CONSTRAINT check_stars CHECK (stars IS NOT NULL);--6
ALTER TABLE Movie
    ADD CONSTRAINT year_after CHECK(year>1900);--7
ALTER TABLE Rating
    ADD CONSTRAINT stars_in CHECK(stars IN (1,2,3,4,5));--8
ALTER TABLE Rating
    ADD CONSTRAINT date_after CHECK(EXTRACT(YEAR FROM ratingDate)>2000);--9

SELECT * from pg_constraint;

UPDATE Movie SET mID=mID+1;--error11
INSERT into Movie VAlUES(109,'Titanic',1997,'JC');--error12
INSERT INTO Reviewer VALUES (201, 'Ted Codd');--error13
UPDATE Rating set rID=205,mID=104;--error14
INSERT INTO Reviewer VALUES(209,NULL);--error15
UPDATE Rating set stars=NULL where RID=208;--error16
UPDATE Movie set year=year-40;--error17
UPDATE Rating SET stars=stars+1;--error18
INSERT INTO Rating VALUES(201,101,1,'1999-01-01');--error19
--error20 and error 21 are related with 10th constraint
INSERT INTO Movie VAlues(109,'Titanic',2001, NULL);--done22
UPDATE Rating SET mID=109;--done23
--done24 is related with 10th constraint
UPDATE Rating set stars=stars-1;--done25
ALTER TABLE Rating
    ADD FOREIGN KEY(rID) REFERENCES Reviewer(rID) ON UPDATE CASCADE ON DELETE SET NULL;--26
ALTER TABLE Rating
    ADD FOREIGN KEY(mID) REFERENCES Movie(mID)ON DELETE CASCADE ;--26
INSERT INTO Rating VALUES(209,109,3,'2001-01-01');--error27
UPDATE RATING set rID=209 where rid=208;--error28
UPDATE Rating set mID=mID+1;--error29
UPDATE Movie SET mId=109 WHERE mID=108;--error30
UPDATE Movie SET mID=110 WHERE mID=105;--done31
UPDATE Reviewer set rId=rId+10;--done32
DELETE FROM Reviewer where rid>215;--done33
DELETE FROM Movie where mID<105;--done34
SELECT sum(rID) FROM Rating WHERE rID is not nUll;--check35
SELECT count(*) From rating WHERE rID IS NULL;--check35
SELECT * from Rating;







/* Populate the tables with our data */
insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');

insert into Rating values(201, 101, 2, '2011-01-22');
insert into Rating values(201, 101, 4, '2011-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2011-01-20');
insert into Rating values(203, 108, 4, '2011-01-12');
insert into Rating values(203, 108, 2, '2011-01-30');
insert into Rating values(204, 101, 3, '2011-01-09');
insert into Rating values(205, 103, 3, '2011-01-27');
insert into Rating values(205, 104, 2, '2011-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2011-01-15');
insert into Rating values(206, 106, 5, '2011-01-19');
insert into Rating values(207, 107, 5, '2011-01-20');
insert into Rating values(208, 104, 3, '2011-01-02');