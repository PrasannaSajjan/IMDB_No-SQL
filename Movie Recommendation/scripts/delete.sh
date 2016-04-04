echo "Enter the name of the database you wish to delete"
read Dbname

psql << EOF
drop database $Dbname;

EOF
