class Mall < ApplicationRecord
    acts_as_mappable   
    
    has_many :orders
    has_and_belongs_to_many :stores

    # This is for populating the db with mall locations
    def self.populate
        self.create_location("Riocan Centre Burloak", "3543 Wyecroft Rd, Oakville, ON L6L 0B6")
        self.create_location("Oakville Place", "240 Leighland Ave, Oakville, ON L6H 3H6")
        self.create_location("Mapleview Centre", "900 Maple Ave, Burlington, ON L7S 2J8")
        self.create_location("Burlington Mall", "777 Guelph Line, Burlington, ON L7R 3N2")
    end

    # This is for populating the db with mall locations
    def self.create_location(name, address)
        coords = GEOCODER.geocode(address)
        mall = Mall.find_by(name: name)
        return unless mall.nil?
        Mall.create(name: name, address: address, lat: coords.lat, lng: coords.lng)
    end

    def self.find_by_address(address=nil)
        return nil if address.nil?
        location = GEOCODER.geocode(address)
        # this is ugly but works. Fix leater if you feel like it
        malls = Mall.within(20, :origin => location)
        return nil if malls.count == 0
        return malls.by_distance(:origin=>location)
    end

    def get_distance(address=nil)
        return nil if address.nil?
        location = GEOCODER.geocode(address)
        return self.distance_to(location)
    end

    def get_delivery_price(address=nil)
        return nil if address.nil?
        distance = self.get_distance(address)
        price = (distance * 1.5).round
        price = 5 if price < 5 
        price = 15 if price > 15
        price = price - 0.01
        return price
    end 

    def self.cap
        require 'selenium-webdriver'
        require 'nokogiri'
        require 'capybara'
        Capybara.register_driver :selenium do |app|  
            Capybara::Selenium::Driver.new(app, browser: :chrome)
        end
        Capybara.javascript_driver = :chrome
        Capybara.configure do |config|  
            config.default_max_wait_time = 10 # seconds
            config.default_driver = :selenium
        end
        # Visit
        browser = Capybara.current_session
        driver = browser.driver.browser

        browser.visit("https://avetty.com/")
    end

end
