# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  author_id        :integer          not null
#  commentable_type :string           not null
#  commentable_id   :integer          not null
#  message          :text             not null
#  likes_count      :integer          default(0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_comments_on_author_id    (author_id)
#  index_comments_on_commentable  (commentable_type,commentable_id)
#
# Foreign Keys
#
#  author_id  (author_id => users.id)
#
FactoryBot.define do
  factory :comment do
    association :author, factory: :user, strategy: :build
    association :commentable, factory: :user, strategy: :build
    
    message { Faker::Lorem.sentence }
  end
end
