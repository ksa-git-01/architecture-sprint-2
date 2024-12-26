## Как запустить

0. В переменные окружения необходимо добавить переменную REDIS_URL: "redis://<redis-service-name>:6379" 
где вместо <redis-service-name> напишите имя сервиса redis.

1. Открыть терминал, перейти в папку проекта sharding-repl-cache
2. Выполнить команду:

```shell
docker compose up -d
```

Дождаться полной загрузки всех контейнеров

3. Выполнить команду:
```shell
docker exec -i redis-1 redis-cli --cluster create     173.17.0.2:6379 173.17.0.3:6379 173.17.0.4:6379     173.17.0.5:6379 173.17.0.15:6379 173.17.0.16:6379     --cluster-replicas 1
```
На вопрос терминала: Can I set the above configuration?
Ответить: yes

4. Выполнить команду:
```shell
./sharding-repl-cache-init-configsrv.sh
```

5. Выполнить команду:
```shell
./sharding-repl-cache-init.sh
```

6. Перейти на страницу http://localhost:8080 убедиться что:
- mongo_topology_type = "Sharded"
- массив shards содержит информацию о шардах: shard1 и shard2. Для каждого шарда указано три узла: один shard-primary и два shard-replica.
- в атрибуте documents_count коллекции helloDoc содержит информацию о кол-ве документов в коллекции >=1000