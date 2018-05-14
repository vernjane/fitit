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

    def self.calculate_avalable_time(t=nil)
        available_times = []
        t = Time.zone.now() if t.nil?
        puts "Time now: #{t}"
    
        # Let's assume all malls open at 10, and close at 8 on weekdays and 5 on weekends
        open_hour = (10 + 4)
        close_hour = (t.saturday? || t.sunday? ? 17 : 20) + 4
    
        puts "open_hour: #{open_hour}"
        puts "close_hour: #{close_hour}"
        
        open_t = Time.new(t.year, t.month, t.day, open_hour, 0, 0, 0).in_time_zone
        close_t = Time.new(t.year, t.month, t.day, close_hour, 0, 0, 0).in_time_zone
        
        puts "open_t: #{open_t}"
        puts "close_t: #{close_t}"
        
        # So earliest delivery will be 13-14; latest delivery will be 9-10(weekdays) or 6-7(weekends)
        
        # let's round current time to deal with whole numbers
        t = (t + 30.minutes).beginning_of_hour
        puts "rounded time: #{t}"

        if (t < open_t)
          earliest_delivery = open_t + 3.hours
        else 
          earliest_delivery = t + 3.hours
        end

        puts "earliest_delivery: #{earliest_delivery}"
    
        latest_delivery = close_t + 1.hour

        puts "latest_delivery: #{latest_delivery}"
    
        if earliest_delivery > latest_delivery
          puts "earliest later than latest"
          return nil
        end
    
        if latest_delivery - t < 3.hours
            puts "less than 3 hours till closing"
          return nil
        end
    
        while earliest_delivery <= latest_delivery
          available_times.push("#{earliest_delivery.hour}")  
          earliest_delivery = earliest_delivery + 1.hour
        end  
    
        return available_times

      end

      def self.time_for_display(time) 
        case time
            when "9"
                "9:00AM-10:00AM"
            when "10"
                "10:00AM-11:00AM"
            when "11"
                "11:00AM-12:00PM"
            when "12"
                "12:00PM-1:00PM"
            when "13"
                "1:00PM-2:00PM"
            when "14"
                "2:00PM-3:00PM"
            when "15"
                "3:00PM-4:00PM"
            when "16"
                "4:00PM-5:00PM"
            when "17"
                "5:00PM-6:00PM"
            when "18"
                "6:00PM-7:00PM"
            when "19"
                "7:00PM-8:00PM"
            when "20"
                "8:00PM-9:00PM"
            when "21"
                "9:00PM-10:00PM"

        end
    end

    

end
