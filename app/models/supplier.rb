class Supplier < ApplicationRecord
  has_many :accounts
  has_many :parts
end
