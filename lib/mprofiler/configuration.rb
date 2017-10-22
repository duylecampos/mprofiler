require 'yaml'
require 'psych'

module Mprofiler
    class Configuration
        DEFAULTS = {
            "match_key" => "Tpserv",
            "calc_key" => 'Valor',
            "patterns" => {
                "internet" => /Wap/,
                "sms" => /SMS/,
                "local_cellphone" => /Locais para Celulares/,
                "local_phone" => /Locais para Fixo/,
                "long_distance_cellphone" => /Longa Distância/,
                "long_distance_phone" => /Longa Distância Fixo/
            },
        }

        # class << self        
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
                puts "YAML configuration file couldn't be found. Using defaults."; return
            rescue Psych::SyntaxError
                puts "YAML configuration file contains invalid syntax. Using defaults."; return
            end
            configure(config)
        end

        def self.config
            @config
        end
        # end
    end

end