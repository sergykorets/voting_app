# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Candidate participation
# *
# * Author: 
# * Date  : 10. 8. 2016
# *
# *****************************************************************************

class CandidateParticipation < ActiveRecord::Base

	# *************************************************************************
	# Structure
	# *************************************************************************
	
	belongs_to :candidate
	belongs_to :election_part
	
	# *************************************************************************
	# Validators
	# *************************************************************************
	
	validates_presence_of :election_part_id, :candidate_id
	
	# *************************************************************************
	# Ordering
	# *************************************************************************
	
	enable_ordering

	# *************************************************************************
	# Columns
	# *************************************************************************
	
	#
	# Get all columns permitted for editation
	#
	def self.permitted_columns
		[
			:candidate_id, 
			:election_part_id, 
			:votes, 
			:description, 
			:visions
		]
	end

	# *************************************************************************
	# Votes
	# *************************************************************************

	def recalculate_votes
		result = ActiveRecord::Base.connection.execute("SELECT COUNT(*) FROM candidates_votes LEFT JOIN votes ON votes.id = candidates_votes.vote_id WHERE candidates_votes.candidate_id = #{self.candidate_id} AND votes.election_part_id = #{self.election_part_id}")
		self.votes = result.getvalue(0, 0)
		self.save
	end

end
