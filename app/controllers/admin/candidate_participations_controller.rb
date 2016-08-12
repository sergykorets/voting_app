# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Candidate participation
# *
# * Author: 
# * Date  : 10. 8. 2016
# *
# *****************************************************************************

class Admin::CandidateParticipationsController < AdminController

	before_action :set_candidate
	before_action :set_candidate_participation, only: [:show, :edit, :update, :destroy]

	#
	# Show action
	#
	def show
		respond_to do |format|
			format.html { render "show" }
			format.json { render json: @candidate_participation.to_json }
		end
	end

	#
	# New action
	#
	def new
		@candidate_participation = CandidateParticipation.new(candidate_id: @candidate.id)
	end

	#
	# Edit action
	#
	def edit
	end

	#
	# Create action
	#
	def create
		@candidate_participation = CandidateParticipation.new(candidate_participation_params)
		@candidate_participation.candidate_id = @candidate.id
		if @candidate_participation.save
			respond_to do |format|
				format.html { redirect_to main_app.admin_candidate_candidate_participation_path(@candidate, @candidate_participation), notice: I18n.t("activerecord.notices.models.candidate_participation.create") }
				format.json { render json: @candidate_participation.id }
			end
		else
			respond_to do |format|
				format.html { render "new" }
				format.json { render json: @candidate_participation.errors }
			end
		end
	end

	#
	# Update action
	#
	def update
		if @candidate_participation.update(candidate_participation_params)
			respond_to do |format|
				format.html { redirect_to main_app.admin_candidate_candidate_participation_path(@candidate, @candidate_participation), notice: I18n.t("activerecord.notices.models.candidate_participation.update") }
				format.json { render json: @candidate_participation.id }
			end
		else
			respond_to do |format|
				format.html { render "edit" }
				format.json { render json: @candidate_participation.errors }
			end
		end
	end

	#
	# Destroy action
	#
	def destroy
		@candidate_participation.destroy
		respond_to do |format|
			format.html { redirect_to main_app.admin_candidate_path(@candidate_participation.candidate), notice: I18n.t("activerecord.notices.models.candidate_participation.destroy") }
			format.json { render json: @candidate_participation.id }
		end
	end

protected

	# *************************************************************************
	# Model setters
	# *************************************************************************

	def set_candidate
		@candidate = Candidate.find_by_id(params[:candidate_id])
		if @candidate.nil?
			redirect_to main_app.admin_candidates_path, alert: I18n.t("activerecord.errors.models.candidate.not_found")
		end
	end

	def set_candidate_participation
		@candidate_participation = CandidateParticipation.find_by_id(params[:id])
		if @candidate_participation.nil?
			redirect_to main_app.admin_candidates_path, alert: I18n.t("activerecord.errors.models.candidate_participation.not_found")
		end
	end

	# *************************************************************************
	# Param filters
	# *************************************************************************

	# 
	# Never trust parameters from the scary internet, only allow the white list through.
	#
	def candidate_participation_params
		params.require(:candidate_participation).permit(CandidateParticipation.permitted_columns)
	end

end
