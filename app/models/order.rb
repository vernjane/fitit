class Order < ApplicationRecord
    belongs_to :user
    has_many :items
    belongs_to :mall, optional: true

    def format_name
        return "#{fname} #{lname}"
    end

    def format_street_address
        if unit_number.nil? || unit_number.empty?
            return "#{street_address}"
        else
            return "#{unit_number} - #{street_address}"
        end
    end

    def format_city_province_postal
        return "#{city}, #{province}, #{postal}"
    end
end
