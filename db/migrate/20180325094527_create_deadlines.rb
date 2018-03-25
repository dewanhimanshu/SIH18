class CreateDeadlines < ActiveRecord::Migration[5.1]
  def change
    create_table :deadlines do |t|
      t.integer :user_id
      t.datetime :timmer

      t.timestamps
    end
  end
end
