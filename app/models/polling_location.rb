# frozen_string_literal: true

# Model for Polling Locations
class PollingLocation < ApplicationRecord
  belongs_to :riding
  has_many :polls, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: { scope: %i[city postal_code] }
  validates :city, presence: true, uniqueness: { scope: %i[address postal_code] }
  validates :postal_code, presence: true, uniqueness: { scope: %i[city address] }
  validate :validate_postal_code

  after_validation :format_postal_code

  def format_postal_code
    self.postal_code = postal_code.upcase.scan(/[A-Z0-9]/).insert(3, ' ').join if postal_code.present?
  end

  def validate_postal_code
    postal_code_pattern = /[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJ-NPRSTV-Z] ?\d[ABCEGHJ-NPRSTV-Z]\d/
    return if postal_code.present? && postal_code_pattern.match?(postal_code.upcase)

    errors.add(:postal_code, 'must be valid')
  end
end
