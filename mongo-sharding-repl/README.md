## Как запустить

1. Открыть терминал, перейти в папку проекта mongo-sharding-repl
2. Выполнить команду:

```shell
docker compose up -d
```

Дождаться полной загрузки всех контейнеров

3. Выполнить команду:
```shell
./mongo-sharding-repl-init-configsrv.sh
```

4. Выполнить команду:
```shell
./mongo-sharding-repl-init.sh
```

5. Перейти на страницу http://localhost:8080 убедиться что:
- mongo_topology_type = "Sharded"
- массив shards содержит информацию о шардах: shard1 и shard2. Для каждого шарда указано три узла: один shard-primary и два shard-replica.
- в атрибуте documents_count коллекции helloDoc содержит информацию о кол-ве документов в коллекции >=1000