class Assembly < ApplicationRecord
  has_one :book
  has_and_belongs_to_many :parts
  accepts_nested_attributes_for :parts
  accepts_nested_attributes_for :book
end
