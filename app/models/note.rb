require 'elasticsearch/model'

class Note < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  extend Pagy::Elasticsearch::Model
end
