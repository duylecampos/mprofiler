require 'yaml'
require 'psych'

module Mprofiler
    class Configuration

        def initialize
            @config = {
                'match_key' => 'Tpserv',
                'calc_key' => 'Duração',
                'keys' => {
                    'internet' => {
                        'pattern' => /(TIM Connect Fast|TIM Wap Fast|BlackBerry Professional - MB)/,
                        'process_method' => 'sum_bytes'
                    },
                    'sms' => {
                        'pattern' => /SMS/,
                        'process_method' => 'count_occurrences'
                    },
                    'local_cellphone' => {
                        'pattern' => /Locais.*Celulares/,
                        'process_method' => 'sum_minutes'
                    },
                    'local_phone' => {
                        'pattern' => /Locais.*Fixos/,
                        'process_method' => 'sum_minutes'
                    },
                    'long_distance_cellphone' => {
                        'pattern' => /Longa Distância.*Celulares/,
                        'process_method' => 'sum_minutes'
                    },
                    'long_distance_phone' => {
                        'pattern' => /Longa Distância/,
                        'process_method' => 'sum_minutes'
                    },
                },
            }
        end

        # Configure through hash
        def configure(opts = {})
            opts.each {|k,v| @config[k] = v}
        end

        # Configure through yaml file
        def configure_with(path_to_yaml_file)
            begin
                config = YAML::load(IO.read(path_to_yaml_file))
            rescue Errno::ENOENT
                puts 'YAML configuration file couldn\'t be found. Using defaults.'; return
            rescue Psych::SyntaxError
                puts 'YAML configuration file contains invalid syntax. Using defaults.'; return
            end
            configure(config)
        end

        def config
            @config
        end
        # end
    end

end