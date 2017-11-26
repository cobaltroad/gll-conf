class AddIsSelectedToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :is_selected, :boolean, default: false
  end
end
