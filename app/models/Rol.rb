class Rol < ApplicationRecord
  validates :name, presence: true
  has_many :users
  has_many :permissions

  def has_permission
  end
end