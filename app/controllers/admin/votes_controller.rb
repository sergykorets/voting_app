# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Votes
# *
# * Author: 
# * Date  : 29. 8. 2016
# *
# *****************************************************************************

class Admin::VotesController < AdminController

	before_action :set_vote, only: [:destroy]

	#
	# Destroy action
	#
	def destroy
		@vote.destroy
		respond_to do |format|
			format.html { redirect_to main_app.admin_voter_path(@vote.voter), notice: I18n.t("activerecord.notices.models.vote.destroy") }
			format.json { render json: @vote.id }
		end
	end

protected

	# *************************************************************************
	# Model setters
	# *************************************************************************

	#
	# Set model
	#
	def set_vote
		@vote = Vote.find_by_id(params[:id])
		if @vote.nil?
			redirect_to main_app.admin_voters_path, alert: I18n.t("activerecord.errors.models.vote.not_found")
		end
	end

end