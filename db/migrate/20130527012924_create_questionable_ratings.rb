class CreateQuestionableRatings < ActiveRecord::Migration
  def change
    create_table :questionable_ratings do |t|
      t.string :title
      t.integer :subject_id
      t.string :subject_type

      t.timestamps
    end
    add_index :questionable_ratings, [:subject_type, :subject_id], :name => 'index_questionable_ratings_on_subject'
  end
end
