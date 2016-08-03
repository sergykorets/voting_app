# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Common features of application controllers
# *
# * Author: Matěj Outlý
# * Date  : 11. 6. 2015
# *
# *****************************************************************************

class ApplicationController < ActionController::Base
	
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	#**************************************************************************
	# Authentication
	#**************************************************************************

	def authenticate_user!
		if user_signed_in?
			super
		else
			store_location_for(:user, request.path)
			redirect_to ric_devise.new_user_session_path
		end
	end

	def after_sign_out_path_for(resource)
		main_app.admin_root_path
	end

	def after_sign_in_path_for(resource)
		stored_location_for(:user) || main_app.admin_root_path
	end

end
