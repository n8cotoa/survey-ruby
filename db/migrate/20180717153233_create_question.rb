class CreateQuestion < ActiveRecord::Migration[5.2]
  def change
    create_table(:questions) do |q|
      q.column(:description, :string)
      q.column(:type, :string)
      q.column(:survey_id, :integer)
    end
  end
end
