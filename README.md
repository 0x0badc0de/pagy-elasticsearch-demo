# pagy-elasticsearch-demo

Demo of ElasticSearch usage with Pagy (https://github.com/ddnexus/pagy)

Search for 'random1', 'random2' or 'random3' to search through notes including those strings randomly. Or for 'some', 'common' or 'text' which are included into every note.

## Running with Docker Compose

1. Run `docker-compose run --rm web 'bundle install && rails db:reset'`
2. Run `docker-compose up`
3. Open http://localhost:3000/

## Running locally

1. Have ElasticSearch and PostgreSQL installed.
2. Configure environment variables APP_DATABASE_HOST, APP_DATABASE_USER, APP_DATABASE_PASSWORD, APP_ELASTICSEARCH_HOST and APP_ELASTICSEARCH_PORT with proper values.
3. Run `bundle install && rails db:reset`.
4. Run `rails s`.
5. Open http://localhost:3000/
