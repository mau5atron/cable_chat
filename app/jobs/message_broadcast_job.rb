class MessageBroadCastJob < ApplicationJob
	queue_as :default

	# perform does the broadcasting, and then send html markup data from the _message partial
	def perform(message)
		ActionCable.server.broadcast "chat_rooms_#{message.chat_room.id}_channel", message: render_message(message)
	end

	private 

	def render_message(message)
		MessagesController.render partial: 'messages/message', locals: {message: message}
	end
end