class AddCodeToVoters < ActiveRecord::Migration
	def change
		add_column :voters, :code, :string, index: true
		add_column :voters, :code_generated_at, :datetime
	end
end
