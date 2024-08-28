class PollingLocation < ApplicationRecord
  belongs_to :riding
  has_many :polls, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: {scope: [:city, :postal_code]}
  validates :city, presence: true, uniqueness: {scope: [:address, :postal_code]}
  validates :postal_code, presence: true, uniqueness: {scope: [:city, :address]}
  validate :validate_postal_code
  
  after_validation :format_postal_code

  def format_postal_code
    self.postal_code = self.postal_code.upcase.scan(/[A-Z0-9]/).insert(3, ' ').join if self.postal_code.present?
  end

  def validate_postal_code
    unless self.postal_code.present? && /[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJ-NPRSTV-Z][ ]?\d[ABCEGHJ-NPRSTV-Z]\d/.match?(self.postal_code.upcase)
      errors.add(:postal_code, "must be valid")
    end
  end

end
