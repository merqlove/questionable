class ChangeQuestionableQuestionGroups < ActiveRecord::Migration
  def change    
    add_column :questionable_question_groups, :subject_id, :integer
    add_column :questionable_question_groups, :subject_type, :string
    add_column :questionable_question_groups, :position, :integer
  end
end
