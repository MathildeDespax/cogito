class CreateUserClassrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :user_classrooms do |t|
      t.references :classroom, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
