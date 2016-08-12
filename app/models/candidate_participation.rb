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

end
