class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.belongs_to :rol, foreign_key: true
      t.belongs_to :branch_office, foreign_key: true, null: true
      t.string  :name, unique: true, null: false
      t.string  :password_digest, unique: true, null: false
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
