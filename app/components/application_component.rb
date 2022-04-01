# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  include ApplicationHelper

  # @return [String]
  def component_stylesheet_name
    "#{self.class.name.underscore}.css"
  end

  # @return [String]
  def component_stylesheet_link_tag
    stylesheet_link_tag(component_stylesheet_name)
  end
end
