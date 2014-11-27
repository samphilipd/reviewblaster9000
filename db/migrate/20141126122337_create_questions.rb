class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.integer :rating, null: false, default: -1

      t.timestamps
    end
  end
end
