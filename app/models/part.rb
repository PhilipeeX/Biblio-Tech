class Part < ApplicationRecord
  belongs_to :supplier
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, message: I18n.t('model.part.greater_than_or_equal_to') }
  has_and_belongs_to_many :assemblies

end
