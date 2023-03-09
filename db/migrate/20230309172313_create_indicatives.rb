class CreateIndicatives < ActiveRecord::Migration[6.0]
  def change
    create_table :indicatives do |t|
      t.integer :verb_id
      t.integer :pov_id
      t.string :present_conjugation
      t.string :preterite_conjugation
      t.string :imperfect_conjugation

      t.timestamps
    end
  end
end
