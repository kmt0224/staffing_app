class Position < ApplicationRecord
  has_many :staffings
  validates :position, presence: true
end
