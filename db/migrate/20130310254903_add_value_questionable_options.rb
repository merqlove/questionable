class AddValueQuestionableOptions < ActiveRecord::Migration
  def change
    add_column :questionable_options, :value, :string
    add_index :questionable_options, :value
  end
end
