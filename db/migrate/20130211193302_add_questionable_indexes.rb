class AddQuestionableIndexes < ActiveRecord::Migration
  def up
    add_index :questionable_questions, :category, :name => 'index_questionable_questions_on_category'
    add_index :questionable_question_groups, :category, :name => 'index_questionable_question_groups_on_category'
  end
end
