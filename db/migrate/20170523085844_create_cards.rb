class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :question
      t.string :answer
      t.references :quizz, foreign_key: true

      t.timestamps
    end
  end
end
