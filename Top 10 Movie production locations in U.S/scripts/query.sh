mongo <<\EOF
use psajjan
db.mlocations.aggregate([{"$group": {"_id": {"movie_id": "$movie_id","movie_location": "$movie_location"}}}, 
{"$group": {"_id": {"movie_location": "$_id.movie_location"}, "count": {"$sum": 1}}}, {$sort: {count: -1}},{$limit:10}]);
EOF
