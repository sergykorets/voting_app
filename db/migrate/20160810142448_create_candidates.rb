# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Create candidate migration
# *
# * Author: 
# * Date  : 10. 8. 2016
# *
# *****************************************************************************

class CreateCandidates < ActiveRecord::Migration
	def change
		create_table :candidates do |t|
			t.string :name_firstname
			t.string :name_lastname
			t.string :address
			t.integer :birth_year
			t.attachment :photo
			t.timestamps null: true
		end
	end
end