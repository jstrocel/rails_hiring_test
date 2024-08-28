class Riding < ApplicationRecord
  has_many :polls, dependent: :destroy
  has_many :polling_locations, dependent: :destroy
  accepts_nested_attributes_for :polling_locations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :polls, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :riding_code, presence: true
  validates :province, presence: true
end
