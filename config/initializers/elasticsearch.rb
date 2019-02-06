Elasticsearch::Model.client = Elasticsearch::Client.new host: ENV.fetch('APP_ELASTICSEARCH_HOST', 'elastic'), port: ENV.fetch('APP_ELASTICSEARCH_HOST', 9200).to_i, log: true
