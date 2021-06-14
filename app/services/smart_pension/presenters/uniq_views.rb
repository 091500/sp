# frozen_string_literal: true

module SmartPension
  module Presenters
    # presents page views
    class UniqViews < Base
      # returns formatted data
      def show
        @data.map { |key, value| "#{key} #{value.count} unique views" }.join("\n")
      end
    end
  end
end
