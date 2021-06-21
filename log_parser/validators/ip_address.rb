# frozen_string_literal: true

require_relative 'base'

module LogParser
  module Validators
    # ip address validator
    class IpAddress < Base
      # validates ip address
      def self.valid?(item = nil)
        return false unless item
        return false unless item.respond_to?(:ip_address)

        ip_address = item.ip_address
        ip_address&.match?(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/)
      end
    end
  end
end