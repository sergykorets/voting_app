# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Vote
# *
# * Author: 
# * Date  : 10. 8. 2016
# *
# *****************************************************************************

class Vote < ActiveRecord::Base

	# *************************************************************************
	# Structure
	# *************************************************************************
	
	has_and_belongs_to_many :candidates
	belongs_to :voter
	belongs_to :election_part
	
	# *************************************************************************
	# Validators
	# *************************************************************************
	
	validates_presence_of :voter_id, :election_part_id
	
	# *************************************************************************
	# Columns
	# *************************************************************************
	
	def self.permitted_columns
		[
			:voter_id, 
			:election_part_id
		]
	end

	

end
