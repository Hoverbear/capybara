# frozen_string_literal: true
module Capybara
  module Queries
    class AncestorQuery < MatchQuery
      # @api private
      def resolve_for(node, exact = nil)
        node.synchronize do
          match_results = super(node.session.current_scope, exact)
          node.all(:xpath, XPath.ancestor) do |el|
            match_results.include?(el)
          end
        end
      end
    end
  end
end
