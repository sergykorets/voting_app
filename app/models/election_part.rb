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

class ElectionPart < ActiveRecord::Base

	# *************************************************************************
	# Structure
	# *************************************************************************
	
	has_many :votes, dependent: :destroy
	belongs_to :election
	has_many :candidate_participations, dependent: :destroy

	# *************************************************************************
	# Validators
	# *************************************************************************
	
	validates_presence_of :election_id

	# *************************************************************************
	# Scopes
	# *************************************************************************

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
			:name, 
			:max_votes_for_candidate
		]
	end

	# *************************************************************************
	# Name with election
	# *************************************************************************

	def name_with_election
		return self.election.name + " - " + self.name 
	end

	add_methods_to_json :name_with_election

	# *************************************************************************
	# Votes
	# *************************************************************************

	def recalculate_votes
		self.candidate_participations.each do |candidate_participation|
			candidate_participation.recalculate_votes
		end
	end

	def votes_count
		self.votes.count
	end

end
