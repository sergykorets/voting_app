# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Abstract engine controller
# *
# * Author: Matěj Outlý
# * Date  : 12. 7. 2016
# *
# *****************************************************************************

class RestrictedController < ApplicationController

	#
	# Authenticate before every action
	#
	before_action :authenticate_user!

protected

	def set_election
		@election = Election.current
	end

	def set_voter
		@voter = current_user.voter
		if @voter.nil?
			#redirect_to ric_devise.new_user_session_path
			@voter = Voter.last
		end
	end
	
end