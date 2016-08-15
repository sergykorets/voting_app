class AddContentToElections < ActiveRecord::Migration
	def change
		add_column :elections, :content, :text
	end
end
