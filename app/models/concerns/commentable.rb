# frozen_string_literal: true

module Commentable
  extend ActiveSupport::Concern

  included do
    attr_accessor :comment

    define_model_callbacks :comment_create, :comment_destroy
    define_model_callbacks :comment_create_commit, :comment_destroy_commit, only: [:after]

    has_many :comments, as: :commentable, dependent: :destroy, inverse_of: :commentable
  end
end
