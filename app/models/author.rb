require 'cpf_cnpj'
class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  validate :cpf_must_be_valid

  private

  def cpf_must_be_valid
    unless CPF.valid?(cpf)
      errors.add(:cpf, "cpf is not valid")
    end
  end
end
