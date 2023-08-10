class Supplier < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :parts, dependent: :destroy

  validate :cnpj_must_be_valid


  private

  def cnpj_must_be_valid
    return if cnpj.blank?

    return if valid_cnpj?(cnpj)

    errors.add(:cnpj, 'não é válido')
  end

  def valid_cnpj?(cnpj)
    cnpj = cnpj.scan(/[0-9]/).join

    return false unless cnpj.length == 14
    return false if cnpj.chars.uniq.length == 1

    first_digit = calculate_digit(cnpj[0..11], [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2])
    second_digit = calculate_digit(cnpj[0..12], [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2])

    cnpj[12].to_i == first_digit && cnpj[13].to_i == second_digit
  end

  def calculate_digit(numbers, weights)
    sum = 0

    numbers.chars.each_with_index do |number, index|
      sum += number.to_i * weights[index]
    end

    mod = sum % 11
    mod < 2 ? 0 : 11 - mod
  end
end
