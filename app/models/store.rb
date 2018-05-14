class Store < ApplicationRecord
    has_and_belongs_to_many :malls

    def self.populate
        self.create_store("aldo.png", "Aldo")
        self.create_store("aeo.png", "American Eagle Outfitters")
        self.create_store("dynamite.png", "Dynamite")
        self.create_store("footlocker.png", "Foot Locker")
        self.create_store("garage.png", "Garage")
        self.create_store("gap.png", "GAP")
        self.create_store("cleo.png", "Cleo")
        self.create_store("clarks.png", "Clarks")
        self.create_store("geox.png", "Geox")
        self.create_store("hm.png", "H&M")
        self.create_store("lasenza.png", "La Senza")
        self.create_store("laura.png", "Laura")
        self.create_store("melanielyne.png", "Melanie Lyne")
        self.create_store("northernreflections.png", "Northern Reflections")
        self.create_store("reitmans.png", "Reitmans")
        self.create_store("rwco.png", "RW&CO")
        self.create_store("softmoc.png", "SoftMoc")
        self.create_store("spring.png", "Call It Spring")
        self.create_store("thyme.png", "Thyme Maternity")
        self.create_store("victoriasecret.png", "Victoria's Secret")
        self.create_store("pink.png", "Pink")
        self.create_store("carters.png", "Carter's OshKosh")
        self.create_store("guess.png", "Guess")
    end

    def self.join_malls_with_stores
        self.join_mall_with_stores("Oakville Place", [
            "Aldo", 
            "American Eagle Outfitters", 
            "Foot Locker", 
            "Garage",
            "H&M",
            "Laura",
            "Melanie Lyne",
            "Northern Reflections",
            "RW&CO",
            "SoftMoc" 
        ])

        self.join_mall_with_stores("Mapleview Centre", [
            "Aldo",
            "American Eagle Outfitters",
            "Dynamite",
            "Foot Locker",
            "Garage",
            "GAP",
            "Cleo",
            "Clarks",
            "Geox",
            "H&M",
            "La Senza",
            "Laura",
            "Melanie Lyne",
            "Northern Reflections",
            "RW&CO",
            "SoftMoc",
            "Call It Spring",
            "Victoria's Secret",
            "Pink",
        ])

        self.join_mall_with_stores("Riocan Centre Burloak", [
            "Dynamite",
            "Thyme Maternity",
            "Carter's OshKosh",
            "Guess"
        ])

        self.join_mall_with_stores("Burlington Mall", [
            "Cleo",
            "Northern Reflections",
            "Reitmans",
            "SoftMoc",
        ])
            # For future

            # "Aldo"
            # "American Eagle Outfitters",
            # "Dynamite",
            # "Foot Locker",
            # "Garage",
            # "GAP",
            # "Cleo",
            # "Clarks",
            # "Geox",
            # "H&M",
            # "La Senza",
            # "Laura",
            # "Melanie Lyne",
            # "Northern Reflections",
            # "Reitmans",
            # "RW&CO",
            # "SoftMoc",
            # "Call It Spring",
            # "Thyme Maternity",
            # "Victoria's Secret",
            # "Pink",
            # "Carter's OshKosh",
            # "Guess"
    end

    def self.join_mall_with_stores(mall_name, stores_names)
        mall = Mall.find_by(name: mall_name)
        stores_names.each do |store_name|
            store = Store.find_by(name: store_name)
            mall.stores << store unless mall.stores.include?(store)
        end
    end

    # This is for populating the db with mall locations
    def self.create_store(logo, name)
        mall = Store.find_by(name: name)
        return unless mall.nil?
        Store.create(name: name, logo:logo)
    end

end
