module Mprofiler

    class Processor
        attr_accessor :datatable, :tree, :configuration

        def initialize(datatable, configuration)
            @datatable = datatable
            @configuration = configuration
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
            configuration.config['keys'].each do |key, data|
                if row[configuration.config['match_key']] =~ data['pattern']
                    populate_tree(key, row[configuration.config['calc_key']], data['process_method'])
                end
            end
        end

        def populate_tree(node, value, process_method)
            if process_method == 'count_occurrences'
                tree[node] += 1
            elsif process_method == 'sum_bytes'
                tree[node] += process_internet_consume value
            elsif process_method == 'sum_minutes'
                tree[node] += process_call_consume value
            end
        end

        def process_internet_consume(string)
            value = string.gsub(',', '.')[0..-4].to_f
            if string[-2..-1] == 'KB'
                value = value / 1024
            elsif string[-2..-1] == 'MB'
                value = value
            elsif string[-2..-1] == 'GB'
                value = value * 1024
            end
            value
        end

        def process_call_consume(string)
            minutes, seconds = string[0..-2].split('m')
            minutes.to_i * 60 + seconds.to_i
        end
    end
end