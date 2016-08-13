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

class PublicController < ApplicationController

protected

	def set_election
		@election = Election.current
	end

end