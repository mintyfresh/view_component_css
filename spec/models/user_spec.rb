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
require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it 'is invalid without an email' do
    user.email = nil
    expect(user).to be_invalid
  end

  it 'is invalid when a user with the same email already exists' do
    create(:user, email: user.email)
    expect(user).to be_invalid
  end

  it 'is invalid without a display name' do
    user.display_name = nil
    expect(user).to be_invalid
  end

  it 'is invalid when a user with the same display name already exists' do
    create(:user, display_name: user.display_name)
    expect(user).to be_invalid
  end

  it 'is invalid without a password' do
    user.password = nil
    expect(user).to be_invalid
  end

  it 'is invalid with a password confirmation that does not match the password' do
    user.password_confirmation = 'not the same password'
    expect(user).to be_invalid
  end

  it 'sets a new-comment email when the user gets a new profile comment' do
    expect { create(:comment, commentable: user) }.to have_enqueued_mail(UserMailer, :new_comment)
      .with(user: user, comment: instance_of(Comment))
  end
end
