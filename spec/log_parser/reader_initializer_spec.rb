# frozen_string_literal: true

require 'ostruct'
require_relative '../spec_helper'
require_relative '../../log_parser/reader_initializer'
require_relative '../../log_parser/entities/log_entry'

RSpec.describe LogParser::ReaderInitializer do
  let(:file_path) { File.join(File.dirname(__FILE__), '../fixtures/webserver.log').to_s }

  context 'when reader is supported' do
    it 'yields valid LogEntry instances on #each' do
      result = described_class.new(file_path).each { |entry| entry }

      expect(result).to be_a(Array)
      expect(result.size).to eq(13)
      expect(result).to all(be_kind_of(LogParser::Entities::LogEntry))
    end
  end
end
