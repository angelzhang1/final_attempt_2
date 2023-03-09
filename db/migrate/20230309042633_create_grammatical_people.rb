class CreateGrammaticalPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :grammatical_people do |t|
      t.string :pov

      t.timestamps
    end
  end
end
