# *****************************************************************************
# * Copyright (c) Clockstar s.r.o. All rights reserved.
# *****************************************************************************
# *
# * Create election migration
# *
# * Author: 
# * Date  : 10. 8. 2016
# *
# *****************************************************************************

class CreateElections < ActiveRecord::Migration
	def change
		create_table :elections do |t|
			t.string :name
			t.date :votable_from
			t.date :votable_to
			t.datetime :invitation_sent_at
			t.datetime :results_sent_at
			t.timestamps null: true
		end
	end
end