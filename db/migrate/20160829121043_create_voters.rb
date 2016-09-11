# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Create vote migration
# *
# * Author: 
# * Date  : 10. 8. 2016
# *
# *****************************************************************************

class CreateVoters < ActiveRecord::Migration
	def change
		create_table :voters do |t|
			t.string :name_firstname
			t.string :name_lastname
			t.string :email
		end
	end
end
