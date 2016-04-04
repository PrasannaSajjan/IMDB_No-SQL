import csv
import json
csvfile = open('/home/psajjan/pyf/a5/trivia_year.csv', 'r')
jsonfile = open('/home/psajjan/pyf/a5/trivia_year.json', 'w')
reader = csv.DictReader( csvfile, fieldnames = ("Movie_id","Trivia","Year"),delimiter='|')
for row in reader:
    json.dump(row, jsonfile)
    jsonfile.write('\n')