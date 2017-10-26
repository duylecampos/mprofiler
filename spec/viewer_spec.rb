require 'spec_helper'
require 'csv'

describe Mprofiler::Viewer do
    it 'format data to show' do
        raw_data = {
            'local_cellphone' => 150,
            'local_phone' => 180,
            'long_distance_cellphone' => 100,
            'long_distance_phone' => 300,
            'sms' => 4,
            'internet' => 5.8989887,
        }
        data_to_display = Mprofiler::Viewer.format raw_data
        expect(data_to_display).to match({
            'local' => {
                'cellphone' => 2.5,
                'phone' => 3.0,
            },
            'long_distance' => {
                'cellphone' => 1.67,
                'phone' => 5.0,
            },
            'sms' => 4,
            'internet' => 5.9,
        })
    end
end