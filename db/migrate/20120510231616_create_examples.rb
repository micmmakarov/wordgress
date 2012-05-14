class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.integer :definition_id
      t.text :text

      t.timestamps
    end
  end
end
