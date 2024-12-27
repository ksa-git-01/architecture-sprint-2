# Задания 2, 3, 4

## Как запустить

1. Открыть терминал, перейти в папку проекта sharding-repl-cache
2. Выполнить команду:

```shell
docker compose up -d
```

Дождаться полной загрузки всех контейнеров

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
- атрибут cache_enabled = true

7. Перейти на страницу http://localhost:8080/docs
8. Найти в списке эндпоинт GET /{collection_name}/users
9. Запустить выполнение запроса к эндпоинту указав параметр имени коллекции = helloDoc
Убедиться что:
- второй и последующие вызовы эндпоинта выполняются значительно быстрее чем первый. <100мс

# Задания 1, 5, 6

Итоговая схема: 
https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1#G1eWbgMgXI1BwzZT7KpEQGrC4EfWEo9h87

И на свякий случай ссылка на сам файл:
https://drive.google.com/file/d/1eWbgMgXI1BwzZT7KpEQGrC4EfWEo9h87/view?usp=sharing 