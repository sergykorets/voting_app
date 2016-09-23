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
	
	has_many :votes, dependent: :destroy
	has_and_belongs_to_many :elections

	# *************************************************************************
	# Name
	# *************************************************************************

	name_column :name, title: false
	add_methods_to_json :name_formatted

	#
	# Get name of email in case name is not set
	#
	def name_or_email
		if self.name.nil?
			return self.email
		else
			self.name_formatted
		end
	end
	
	# *************************************************************************
	# Scopes
	# *************************************************************************
	
	attr_accessor :election_id_for_filter

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

		if !params[:election_id_for_filter].blank?
			result = result.joins(:elections).where(elections: { id: params[:election_id_for_filter] }).group("voters.id")
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
	# Code
	# *************************************************************************

	def generate_code
		new_code = RugSupport::Util::String.random(6)
		while self.class.where("code = :value", value: new_code).count > 0
			new_code = RugSupport::Util::String.random(6)
		end
		self.code = new_code
		if !self.email.blank?
			if self.code_generated_at.nil?
				RicNotification.notify([:voter_welcome, self, self.code], self)
			else
				RicNotification.notify([:voter_new_code, self, self.code], self)
			end
		end
		self.code_generated_at = Time.current
		self.save
		return true
	end

	def self.generate_missing_codes(election)
		Voter.transaction do 
			Voter.all.each do |voter|
				if voter.code_generated_at.nil? && voter.can_vote?(election)
					voter.generate_code
				end
			end
		end
	end

	def self.associate_with_election(election)
		Voter.transaction do 
			Voter.all.each do |voter|
				voter.elections << election
			end
		end
	end

	# *************************************************************************
	# Columns
	# *************************************************************************
	
	def self.permitted_columns
		[
			{ :name => [:firstname, :lastname] },
			:email,
			:election_ids
		]
	end

	# *************************************************************************
	# Import
	# *************************************************************************

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			Voter.create!(row.to_hash)
		end
	end

	# *************************************************************************
	# Voting
	# *************************************************************************

	def already_voted?(election)
		return self.votes.where(election_part_id: election.election_part_ids).count > 0
	end

	def can_vote?(election)
		election_found = false
		self.elections.each do |voter_election| 
			if voter_election.id == election.id
				election_found = true
				break
			end
		end
		return election_found
	end

end
