echo "Enter the name of database you wish to create"
read Dbname

psql << EOF
Create Database $Dbname;
\c $Dbname
EOF
