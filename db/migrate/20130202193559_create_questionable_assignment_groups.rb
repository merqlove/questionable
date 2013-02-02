class CreateQuestionableAssignmentGroups < ActiveRecord::Migration
  def change
    create_table :questionable_assignment_groups do |t|
      t.integer :question_group_id
      t.integer :subject_id
      t.string  :subject_type
      t.integer :position

      t.timestamps
    end

    add_index :questionable_assignment_groups, [:subject_type, :subject_id, :position], :name => 'index_questionable_assignment_groups_on_subject_and_position' 
  end
end
