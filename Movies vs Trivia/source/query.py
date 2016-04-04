import couchdb
import csv

server = couchdb.Server('http://localhost:5984')
db = server['psajjan_test']

map = '''function(docs) {
 emit([docs.Movie_id], 1);
}'''

reduce = '''function(keys, values) {
 return sum(values);
}'''

result = db.query(map, reduce, group=True)

total_count={}
for i in result:
        if i.value in total_count:
                total_count[i.value]=total_count[i.value]+1
        else:
                total_count[i.value]=1

output = []
for k,v in total_count.items():
        output.append([k,v])
with open("trivia_count.csv","w") as f:
        writer = csv.writer(f)
        writer.writerows(output)
