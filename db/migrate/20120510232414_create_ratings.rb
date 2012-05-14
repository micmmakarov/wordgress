class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :word_id
      t.integer :definition_id
      t.integer :example_id
      t.integer :value
      t.integer :user_id

      t.timestamps
    end
  end
end
