module Mprofiler

    class Processor
        attr_accessor :datatable, :tree

        def initialize(datatable)
            @datatable = datatable
            @tree = { 
                "local_cellphone" => 0, 
                "local_phone" => 0, 
                "long_distance_cellphone" => 0, 
                "long_distance_phone" => 0,
                "sms" => 0, 
                "internet" => 0
            }
        end

        def process
            datatable.each do |row|
                process_row row
            end
            tree
        end

    private

        def process_row(row)
            Configuration::config['patterns'].each do |name, pattern|
                if row[Configuration::config['match_key']] =~ pattern
                    populate_tree(name, row[Configuration::config['calc_key']])
                end
            end
        end

        def populate_tree(node, value)
            tree[node] += value.gsub(',', '.').to_f
        end
    end
end