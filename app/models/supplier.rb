class Supplier < ApplicationRecord
  has_many :supplier_accounts
  has_many :parts
end
