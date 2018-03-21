class AddFeedbackToApply < ActiveRecord::Migration[5.1]
  def change
    add_column :applies, :feedback, :text, null: false, default: ""
  end
end
