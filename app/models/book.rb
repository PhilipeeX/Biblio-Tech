class Book < ApplicationRecord
  belongs_to :author

  validate :isbn_must_be_valid

  private

  def isbn_must_be_valid
    return if valid_isbn_10?(isbn) || valid_isbn_13?(isbn)
    errors.add(:isbn, "is not valid")
  end

  def valid_isbn_10?(number)
    return false unless number =~ /\A\d{9}[0-9X]\z/

    sum = 0
    number.chars.each_with_index do |char, index|
      sum += (char == 'X' ? 10 : char.to_i) * (10 - index)
    end
    sum % 11 == 0
  end

  def valid_isbn_13?(number)
    return false unless number =~ /\A\d{13}\z/

    sum = 0
    number.chars.each_with_index do |char, index|
      sum += char.to_i * (index.even? ? 1 : 3)
    end
    sum % 10 == 0
  end
end
