class AddRatingToDefinition < ActiveRecord::Migration
  def change
    add_column :definitions, :rating, :integer, :value => 0
  end
end
