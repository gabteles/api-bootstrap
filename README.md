```
docker-compose up -d
docker-compose exec web bundle install
docker-compose exec web shotgun -o 0.0.0.0 config.ru
```
