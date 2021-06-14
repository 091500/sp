# frozen_string_literal: true

module SmartPension
  module Validators
    class Base
      def self.valid?(_item)
        raise 'Not implemented'
      end
    end
  end
end
