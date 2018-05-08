class SearchedLocation < ApplicationRecord
  belongs_to :user, optional: true
end
