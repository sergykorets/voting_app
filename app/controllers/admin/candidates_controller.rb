# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Candidates
# *
# * Author: 
# * Date  : 10. 8. 2016
# *
# *****************************************************************************

class Admin::CandidatesController < AdminController

	before_action :set_candidate, only: [:show, :edit, :update, :destroy]

	#
	# Index action
	#
	def index
		@filter_candidate = Candidate.new(load_params_from_session)
		@candidates = Candidate.filter(load_params_from_session.symbolize_keys).sorting(params[:sort]).page(params[:page]).per(50)
		respond_to do |format|
			format.html { render "index" }
			format.json { render json: @candidates.to_json }
		end
	end

	#
	# Filter action
	#
	def filter
		save_params_to_session(filter_params)
		redirect_to main_app.admin_candidates_path
	end

	#
	# Search action
	#
	def search
		@candidates = Candidate.search(params[:q]).order(id: :asc)
		respond_to do |format|
			format.html { render "index" }
			format.json { render json: @candidates.to_json }
		end
	end

	#
	# Show action
	#
	def show
		respond_to do |format|
			format.html { render "show" }
			format.json { render json: @candidate.to_json }
		end
	end

	#
	# New action
	#
	def new
		@candidate = Candidate.new
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
		@candidate = Candidate.new(candidate_params)
		if @candidate.save
			respond_to do |format|
				format.html { redirect_to main_app.admin_candidate_path(@candidate), notice: I18n.t("activerecord.notices.models.candidate.create") }
				format.json { render json: @candidate.id }
			end
		else
			respond_to do |format|
				format.html { render "new" }
				format.json { render json: @candidate.errors }
			end
		end
	end

	#
	# Update action
	#
	def update
		if @candidate.update(candidate_params)
			respond_to do |format|
				format.html { redirect_to main_app.admin_candidate_path(@candidate), notice: I18n.t("activerecord.notices.models.candidate.update") }
				format.json { render json: @candidate.id }
			end
		else
			respond_to do |format|
				format.html { render "edit" }
				format.json { render json: @candidate.errors }
			end
		end
	end

	#
	# Destroy action
	#
	def destroy
		@candidate.destroy
		respond_to do |format|
			format.html { redirect_to main_app.admin_candidates_path, notice: I18n.t("activerecord.notices.models.candidate.destroy") }
			format.json { render json: @candidate.id }
		end
	end

protected

	# *************************************************************************
	# Model setters
	# *************************************************************************

	#
	# Set model
	#
	def set_candidate
		@candidate = Candidate.find_by_id(params[:id])
		if @candidate.nil?
			redirect_to main_app.admin_candidates_path, alert: I18n.t("activerecord.errors.models.candidate.not_found")
		end
	end

	# *************************************************************************
	# Session
	# *************************************************************************

	#
	# Get session key unique for the controller
	#
	def session_key
		return "candidates"
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
	def candidate_params
		params.require(:candidate).permit(Candidate.permitted_columns)
	end

	# 
	# Never trust parameters from the scary internet, only allow the white list through.
	#
	def filter_params
		return params[:candidate].permit(:name_for_filter)
	end

end
