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
class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', inverse_of: :authored_comments
  belongs_to :commentable, polymorphic: true

  validates :message, length: { minimum: 5, maximum: 1000 }

  before_validation if: :message_changed? do
    self.message = message.to_s.squish
  end

  around_create do |_, block|
    commentable.comment = self
    commentable.run_callbacks(:comment_create, &block)
  ensure
    commentable.comment = nil
  end

  around_destroy do |_, block|
    commentable.comment = self
    commentable.run_callbacks(:comment_destroy, &block)
  ensure
    commentable.comment = nil
  end

  after_create_commit do
    commentable.comment = self
    commentable.run_callbacks(:comment_create_commit)
  ensure
    commentable.comment = nil
  end

  after_destroy_commit do
    commentable.comment = self
    commentable.run_callbacks(:comment_destroy_commit)
  ensure
    commentable.comment = nil
  end
end
