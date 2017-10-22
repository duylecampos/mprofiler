require 'spec_helper'

describe Mprofiler::Configuration do
    it 'access default values' do
        c = Mprofiler::Configuration
        expect(c.config).to include('match_key', 'calc_key', 'patterns')
        expect(c.config['patterns']).to include('internet', 'sms', 'local_cellphone', 'local_phone', 'long_distance_cellphone', 'long_distance_phone')
    end

    it 'update config with update hash' do
        c = Mprofiler::Configuration
        c.configure({'match_key' => 'new_match_key'})
        expect(c.config['match_key']).not_to eq 'match_key'
        expect(c.config['match_key']).to eq 'new_match_key'
    end

    it 'update config with yaml file' do
        c = Mprofiler::Configuration
        c.configure_with('./spec/fixtures/config.yaml')
        expect(c.config['match_key']).to eq 'new_match_key'
        expect(c.config['patterns']['internet']).to eq '/new_internet_pattern/'
    end
end