class Message < ApplicationRecord
  validates :direct_message, presence: true
  belongs_to :customer
  belongs_to :room
end
