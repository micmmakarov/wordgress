class AddTextToWords < ActiveRecord::Migration
  def change
    add_column :words, :text, :string
  end
end
