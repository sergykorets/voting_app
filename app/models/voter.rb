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
	
	#has_one :user, class_name: RicUser.user_model.to_s, as: :person
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
		self.code = "test"
		if self.code_generated_at.nil?
			RicNotification.notify([:voter_welcome, self, self.code], self)
		else
			RicNotification.notify([:voter_new_code, self, self.code], self)
		end
		self.code_generated_at = Time.current
		self.save
		return true
	end

#	def create_user
#		user = self.build_user(email: self.email, role: "voter")
#		new_password = user.regenerate_password(disable_email: true)
#		if new_password
#			RicNotification.notify([:welcome_voter, self, new_password], user)
#			return user
#		else
#			return nil
#		end
#	end
	
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

end
