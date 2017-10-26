require 'spec_helper'
require 'csv'

describe Mprofiler::Processor do
    it 'verify processed tree format' do
        config = Mprofiler::Configuration.new
        parser = Mprofiler::Parser.new './spec/fixtures/sample.csv'
        parsed_table = parser.parse
        processor = Mprofiler::Processor.new parsed_table, config
        processed_data = processor.process
        expect(processed_data).to include(
            'local_cellphone',
            'local_phone',
            'long_distance_cellphone',
            'long_distance_phone',
            'sms',
            'internet'
        )
    end

    it 'assert processed value' do
        config = Mprofiler::Configuration.new
        parser = Mprofiler::Parser.new './spec/fixtures/sample.csv'
        parsed_table = parser.parse
        processor = Mprofiler::Processor.new parsed_table, config
        processed_data = processor.process
        expect(processed_data).to match({
            'local_cellphone' => 1621, 
            'local_phone' => 219, 
            'long_distance_cellphone' => 880, 
            'long_distance_phone' => 1405,
            'sms' => 2, 
            'internet' => 9.896830494140625
        })
    end

end