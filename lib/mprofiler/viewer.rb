module Mprofiler
    class Viewer
        def self.format(data)
            tree = { 
                'local' => {
                    'cellphone' => prepare_data(data['local_cellphone']),
                    'phone' => prepare_data(data['local_phone']),
                }, 
                'long_distance' => {
                    'cellphone' => prepare_data(data['long_distance_cellphone']),
                    'phone' => prepare_data(data['long_distance_phone']),
                }, 
                'sms' => prepare_data(data['sms']),
                'internet' => prepare_data(data['internet']),
            }
        end

    private 
        def self.prepare_data(data)
            data.round(2)
        end
    end
end