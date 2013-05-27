class AddCoeffQuestionableQuestions < ActiveRecord::Migration
  def up
    add_column :questionable_questions, :coeff, :decimal, :precision => 4, :scale => 3, :default => 0.000
    change_column_default :questionable_assignments, :position, 10
  end

  def down
    remove_column :questionable_questions, :coeff
    change_column_default :questionable_assignments, :position, nil
  end
end
