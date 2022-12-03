class Rol < ActiveRecord::Base
  attr_accessor :id
  belongs_to :user

  def has_permission
  end
end