require 'spec_helper'
require 'csv'

describe Mprofiler::Viewer do
    it 'format data to show' do
        raw_data = {
            'local_cellphone' => 0,
            'local_phone' => 1.9859,
            'long_distance_cellphone' => 2.485,
            'long_distance_phone' => 3,
            'sms' => 4,
            'internet' => 5,
        }
        data_to_display = Mprofiler::Viewer.format raw_data
        expect(data_to_display).to match({
            'local' => {
                'cellphone' => 0,
                'phone' => 1.99,

            },
            'long_distance' => {
                'cellphone' => 2.49,
                'phone' => 3,
            },
            'sms' => 4,
            'internet' => 5,
        })
    end
end