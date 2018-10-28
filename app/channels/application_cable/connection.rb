module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	# makes current_user method available to the channel and unauthenticated users are not able to broadcast their messages
  	identified_by :current_user

  	def connect
  		self.current_user = find_verified_user
  		logged.add_tags 'ActionCable', current_user.email
  	end

  	protected 

  	# check whether a user is authenticated with devise 
  	def find_verified_user
  		if verified_user = env['warden'].user
  			verified_user
  		else
  			reject_unauthorized_connection
  		end
  	end

  end
end
