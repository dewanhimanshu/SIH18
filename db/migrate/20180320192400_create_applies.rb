class CreateApplies < ActiveRecord::Migration[5.1]
  def change
    create_table :applies do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.integer :aadhaar
      t.string :status, default: "applied"

      t.timestamps
    end
  end
end
