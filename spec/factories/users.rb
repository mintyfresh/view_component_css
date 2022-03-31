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
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email(name: display_name) }
    sequence(:display_name) { |n| "#{Faker::Internet.user_name} #{n}" }

    password { Faker::Internet.password }
    password_confirmation { password }

    trait :with_avatar do
      transient do
        avatar_url { Faker::LoremFlickr.image(size: '300x300', search_terms: ['mlp']) }
      end

      after(:build) do |user, e|
        file = URI.parse(e.avatar_url).open
        user.avatar.attach(io: file, filename: 'avatar.jpg')
      end
    end
  end
end
