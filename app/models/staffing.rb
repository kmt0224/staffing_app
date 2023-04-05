class Staffing < ApplicationRecord
  belongs_to :member
  belongs_to :position
  with_options presence: true do
    validates :member_id
    validates :position_id
    validates :date
  end
end
