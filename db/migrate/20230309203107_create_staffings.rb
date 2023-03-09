class CreateStaffings < ActiveRecord::Migration[6.0]
  def change
    create_table :staffings do |t|

      t.timestamps
    end
  end
end
