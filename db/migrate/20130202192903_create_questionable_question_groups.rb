class CreateQuestionableQuestionGroups < ActiveRecord::Migration
  def change
    create_table :questionable_question_groups do |t|
      t.string :category
      t.string :title
      t.string :note

      t.timestamps
    end
  end
end
