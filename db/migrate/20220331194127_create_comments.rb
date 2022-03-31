# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :author, null: false, foreign_key: { to_table: :users }
      t.belongs_to :commentable, polymorphic: true, null: false
      t.text       :message, null: false
      t.integer    :likes_count, null: false, default: 0
      t.timestamps
    end
  end
end
