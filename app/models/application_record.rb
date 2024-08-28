# frozen_string_literal: true

# Base Class containing shared methods for models
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
