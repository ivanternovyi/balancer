class RenameDigitsTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :digit, :string
  end
end
