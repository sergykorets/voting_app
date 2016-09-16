class CreateCandidatesVotes < ActiveRecord::Migration
  def change
    create_table :candidates_votes, id: false  do |t|
		t.integer :candidate_id
		t.integer :vote_id
    end
  end
end
