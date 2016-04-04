echo "Enter the name of the database where you want to populate the data"
read Dbname

psql << EOF
\c $Dbname;
set client_encoding to 'iso-8859-1';
create extension fuzzystrmatch;
create table actors(actorid int NOT NULL, name  varchar(300) NOT NULL, sex char(1));
create table movies(movieid int NOT NULL , title varchar(400), year varchar(100));
create table genres(movieid int NOT NULL,genre varchar(100) NOT NULL);
create table mov_act(movieid int, actorid int);

copy actors(actorid,name,sex) FROM '/home/psajjan/cs695/A1/actors.csv' DELIMITER '|' CSV;
copy movies(movieid,title,year) FROM '/home/psajjan/cs695/A1/movies_new.csv' DELIMITER '|' CSV;
copy genres(movieid,genre) FROM '/home/psajjan/cs695/A1/genres.csv' DELIMITER '|' CSV;
copy mov_act(movieid,actorid) FROM '/home/psajjan/cs695/A1/mov_act.csv' DELIMITER '|' CSV;

EOF
