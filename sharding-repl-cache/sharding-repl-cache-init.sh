docker exec -i shard1-primary mongosh --host shard1-primary --port 27018 <<EOF
rs.initiate(
    {
      _id : "shard1",
      members: [
        { _id : 0, host : "shard1-primary:27018" },
        { _id : 1, host : "shard1-replica1:27021" },
        { _id : 2, host : "shard1-replica2:27022" }
        
      ]
    }
);
exit();
EOF

docker exec -i shard2-primary mongosh --host shard2-primary --port 27019 <<EOF
rs.initiate(
    {
      _id : "shard2",
      members: [
        { _id : 0, host : "shard2-primary:27019" },
        { _id : 1, host : "shard2-replica1:27023" },
        { _id : 2, host : "shard2-replica2:27024" }
      ]
    }
  );
exit();
EOF

docker exec -i mongos_router mongosh --host mongos_router --port 27020 <<EOF
sh.addShard( "shard1/shard1-primary:27018");
sh.addShard( "shard2/shard2-primary:27019");
sh.enableSharding("somedb");

use somedb
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )
for(var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i})
exit(); 
EOF