# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Election part
# *
# * Author: 
# * Date  : 10. 8. 2016
# *
# *****************************************************************************

class Admin::ElectionPartsController < AdminController

	before_action :set_election_part, only: [:show, :edit, :update, :destroy]

	#
	# Index action
	#
	def index
		@filter_election_part = ElectionPart.new(load_params_from_session)
		@election_parts = ElectionPart.filter(load_params_from_session.symbolize_keys).sorting(params[:sort]).page(params[:page]).per(50)
		respond_to do |format|
			format.html { render "index" }
			format.json { render json: @election_parts.to_json }
		end
	end

	#
	# Filter action
	#
	def filter
		save_params_to_session(filter_params)
		redirect_to main_app.admin_election_parts_path
	end

	#
	# Search action
	#
	def search
		@election_parts = ElectionPart.search(params[:q]).order(id: :asc)
		respond_to do |format|
			format.html { render "index" }
			format.json { render json: @election_parts.to_json }
		end
	end

	#
	# Show action
	#
	def show
		respond_to do |format|
			format.html { render "show" }
			format.json { render json: @election_part.to_json }
		end
	end

	#
	# New action
	#
	def new
		@election_part = ElectionPart.new
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
		@election_part = ElectionPart.new(election_part_params)
		if @election_part.save
			respond_to do |format|
				format.html { redirect_to main_app.admin_election_part_path(@election_part), notice: I18n.t("activerecord.notices.models.election_part.create") }
				format.json { render json: @election_part.id }
			end
		else
			respond_to do |format|
				format.html { render "new" }
				format.json { render json: @election_part.errors }
			end
		end
	end

	#
	# Update action
	#
	def update
		if @election_part.update(election_part_params)
			respond_to do |format|
				format.html { redirect_to main_app.admin_election_part_path(@election_part), notice: I18n.t("activerecord.notices.models.election_part.update") }
				format.json { render json: @election_part.id }
			end
		else
			respond_to do |format|
				format.html { render "edit" }
				format.json { render json: @election_part.errors }
			end
		end
	end

	#
	# Destroy action
	#
	def destroy
		@election_part.destroy
		respond_to do |format|
			format.html { redirect_to main_app.admin_election_parts_path, notice: I18n.t("activerecord.notices.models.election_part.destroy") }
			format.json { render json: @election_part.id }
		end
	end

protected

	# *************************************************************************
	# Model setters
	# *************************************************************************

	#
	# Set model
	#
	def set_election_part
		@election_part = ElectionPart.find_by_id(params[:id])
		if @election_part.nil?
			redirect_to main_app.admin_election_parts_path, alert: I18n.t("activerecord.errors.models.election_part.not_found")
		end
	end

	# *************************************************************************
	# Session
	# *************************************************************************

	#
	# Get session key unique for the controller
	#
	def session_key
		return "election_parts"
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
	def election_part_params
		params.require(:election_part).permit(ElectionPart.permitted_columns)
	end

	# 
	# Never trust parameters from the scary internet, only allow the white list through.
	#
	def filter_params
		return params[:election_part].permit(:name)
	end

end
