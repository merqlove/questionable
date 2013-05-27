class AddRatingIdQuestionableAnswers < ActiveRecord::Migration
  def change
    add_column :questionable_answers, :rating_id, :integer
    add_index :questionable_answers, :rating_id
  end
end
