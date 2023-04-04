class CreateStartDays < ActiveRecord::Migration[6.0]
  def change
    create_table :start_days do |t|
      t.date :start_day, null: false
      t.timestamps
    end
  end
end
