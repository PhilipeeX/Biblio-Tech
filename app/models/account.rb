class Account < ApplicationRecord
  belongs_to :supplier
  validate :digit_should_be_valid

  def digit_should_be_valid
    errors.add(:digit, "is invalid") unless calculate_digit_mod11 == 'digit valid'
  end

  def calculate_digit_mod11
    weight_sequence = [2, 3, 4, 5, 6, 7, 8, 9]
    weight_index = 0
    sum = 0

    self.number.reverse.each_char do |char|
      sum += char.to_i * weight_sequence[weight_index]
      weight_index = (weight_index + 1) % weight_sequence.length
    end

    result = (sum * 10) % 11
    result = 'X' if result == 10

    if self.digit.to_s == result.to_s
      'digit valid'
    else
      'digit invalid'
    end
  end

end