class Order < ApplicationRecord
    belongs_to :user
    has_many :items
    belongs_to :mall, optional: true
end
