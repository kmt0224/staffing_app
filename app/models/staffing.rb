class Staffing < ApplicationRecord
  belongs_to :member
  belongs_to :position
end
