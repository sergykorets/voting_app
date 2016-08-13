# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Elections
# *
# * Author: 
# * Date  : 12. 8. 2016
# *
# *****************************************************************************

class Admin::ElectionsController < AdminController

	before_action :set_election, only: [:show, :edit, :update, :destroy]

	#
	# Index action
	#
	def index
		@filter_election = Election.new(load_params_from_session)
		@elections = Election.filter(load_params_from_session.symbolize_keys).sorting(params[:sort], "created_at ASC").page(params[:page]).per(50)
		respond_to do |format|
			format.html { render "index" }
			format.json { render json: @elections.to_json }
		end
	end

	#
	# Filter action
	#
	def filter
		save_params_to_session(filter_params)
		redirect_to main_app.admin_elections_path
	end

	#
	# Search action
	#
	def search
		@elections = Election.search(params[:q]).order(created_at: :asc)
		respond_to do |format|
			format.html { render "index" }
			format.json { render json: @elections.to_json }
		end
	end

	#
	# Show action
	#
	def show
		respond_to do |format|
			format.html { render "show" }
			format.json { render json: @election.to_json }
		end
	end

	#
	# New action
	#
	def new
		@election = Election.new
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
		@election = Election.new(election_params)
		if @election.save
			respond_to do |format|
				format.html { redirect_to main_app.admin_election_path(@election), notice: I18n.t("activerecord.notices.models.election.create") }
				format.json { render json: @election.id }
			end
		else
			respond_to do |format|
				format.html { render "new" }
				format.json { render json: @election.errors }
			end
		end
	end

	#
	# Update action
	#
	def update
		if @election.update(election_params)
			respond_to do |format|
				format.html { redirect_to main_app.admin_election_path(@election), notice: I18n.t("activerecord.notices.models.election.update") }
				format.json { render json: @election.id }
			end
		else
			respond_to do |format|
				format.html { render "edit" }
				format.json { render json: @election.errors }
			end
		end
	end

	#
	# Destroy action
	#
	def destroy
		@election.destroy
		respond_to do |format|
			format.html { redirect_to main_app.admin_elections_path, notice: I18n.t("activerecord.notices.models.election.destroy") }
			format.json { render json: @election.id }
		end
	end

protected

	# *************************************************************************
	# Model setters
	# *************************************************************************

	def set_election
		@election = Election.find_by_id(params[:id])
		if @election.nil?
			redirect_to main_app.admin_elections_path, alert: I18n.t("activerecord.errors.models.election.not_found")
		end
	end

	# *************************************************************************
	# Session
	# *************************************************************************

	#
	# Get session key unique for the controller
	#
	def session_key
		return "elections"
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
	def election_params
		params.require(:election).permit(Election.permitted_columns)
	end

	# 
	# Never trust parameters from the scary internet, only allow the white list through.
	#
	def filter_params
		return params[:election].permit(:name)
	end

end
