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

class CreateVoters2 < ActiveRecord::Migration
	def change
		remove_reference :voters, :election
		rename_column :voters, :name, :name_lastname
		add_column :voters, :name_firstname, :string
	end
end
