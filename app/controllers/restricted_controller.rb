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

end