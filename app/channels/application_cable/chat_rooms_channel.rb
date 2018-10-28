class ChatRoomsChannel < ApplicationCable::ChatRoomsChannel
	def subscribed
		stream_from "chat_rooms_#{params['chat_room_id']}_channel"
		# subscribed, special method to start streaming from a channel
		# with a given name
		# the chat_room_id: messages.data('chat-room-id') from rooms.coffee
		# will be fetched inside the subscribed method by calling params['chat_room_id']
	end

	def unsubscribed
		# cleanup is done when channel is unsubscribed
		# this method fires when the streaming is stopped 
	end

	def send_message(data)
		# process data sent from the page	
		# fires when '@perform 'send_message, message: message, chat_room_id: chat_room_id' from the cs
		current_user.messages.create!(body: data['message'], chat_room_id: data['chat_room_id'])
	end
end