class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.integer :user_id
      t.integer :question_id
      t.string :answer,         null: false, default: ""

      t.timestamps
    end
  end
end
