class AddQuestionableIndexes < ActiveRecord::Migration
  def up
    add_index :questionable_questions, :id, :name => 'index_questionable_questions_on_id'
    add_index :questionable_questions, :category, :name => 'index_questionable_questions_on_category'
    add_index :questionable_question_groups, :id, :name => 'index_questionable_question_groups_on_id'
    add_index :questionable_question_groups, :category, :name => 'index_questionable_question_groups_on_category'
    add_index :questionable_answers, :id, :name => 'index_questionable_answers_on_id'
    add_index :questionable_options, :id, :name => 'index_questionable_options_on_id'
  end
end
