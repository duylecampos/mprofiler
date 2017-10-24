require 'yaml'
require 'psych'

module Mprofiler
    class Configuration
        DEFAULTS = {
            'match_key' => 'Servico',
            'calc_key' => 'Valor',
            'patterns' => {
                'internet' => /Internet/,
                'sms' => /SMS/,
                'local_cellphone' => /Chamadas Locais para Celulares/,
                'local_phone' => /Locais para Fixo/,
                'long_distance_cellphone' => /Longa Distância para Celulares/,
                'long_distance_phone' => /Longa Distância para Fixo/
            },
        }
   
        @config = DEFAULTS

        # Configure through hash
        def self.configure(opts = {})
            opts.each {|k,v| @config[k] = v}
        end

        # Configure through yaml file
        def self.configure_with(path_to_yaml_file)
            begin
                config = YAML::load(IO.read(path_to_yaml_file))
            rescue Errno::ENOENT
                puts 'YAML configuration file couldn\'t be found. Using defaults.'; return
            rescue Psych::SyntaxError
                puts 'YAML configuration file contains invalid syntax. Using defaults.'; return
            end
            configure(config)
        end

        def self.config
            @config
        end
        # end
    end

end