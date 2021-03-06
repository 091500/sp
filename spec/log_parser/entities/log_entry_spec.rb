# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../log_parser/entities/log_entry'

RSpec.describe LogParser::Entities::LogEntry do
  context '#valid?' do
    context 'when page_path is valid and ip_address is not valid' do
      it 'returns false' do
        expect(described_class.new('/page_path', 'ip_address').valid?).to be_falsey
      end
    end

    context 'when page_path is not valid and ip_address is valid' do
      it 'returns false' do
        expect(described_class.new('page_path', '1.2.3.4').valid?).to be_falsey
      end
    end

    context 'when page_path and ip_address are valid' do
      it 'returns true' do
        expect(described_class.new('/page_path', '1.2.3.4').valid?).to be_truthy
      end
    end
  end
end
