class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table(:users) do |u|
      u.column(:name, :string)
      u.column(:survey_id, :int)
      u.column(:question_id, :int)
      u.column(:answer, :string)
    end
  end
end
