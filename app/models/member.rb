class Member < ApplicationRecord
  has_many :staffings
  validates :name, presence: true
end
