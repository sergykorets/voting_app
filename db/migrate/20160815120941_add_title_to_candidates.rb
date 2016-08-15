class AddTitleToCandidates < ActiveRecord::Migration
	def change
		add_column :candidates, :name_title, :string
	end
end
