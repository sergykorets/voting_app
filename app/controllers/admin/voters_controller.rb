# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Voters
# *
# * Author: 
# * Date  : 29. 8. 2016
# *
# *****************************************************************************

class Admin::VotersController < AdminController

	before_action :set_voter, only: [:show, :edit, :update, :destroy, :user_create, :user_regenerate_password, :user_destroy]

	#
	# Index action
	#
	def index
		@filter_voter = Voter.new(load_params_from_session)
		@voters = Voter.filter(load_params_from_session.symbolize_keys).sorting(params[:sort], "voters.name_lastname ASC").page(params[:page]).per(50)
		respond_to do |format|
			format.html { render "index" }
			format.json { render json: @voters.to_json }
		end
	end

	#
	# Filter action
	#
	def filter
		save_params_to_session(filter_params)
		redirect_to main_app.admin_voters_path
	end

	#
	# Search action
	#
	def search
		@voters = Voter.search(params[:q]).order(name_lastname: :asc)
		respond_to do |format|
			format.html { render "index" }
			format.json { render json: @voters.to_json }
		end
	end

	#
	# Show action
	#
	def show
		respond_to do |format|
			format.html { render "show" }
			format.json { render json: @voter.to_json }
		end
	end

	#
	# New action
	#
	def new
		@voter = Voter.new
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
		@voter = Voter.new(voter_params)
		if @voter.save
			respond_to do |format|
				format.html { redirect_to main_app.admin_voters_path, notice: I18n.t("activerecord.notices.models.voter.create") }
				format.json { render json: @voter.id }
			end
		else
			respond_to do |format|
				format.html { render "new" }
				format.json { render json: @voter.errors }
			end
		end
	end

	#
	# Update action
	#
	def update
		if @voter.update(voter_params)
			respond_to do |format|
				format.html { redirect_to main_app.admin_voters_path, notice: I18n.t("activerecord.notices.models.voter.update") }
				format.json { render json: @voter.id }
			end
		else
			respond_to do |format|
				format.html { render "edit" }
				format.json { render json: @voter.errors }
			end
		end
	end

	#
	# Destroy action
	#
	def destroy
		@voter.destroy
		respond_to do |format|
			format.html { redirect_to main_app.admin_voters_path, notice: I18n.t("activerecord.notices.models.voter.destroy") }
			format.json { render json: @voter.id }
		end
	end

	#
	# Create user action
	#
	def user_create
		if @voter.create_user
			redirect_to admin_voter_path(@voter), notice: I18n.t("activerecord.notices.models.parent.user_create")
		else
			redirect_to admin_voter_path(@voter), alert: I18n.t("activerecord.errors.models.parent.user_create")
		end
	end

	#
	# Regenerate password action
	#
	def user_regenerate_password
		if !@voter.user
			redirect_to admin_voter_path(@voter), alert: I18n.t("activerecord.errors.models.parent.user_not_found")
			return
		end
		if @voter.user.regenerate_password
			redirect_to admin_voter_path(@voter), notice: I18n.t("activerecord.notices.models.parent.user_regenerate_password")
		else
			redirect_to admin_voter_path(@voter), alert: I18n.t("activerecord.errors.models.parent.user_regenerate_password")
		end
	end

	#
	# User destroy action
	#
	def user_destroy
		if !@voter.user
			redirect_to admin_voter_path(@voter), alert: I18n.t("activerecord.errors.models.parent.user_not_found")
			return
		end
		@voter.user.destroy
		redirect_to admin_voter_path(@voter), notice: I18n.t("activerecord.notices.models.parent.user_destroy")
	end

protected

	# *************************************************************************
	# Model setters
	# *************************************************************************

	#
	# Set model
	#
	def set_voter
		@voter = Voter.find_by_id(params[:id])
		if @voter.nil?
			redirect_to main_app.admin_voters_path, alert: I18n.t("activerecord.errors.models.voter.not_found")
		end
	end

	# *************************************************************************
	# Session
	# *************************************************************************

	#
	# Get session key unique for the controller
	#
	def session_key
		return "voters"
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
	def voter_params
		result = params.require(:voter).permit(Voter.permitted_columns)
		result[:election_ids] = result[:election_ids].split(",") if !result[:election_ids].blank?
		return result
	end

	# 
	# Never trust parameters from the scary internet, only allow the white list through.
	#
	def filter_params
		return params[:voter].permit(:name_for_filter, :election_id_for_filter)
	end

end
