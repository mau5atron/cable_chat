class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :body, presence: true, length: {minumum: 2, maximum: 1000}

  # create background job after message is saved to db
  after_create_commit { MessageBroadcastJob.perform_later(self) }
  # self is a saved message
  def timestamp
  	created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
