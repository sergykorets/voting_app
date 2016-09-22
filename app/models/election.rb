# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Election
# *
# * Author: 
# * Date  : 10. 8. 2016
# *
# *****************************************************************************

class Election < ActiveRecord::Base

	# *************************************************************************
	# Structure
	# *************************************************************************
	
	has_and_belongs_to_many :voters
	has_many :election_parts, dependent: :destroy
	
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
	
	#
	# Get all columns permitted for editation
	#
	def self.permitted_columns
		[
			:name,
			:content,
			:votable_from,
			:votable_to
		]
	end

	# *************************************************************************
	# Current election
	# *************************************************************************

	def self.current
		return Election.first
	end

	# *************************************************************************
	# Votability
	# *************************************************************************

	def votable?
		today = Date.today
		result_1 = self.votable_from.nil? || self.votable_from <= today
		result_2 = self.votable_to.nil? || self.votable_to >= today
		return result_1 && result_2
	end

	def resultable?
		today = Date.today
		return !self.votable_to.nil? && self.votable_to < today
	end

	# *************************************************************************
	# Votes
	# *************************************************************************

	def recalculate_votes
		self.election_parts.each do |election_part|
			election_part.recalculate_votes
		end
	end

end
