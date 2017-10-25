module Mprofiler
    class Viewer
        def self.format(data)
            tree = { 
                'local' => {
                    'cellphone' => prepare_data(data['local_cellphone'], format='minutes'),
                    'phone' => prepare_data(data['local_phone'], format='minutes'),
                }, 
                'long_distance' => {
                    'cellphone' => prepare_data(data['long_distance_cellphone'], format='minutes'),
                    'phone' => prepare_data(data['long_distance_phone'], format='minutes'),
                }, 
                'sms' => prepare_data(data['sms'], format=false),
                'internet' => prepare_data(data['internet']),
            }
        end

    private 
        def self.prepare_data(data, format=nil)
            if format == false
                return data
            end
            data = data.to_f
            if format == 'minutes'
                data = data / 60
            end
            data.round(2)
        end
    end
end