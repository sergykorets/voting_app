class RemoveShittyConstraints < ActiveRecord::Migration
	def change
		remove_foreign_key :votes, column: :candidate_id
		remove_foreign_key :votes, column: :voter_id
		remove_foreign_key :votes, column: :election_part_id
		remove_foreign_key :election_parts, column: :election_id
		remove_foreign_key :candidate_participations, column: :election_part_id
		remove_foreign_key :candidate_participations, column: :candidate_id
	end
end
