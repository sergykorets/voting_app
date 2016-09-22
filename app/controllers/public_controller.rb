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
		if @election.nil?
			redirect_to main_app.root_path, alert: I18n.t("activerecord.errors.models.election.not_found")
		end
	end

	def check_election_votability
		if !@election.votable?
			redirect_to main_app.root_path, alert: I18n.t("activerecord.errors.models.election.not_votable")
		end
	end

end