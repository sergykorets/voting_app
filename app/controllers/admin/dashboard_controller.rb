# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Dashboard
# *
# * Author: Matěj Outlý
# * Date  : 10. 6. 2016
# *
# *****************************************************************************

class Admin::DashboardController < AdminController

	#
	# Authenticate before every action
	#
	before_action :authenticate_user!
	
	def index
	end

end
