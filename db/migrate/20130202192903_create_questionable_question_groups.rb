class CreateQuestionableQuestionGroups < ActiveRecord::Migration
  def change
    create_table :questionable_question_groups do |t|
      t.string :category
      t.integer :group_id
      t.string :group_type
      t.integer :position
      t.string :title
      t.string :note

      t.timestamps
    end
  end
end
