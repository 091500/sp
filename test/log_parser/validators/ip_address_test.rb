# frozen_string_literal: true

require_relative '../../test_helper'
require 'minitest/autorun'
require_relative '../../../log_parser/validators/ip_address'

module LogParser
  module Validators
    class IpAddressTest < Minitest::Test
      def test_valid_when_item_is_absent
        assert_equal(false, IpAddress.valid?)
      end

      def test_valid_when_item_does_not_respond_to_ip_address
        assert_equal(false, IpAddress.valid?('test'))
      end

      def test_valid_when_ip_address_absent
        assert_equal(false, IpAddress.valid?(''))
      end

      def test_valid_when_ip_address_does_not_match_pattern
        assert_equal(false, IpAddress.valid?('test'))
      end

      def test_valid_when_ip_address_matches_pattern
        assert IpAddress.valid?('1.2.3.4')
      end
    end
  end
end
