class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.bigint :digit
      t.string :result

      t.timestamps
    end
  end
end
