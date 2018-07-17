class UpdateUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :question_id, :string
  end
end
