module RicUser
	class User < ActiveRecord::Base
		include RicUser::Concerns::Models::User

		# *********************************************************************
		# Name
		# *********************************************************************

		name_column :name, title: true

		# *********************************************************************
		# Person
		# *********************************************************************

		#
		# Get binded voter
		#
		def voter
			if self.person_id && self.person_type == "Voter"
				return self.person
			else
				return nil
			end
		end

	
		#
		# Login (e-mail)
		# 
		attr_accessor :login

		def login=(login)
			@login = login
		end

		def login
			@login || self.email
		end

		def self.find_for_database_authentication(warden_conditions)
			conditions = warden_conditions.dup
			if login = conditions.delete(:login)
				where(conditions.to_hash).where("lower(email) = :value", value: login.downcase).first
			elsif conditions.has_key?(:email)
				where(conditions.to_hash).first
			end
		end


	end
end