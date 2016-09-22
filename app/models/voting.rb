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

	# *************************************************************************
	# Lifecycle
	# *************************************************************************

	def initialize(election)
		@election = election
		@new_record = true
		@candidate_ids = {} # Step as a key
	end

	def new_record?
		return @new_record
	end

	def valid?
		if self.confirm_step?
			if self.code.blank?
				self.errors.add(:code, I18n.t("activerecord.errors.models.voting.attributes.code.blank"))
			end
			if self.voter.blank?
				self.errors.add(:code, I18n.t("activerecord.errors.models.voting.attributes.voter.blank"))
			end
			if self.voter && self.voter.already_voted?(@election)
				self.errors.add(:code, I18n.t("activerecord.errors.models.voting.attributes.voter.already_voted"))
			end
		else
			if self.candidate_ids[self.current_step].length > current_election_part.max_votes_for_candidate
				self.errors.add(:candidate_ids, I18n.t("activerecord.errors.models.voting.attributes.candidate_ids.too_big", max_votes_for_candidate: current_election_part.max_votes_for_candidate))
			end
		end
		return self.errors.empty?
	end

	def save
		ActiveRecord::Base.transaction do 
			self.steps.each do |step| # Create vote instance for each step
				election_part = @election_parts[step]
				if election_part
					vote = Vote.find_or_create_by(
						election_part_id: election_part.id,
						voter_id: self.voter.id
					)
					vote.candidate_ids = @candidate_ids[step]
				end
			end
			@election.recalculate_votes
		end
		@new_record = false
		return true
	end


	# *************************************************************************
	# Attributes
	# *************************************************************************

	attr_accessor :code

	def candidate_ids
		@candidate_ids
	end

	def voter
		if @voter.nil?
			@voter = Voter.where(code: self.code).first if !self.code.nil?
			if @voter && !@voter.can_vote?(@election)
				@voter = nil
			end
		end
		return @voter
	end

	def election_parts
		self.steps
		return @election_parts
	end

	def current_election_part
		self.steps
		return @election_parts[self.current_step]
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
			@steps << "confirm"
		end
		return @steps
	end

	def current_step=(current_step)
		if self.steps.include?(current_step)
			@current_step = current_step
		else
			@current_step = nil
		end
	end
	
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
		return current_step == "confirm"
	end

	def all_valid?
		steps.all? do |step|
			self.current_step = step
			valid?
		end
	end

end
