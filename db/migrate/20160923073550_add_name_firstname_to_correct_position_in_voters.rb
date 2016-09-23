class AddNameFirstnameToCorrectPositionInVoters < ActiveRecord::Migration
	def change
		drop_table :voters
		create_table :voters do |t|
			t.string :name_firstname
			t.string :name_lastname
			t.string :email
			t.string :code
			t.datetime :code_generated_at
			t.timestamps null: true
		end
	end
end
