class CreateVerbs < ActiveRecord::Migration[6.0]
  def change
    create_table :verbs do |t|
      t.string :verb_description
      t.integer :user_id

      t.timestamps
    end
  end
end
