require 'csv'

module Mprofiler

    class Parser
        def initialize(filename)
            @filename = filename
        end

        def parse
            csv_text = File.read(@filename)
            CSV.parse(csv_text, :headers => true, :col_sep => ';')
        end 
    end
end