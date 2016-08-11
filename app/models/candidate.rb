# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Candidate
# *
# * Author: 
# * Date  : 10. 8. 2016
# *
# *****************************************************************************

class Candidate < ActiveRecord::Base

	# *************************************************************************
	# Structure
	# *************************************************************************
	has_many :candidate_participations
	has_many :votes


	# *************************************************************************
	# Validators
	# *************************************************************************

	has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

	# *************************************************************************
	# Name
	# *************************************************************************

	name_column :name

	#
	# Add formatted name to JSON output
	#

	add_methods_to_json :name_formatted

	# *************************************************************************
	# Scopes
	# *************************************************************************

	
	#
	# Filter
	#
	def self.filter(params)
		
		# Preset
		result = all

		# Name
		if !params[:name_for_filter].blank?
			result = result.where("
				(lower(unaccent(name_lastname)) LIKE ('%' || lower(unaccent(trim(:name_for_filter))) || '%')) OR
				(lower(unaccent(name_firstname)) LIKE ('%' || lower(unaccent(trim(:name_for_filter))) || '%'))
			", name_for_filter: params[:name_for_filter].to_s)
		end

		result
	end

	#
	# Search
	#
	def self.search(query)
		if query.blank?
			all
		else
			where("
				(lower(unaccent(name_lastname)) LIKE ('%' || lower(unaccent(trim(:query))) || '%')) OR
				(lower(unaccent(name_firstname)) LIKE ('%' || lower(unaccent(trim(:query))) || '%'))
			", query: query)
		end
	end

	# *************************************************************************
	# Enums
	# *************************************************************************

	# *************************************************************************
	# Virtual attributes
	# *************************************************************************

	# *************************************************************************
	# Callbacks
	# *************************************************************************
	
	# *************************************************************************
	# Columns
	# *************************************************************************
	
	#
	# Get all columns permitted for editation
	#
	def self.permitted_columns
		[ :created_at, :id, :photo, :birth_year, :address, :name => [:firstname, :lastname] ]
	end

end
