class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :task
      t.datetime :deadline
      t.boolean :status, default: false
      t.timestamps null: false
    end
  end
end
