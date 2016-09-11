# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Abstract engine controller
# *
# * Author: Matěj Outlý
# * Date  : 5. 5. 2015
# *
# *****************************************************************************

class AdminController < ApplicationController

	#**************************************************************************
	# Layout
	#**************************************************************************

	#
	# Layout
	#
	layout "ric_admin"

	#
	# Title component
	#
	component RicAdmin::TitleComponent

	#
	# Header logo component
	#
	component RicAdmin::HeaderLogoComponent

	#
	# Header menu component
	#
	component RicAdmin::HeaderMenuComponent
	
	#
	# Footer menu component
	#
	component RicAdmin::FooterMenuComponent

	#
	# Footer copy component
	#
	component RicAdmin::FooterCopyComponent

	#
	# Authenticate before every action
	#
	before_action :authenticate_user!

	#
	# Controller authorization
	#
	before_action do
		authorize :admin, :show?
	end

protected
	
	# *************************************************************************
	# Model setters
	# *************************************************************************

	def set_election
		@election = Election.find_by_id(params[:election_id])
		if @election.nil?
			redirect_to main_app.admin_elections_path, alert: I18n.t("activerecord.errors.models.election.not_found")
		end
	end

	def set_candidate
		@candidate = Candidate.find_by_id(params[:candidate_id])
		if @candidate.nil?
			redirect_to main_app.admin_candidates_path, alert: I18n.t("activerecord.errors.models.candidate.not_found")
		end
	end

	def set_election_part
		@election_part = ElectionPart.find_by_id(params[:election_part_id])
		if @election_part.nil?
			redirect_to main_app.admin_elections_path, alert: I18n.t("activerecord.errors.models.election_part.not_found")
		end
	end

end
