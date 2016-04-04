echo "Enter the database name you wish to query from"
read Dbname

psql << EOF
\c $Dbname;
\i /home/psajjan/cs695/A1/movies.sql

EOF
