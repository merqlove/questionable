class AddQuestionGroupQuestionableAssignments < ActiveRecord::Migration
  def change
    add_column :questionable_assignments, :question_group_id, :integer
    add_index :questionable_assignments, :question_group_id
  end
end
