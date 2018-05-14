class Store < ApplicationRecord
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

    # This is for populating the db with mall locations
    def self.create_store(logo, name)
        mall = Store.find_by(name: name)
        return unless mall.nil?
        Store.create(name: name, logo:logo)
    end

end
