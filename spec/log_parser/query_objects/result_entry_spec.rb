# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../log_parser/query_objects/result_entry'

RSpec.describe LogParser::QueryObjects::ResultEntry do
  include_context 'log_entries'

  context 'params has sort_desc = true' do
    let(:params) { { sort_desc: true } }

    it 'sorts desc by total page views' do
      data = double('Data')
      allow(data).to receive(:uniq_pages) do
        {
          '/path/1' => %w[1.2.3.4 1.2.3.4 1.2.3.5],
          '/path/2' => %w[1.2.3.4],
          '/path/3' => %w[1.2.3.4 1.2.3.5 1.2.3.6]
        }
      end

      expected = {
        '/path/3' => %w[1.2.3.4 1.2.3.5 1.2.3.6],
        '/path/1' => %w[1.2.3.4 1.2.3.4 1.2.3.5],
        '/path/2' => %w[1.2.3.4]
      }

      expect(described_class.new(data.uniq_pages).call(params)).to eq(expected)
    end

    it 'sorts desc by uniq page views' do
      data = double('Data')
      allow(data).to receive(:uniq_views) do
        {
          '/path/1' => %w[1.2.3.4 1.2.3.5],
          '/path/2' => %w[1.2.3.4],
          '/path/3' => %w[1.2.3.4 1.2.3.5 1.2.3.6]
        }
      end

      expected = {
        '/path/3' => %w[1.2.3.4 1.2.3.5 1.2.3.6],
        '/path/1' => %w[1.2.3.4 1.2.3.5],
        '/path/2' => %w[1.2.3.4]
      }

      expect(described_class.new(data.uniq_views).call(params)).to eq(expected)
    end
  end

  context 'params has not sort_desc option' do
    let(:params) { {} }

    it 'does not sort' do
      data = double('Data')
      allow(data).to receive(:uniq_pages) do
        {
          '/path/1' => %w[1.2.3.4 1.2.3.4 1.2.3.5],
          '/path/2' => %w[1.2.3.4],
          '/path/3' => %w[1.2.3.4 1.2.3.5 1.2.3.6]
        }
      end

      expected = {
        '/path/1' => %w[1.2.3.4 1.2.3.4 1.2.3.5],
        '/path/2' => %w[1.2.3.4],
        '/path/3' => %w[1.2.3.4 1.2.3.5 1.2.3.6]
      }
      expect(described_class.new(data.uniq_pages).call(params)).to eq(expected)
    end
  end
end
