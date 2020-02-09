create database hollywood;
drop table hollywood.movie;
create table hollywood.movie (
	 movieID      INT UNSIGNED  NOT NULL AUTO_INCREMENT,
	 movieGenre   CHAR(10)       NOT NULL DEFAULT '',
	 name_mov         VARCHAR(30)   NOT NULL DEFAULT '',
	 score1        INT UNSIGNED ,
     score2        INT UNSIGNED ,
     score3        INT UNSIGNED ,
     score4        INT UNSIGNED ,
     score5        INT UNSIGNED ,
	 PRIMARY KEY  (movieID)
       );
INSERT INTO hollywood.movie VALUES
         (1, 'CRIME', 'Pulp Fiction',  5,4,3,4,5),
         (2, 'MYSTERY', 'Mystic River', 4, 3,2,4,4),
         (3, 'COMEDY', 'Fifty First Dates', 4, null,1,5,3),
         (4, 'CRIME', 'Django Unchained', null, 3,5,4,3),
         (5, 'HORROR', 'Ring', 5, 4,5,1,1),
         (6, 'MYSTERY', 'Shutter Island', 4, 3, null,4,4)
         ;
select * from hollywood.movie;

/* The following update statements take care of missing values in the data*/
UPDATE hollywood.movie 
	set score1=0
WHERE score1 is NULL;

UPDATE hollywood.movie 
	set score2=0
WHERE score2 is NULL;

UPDATE hollywood.movie 
	set score3=0
WHERE score3 is NULL;

UPDATE hollywood.movie 
	set score4=0
WHERE score4 is NULL;

UPDATE hollywood.movie 
	set score5=0
WHERE score5 is NULL;

select * from hollywood.movie

/*The following statement is used to ascertain the path that is configured for secure file creation.
Once the command is run - the path is displayed and the that path is set for creation of the csv file*/

SHOW VARIABLES LIKE "secure_file_priv";

SELECT 'movieID', 'movieGenre', 'name_mov', 'score1', 'score2', 'score3', 'score4', 'score5'
UNION
SELECT * FROM hollywood.movie
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/movie.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ',' ESCAPED BY '"'
LINES TERMINATED BY '\r\n';

/* The csv file hence created is uploaded onto the github repository from where it is then accessed
by the R script*/