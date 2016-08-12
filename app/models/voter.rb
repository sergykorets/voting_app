# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Voter
# *
# * Author: 
# * Date  : 10. 8. 2016
# *
# *****************************************************************************

class Voter < ActiveRecord::Base

	# *************************************************************************
	# Structure
	# *************************************************************************
	
	has_one :user, class_name: RicUser.user_model.to_s, as: :person
	has_many :votes, dependent: :destroy
	belongs_to :election
	
	# *************************************************************************
	# Validators
	# *************************************************************************
	
	validates_presence_of :election_id

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
		if !params[:name].blank?
			result = result.where("lower(unaccent(name)) LIKE ('%' || lower(unaccent(trim(?))) || '%')", params[:name].to_s)
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
				(lower(unaccent(name)) LIKE ('%' || lower(unaccent(trim(:query))) || '%'))
			", query: query.to_s)
		end
	end
	
	# *************************************************************************
	# Columns
	# *************************************************************************
	
	def self.permitted_columns
		[
			{ :name => [:firstname, :lastname] },
			:email
		]
	end

end
