class Assembly < ApplicationRecord
  has_one :book
  has_and_belongs_to_many :parts
end
