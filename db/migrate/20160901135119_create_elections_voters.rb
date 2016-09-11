class CreateElectionsVoters < ActiveRecord::Migration
 def change
    create_table :elections_voters, id: false do |t|
      t.integer :election_id
      t.integer :voter_id
    end
  end
end
