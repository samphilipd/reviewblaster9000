class AddFreeTextColumnToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :free_text, :text
  end
end
