class AddTruefalseToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :flavour, :string, null: false
    remove_column :questions, :rating, :integer
    add_column :answers, :flavour, :string, null: false
    add_column :answers, :true_false, :boolean, default: nil
  end
end
