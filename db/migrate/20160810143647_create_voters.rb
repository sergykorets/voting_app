# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Create voter migration
# *
# * Author: 
# * Date  : 10. 8. 2016
# *
# *****************************************************************************

class CreateVoters < ActiveRecord::Migration
	def change
		create_table :voters do |t|
			t.references :election, index: true, foreign_key: true
			t.string :name
			t.string :email
			t.timestamps null: true
		end
	end
end