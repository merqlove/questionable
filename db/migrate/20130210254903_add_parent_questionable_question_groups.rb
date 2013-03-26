class AddParentQuestionableQuestionGroups < ActiveRecord::Migration
  def change
    rename_column :questionable_question_groups, :subject_id, :group_id
    rename_column :questionable_question_groups, :subject_type, :group_type
  end
end
