# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Create election part migration
# *
# * Author: 
# * Date  : 10. 8. 2016
# *
# *****************************************************************************

class CreateElectionParts < ActiveRecord::Migration
	def change
		create_table :election_parts do |t|
			t.references :election, index: true, foreign_key: true
			t.string :name
			t.integer :max_votes_for_candidate

			t.timestamps null: true
		end
	end
end