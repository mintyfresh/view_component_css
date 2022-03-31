# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  display_name    :string           not null
#  password_digest :binary           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_lower_display_name  (lower(display_name)) UNIQUE
#  index_users_on_lower_email         (lower(email)) UNIQUE
#
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :display_name, presence: true, uniqueness: { case_sensitive: false }

  has_secure_password
end
