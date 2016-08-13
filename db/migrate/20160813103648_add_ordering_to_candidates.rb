class AddOrderingToCandidates < ActiveRecord::Migration
	def change
		add_column :candidate_participations, :position, :integer, index: true
	end
end
