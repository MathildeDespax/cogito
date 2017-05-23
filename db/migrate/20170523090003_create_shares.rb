class CreateShares < ActiveRecord::Migration[5.0]
  def change
    create_table :shares do |t|
      t.references :classroom, foreign_key: true
      t.references :quizz, foreign_key: true

      t.timestamps
    end
  end
end
