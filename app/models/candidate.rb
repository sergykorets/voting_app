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
	
	has_many :candidate_participations, dependent: :destroy
	has_many :votes, dependent: :destroy

	# *************************************************************************
	# Validators
	# *************************************************************************

	#has_attached_file :photo, styles: { full: "800x800>", thumb: "200x200#" }
	#validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
	croppable_picture_column :photo, styles: { full: "800x800>", thumb: "200x200#" }

	# *************************************************************************
	# Name
	# *************************************************************************

	name_column :name
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
	# Columns
	# *************************************************************************
	
	def self.permitted_columns
		[
			{ :name => [:firstname, :lastname] },
			:birth_year, 
			:address, 
			:photo, 
			:photo_crop_x, 
			:photo_crop_y, 
			:photo_crop_w, 
			:photo_crop_h,
			:photo_perform_cropping,
		]
	end

end
