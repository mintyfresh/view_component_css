# frozen_string_literal: true

module Email
  class FooterComponent < ApplicationComponent
    def initialize
      @company = Rails.application.config.x.company
    end
  end
end
