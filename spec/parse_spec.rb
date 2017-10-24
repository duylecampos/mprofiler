require 'spec_helper'
require 'csv'

describe  Mprofiler::Parser do
    it "return a csv table" do
        p = Mprofiler::Parser.new './spec/fixtures/sample.csv'
        expect(p.parse).to be_a CSV::Table
    end
end