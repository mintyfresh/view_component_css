# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :display_name, null: false
      t.binary :password_digest, null: false
      t.timestamps

      t.index 'lower(email)', unique: true
      t.index 'lower(display_name)', unique: true
    end
  end
end
