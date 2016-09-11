module RicUser
	class User < ActiveRecord::Base
		include RicUser::Concerns::Models::User

		# *********************************************************************
		# Name
		# *********************************************************************

		name_column :name, title: false

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

	end
end