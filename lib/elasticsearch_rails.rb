# See the Pagy documentation: https://ddnexus.github.io/pagy/extras/elasticsearch_rails
# encoding: utf-8
# frozen_string_literal: true

class Pagy

  module Elasticsearch
    module Model
      def pagy_search(query_or_payload, options={})
        [self, query_or_payload, options].tap do |args|
          args.define_singleton_method(:method_missing){|*a| args += a}
        end
      end
    end
  end

  # Add specialized backend methods to paginate ElasticsearchRails::Results
  module Backend ; private
    # Return Pagy object and items
    def pagy_elasticsearch_rails(search_args, vars={})
      vars = pagy_elasticsearch_rails_get_vars(vars)
      model, query_or_payload, options, *called = search_args
      options[:size] = vars[:items]
      options[:from] = options[:size] * (vars[:page].to_i - 1)
      response       = model.search(query_or_payload, options)
      vars[:count]   = response.raw_response['hits']['total']

      return Pagy.new(vars), called.empty? ? response : response.send(*called)
    end

    # Sub-method called only by #pagy_elasticsearch_rails: here for easy customization of variables by overriding
    def pagy_elasticsearch_rails_get_vars(vars)
      vars[:page]  ||= params[ vars[:page_param] || VARS[:page_param] ] || 1
      vars[:items] ||= VARS[:items]
      vars
    end

  end
end
