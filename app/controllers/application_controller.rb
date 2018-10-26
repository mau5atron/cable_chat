class ApplicationController < ActionController::Base
	# restricting access to all pages of the site to authenticated users only 
	before_action :authenticate_user!
end
