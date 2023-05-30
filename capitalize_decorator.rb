# frozen_string_literal: true

require_relative('./base_decorator')

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
