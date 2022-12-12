class Permission < ApplicationRecord
  validates :name, presence: true
  has_many :rols
end