class CreateStudentEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :student_evaluations do |t|
      t.integer :evaluation
      t.references :card, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
