# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Root
# *
# * Author: Matěj Outlý
# * Date  : 20. 5. 2016
# *
# *****************************************************************************

class HomepageController < ApplicationController

	def index
		@candidate_participations = CandidateParticipation.all
	end

end
