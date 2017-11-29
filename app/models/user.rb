class User < ApplicationRecord
  ATTENDEE_STRING  = "attendee"
  MODERATOR_STRING = "moderator"

  def is_attendee?
    role.to_s.downcase == ATTENDEE_STRING
  end

  def is_moderator?
    role.to_s.downcase == MODERATOR_STRING
  end

  has_many :questions
  has_many :votes

  validates :email, uniqueness: true,
                    presence: true
end
