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

	before_action :set_election, except: [:search]
	before_action :set_election_part, only: [:show, :edit, :update, :destroy]

	#
	# Search action
	#
	def search
		@election_parts = ElectionPart.search(params[:q]).order(created_at: :asc)
		render json: @election_parts.to_json
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
		@election_part = ElectionPart.new(election_id: @election.id)
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
		@election_part.election_id = @election.id
		if @election_part.save
			respond_to do |format|
				format.html { redirect_to main_app.admin_election_election_part_path(@election, @election_part), notice: I18n.t("activerecord.notices.models.election_part.create") }
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
				format.html { redirect_to main_app.admin_election_election_part_path(@election, @election_part), notice: I18n.t("activerecord.notices.models.election_part.update") }
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
			format.html { redirect_to main_app.admin_election_path(@election_part.election), notice: I18n.t("activerecord.notices.models.election_part.destroy") }
			format.json { render json: @election_part.id }
		end
	end

protected

	# *************************************************************************
	# Model setters
	# *************************************************************************

	def set_election_part
		@election_part = ElectionPart.find_by_id(params[:id])
		if @election_part.nil?
			redirect_to main_app.admin_elections_path, alert: I18n.t("activerecord.errors.models.election_part.not_found")
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

end
