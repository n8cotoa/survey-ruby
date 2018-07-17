class UpdateChoicesName < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :choices, :question_choices
  end
end
