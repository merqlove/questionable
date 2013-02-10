class AddParentQuestionableQuestionGroups < ActiveRecord::Migration
  def change
    add_column :questionable_question_groups, :ancestry, :string
    add_column :questionable_question_groups, :ancestry_depth, :integer, :default => 0
    rename_column :questionable_question_groups, :subject_id, :group_id
    rename_column :questionable_question_groups, :subject_type, :group_type

    add_index :questionable_question_groups, :ancestry
  end
end
