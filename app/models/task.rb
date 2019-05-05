require 'prime'

class Task < ApplicationRecord
  validates :digit, presence: true

  def compute_factorization
    update_column(:result, prime_factorization.to_s)
  end

  private

  def prime_factorization
    Prime.prime_division(digit).flat_map do |factor, power|
      [factor] * power
    end
  end
end
