class Message < ApplicationRecord
  belongs_to :chatroom

  validates :content, presence: true
  validates :user_name, presence: true  # Optional if you want to require the user name
end
