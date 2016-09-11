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

class CreateVotes < ActiveRecord::Migration
	def change
		create_table :votes do |t|
			t.references :voter, index: true, foreign_key: true
			t.references :candidate, index: true, foreign_key: true
			t.references :election_part, index: true, foreign_key: true
			t.timestamps null: true
		end
	end
end