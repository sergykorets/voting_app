# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Create candidate participation migration
# *
# * Author: 
# * Date  : 10. 8. 2016
# *
# *****************************************************************************

class CreateCandidateParticipations < ActiveRecord::Migration
	def change
		create_table :candidate_participations do |t|
			t.references :candidate, index: true, foreign_key: true
			t.references :election_part, index: true, foreign_key: true
			t.text :description
			t.text :visions
			t.integer :votes
			t.timestamps null: true
		end
	end
end