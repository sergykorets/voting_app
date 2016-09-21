class AddMissingIndexes < ActiveRecord::Migration
	def change
		add_index :candidates_votes, :candidate_id
		add_index :candidates_votes, :vote_id
		add_index :elections_voters, :election_id
		add_index :elections_voters, :voter_id
		add_index :notification_receivers, :notification_id
		add_index :notification_receivers, :user_id
		add_index :notifications, :author_id
		add_index :users, :person_id
		add_index :users, :person_type

		remove_reference :votes, :candidate
	end
end
