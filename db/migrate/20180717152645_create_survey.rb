class CreateSurvey < ActiveRecord::Migration[5.2]
  def change
    create_table(:surveys) do |s|
      s.column(:title, :string)
    end
  end
end
