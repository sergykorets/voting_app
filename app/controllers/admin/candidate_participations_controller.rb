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

	before_action :set_candidate_participation, only: [:show, :edit, :update, :destroy]

	#
	# Index action
	#
	def index
		@filter_candidate_participation = CandidateParticipation.new(load_params_from_session)
		@candidate_participations = CandidateParticipation.filter(load_params_from_session.symbolize_keys).sorting(params[:sort]).page(params[:page]).per(50)
		respond_to do |format|
			format.html { render "index" }
			format.json { render json: @candidate_participations.to_json }
		end
	end

	#
	# Filter action
	#
	def filter
		save_params_to_session(filter_params)
		redirect_to main_app.admin_candidate_participations_path
	end

	#
	# Search action
	#
	def search
		@candidate_participations = CandidateParticipation.search(params[:q]).order(id: :asc)
		respond_to do |format|
			format.html { render "index" }
			format.json { render json: @candidate_participations.to_json }
		end
	end

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
		@candidate_participation = CandidateParticipation.new
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
		if @candidate_participation.save
			respond_to do |format|
				format.html { redirect_to main_app.admin_candidate_participation_path(@candidate_participation), notice: I18n.t("activerecord.notices.models.candidate_participation.create") }
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
				format.html { redirect_to main_app.admin_candidate_participation_path(@candidate_participation), notice: I18n.t("activerecord.notices.models.candidate_participation.update") }
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
			format.html { redirect_to main_app.admin_candidate_participations_path, notice: I18n.t("activerecord.notices.models.candidate_participation.destroy") }
			format.json { render json: @candidate_participation.id }
		end
	end

protected

	# *************************************************************************
	# Model setters
	# *************************************************************************

	#
	# Set model
	#
	def set_candidate_participation
		@candidate_participation = CandidateParticipation.find_by_id(params[:id])
		if @candidate_participation.nil?
			redirect_to main_app.admin_candidate_participations_path, alert: I18n.t("activerecord.errors.models.candidate_participation.not_found")
		end
	end

	# *************************************************************************
	# Session
	# *************************************************************************

	#
	# Get session key unique for the controller
	#
	def session_key
		return "candidate_participations"
	end

	#
	# Save given params to session
	#
	def save_params_to_session(params)
		session[session_key] = {} if session[session_key].nil?
		session[session_key]["params"] = params if !params.nil?
	end

	#
	# Load last saved params from session
	#
	def load_params_from_session
		if !session[session_key].nil? && !session[session_key]["params"].nil?
			return session[session_key]["params"]
		else
			return {}
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

	# 
	# Never trust parameters from the scary internet, only allow the white list through.
	#
	def filter_params
		return params[:candidate_participation].permit(:votes)
	end

end
