# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Abstract engine controller
# *
# * Author: Matěj Outlý
# * Date  : 9. 6. 2015
# *
# *****************************************************************************

module RicUser
	class AdminController < RicAdmin::ApplicationController

		#
		# Controller authorization
		#
		before_action do
			authorize :admin, :show?
		end

	end
end