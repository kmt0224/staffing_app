class CreateStaffings < ActiveRecord::Migration[6.0]
  def change
    create_table :staffings do |t|
      t.references :member, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true
      t.date :date, null: false
      t.date :startDate, null: false
      t.timestamps
    end
  end
end
