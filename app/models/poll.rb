# frozen_string_literal: true

# Model for Polls
class Poll < ApplicationRecord
  belongs_to :riding
  belongs_to :polling_location, optional: true

  validates :number, presence: true, uniqueness: { scope: :riding_id }

  before_destroy :find_polling_location

  after_destroy :destroy_empty_polling_location

  def find_polling_location
    @polling_location = polling_location
  end

  def destroy_empty_polling_location
    return unless @polling_location.polls.empty?

    @polling_location.destroy
  end
end
