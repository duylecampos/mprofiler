require 'spec_helper'
require 'csv'

describe Mprofiler::Processor do
    it 'verify processed tree format' do
        parser = Mprofiler::Parser.new './spec/fixtures/sample.csv'
        parsed_table = parser.parse
        processor = Mprofiler::Processor.new parsed_table
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
        parser = Mprofiler::Parser.new './spec/fixtures/sample.csv'
        parsed_table = parser.parse
        processor = Mprofiler::Processor.new parsed_table
        processed_data = processor.process
        expect(processed_data).to match({
            'local_cellphone' => 25.41, 
            'local_phone' => 2.99, 
            'long_distance_cellphone' => 14.0, 
            'long_distance_phone' => 8.25, 
            'sms' => 0.49, 
            'internet' => 19.59
        })
    end

end