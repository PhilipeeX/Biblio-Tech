class Supplier < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :parts, dependent: :destroy
end
