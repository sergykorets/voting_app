# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Voting
# *
# * Author: 
# * Date  : 10. 8. 2016
# *
# *****************************************************************************

class Voting
	include ActiveModel::Model

	def initialize(election, voter)
		@election = election
		@voter = voter
		@new_record = true
		@candidate_ids = {} # step as a key
	end

	def valid?
		return true
	end

	def new_record?
		return @new_record
	end

	def save
		ActiveRecord::Base.transaction do 
			
			# Create vote instance for each step
			self.steps.each do |step|
				election_part = @election_parts[step]
				if election_part
					vote = Vote.find_or_create_by(
						election_part_id: election_part.id,
						voter_id: @voter.id
					)
					vote.candidate_ids = @candidate_ids[step]
					election_part.recalculate_votes
				end
			end
		end

		@new_record = false

		return true
	end

	def election_part
		self.steps
		return @election_parts[self.current_step]
	end

	def candidate_ids
		@candidate_ids
	end

	# *************************************************************************
	# Steps
	# *************************************************************************
	
	def steps
		if @steps.nil?
			@election_parts = {}
			@steps = []
			@election.election_parts.order(id: :asc).each do |election_part| 
				step = "election_part_#{election_part.id}"
				@steps << step
				@election_parts[step] = election_part
			end
		end
		@steps << "confirmation"
		return @steps

	end

	attr_writer :current_step

	def current_step
		@current_step || steps.first
	end

	def next_step
		self.current_step = steps[steps.index(current_step) + 1]
	end

	def previous_step
		self.current_step = steps[steps.index(current_step) - 1]
	end

	def first_step?
		return current_step == steps.first
	end

	def last_step?
		return current_step == steps.last
	end

	def confirm_step?
		return current_step == "confirmation"
	end

	def all_valid?
		steps.all? do |step|
			self.current_step = step
			valid?
		end
	end

end
