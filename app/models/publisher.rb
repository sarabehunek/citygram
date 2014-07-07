module Citygram
  module Models
    class Publisher < Sequel::Model
      one_to_many :subscriptions
      one_to_many :events

      set_allowed_columns :title, :endpoint, :city, :active, :icon

      plugin Citygram::Models::Plugins::URLValidation

      def validate
        super
        validates_presence [:title, :endpoint, :city, :icon]
        validates_url :endpoint
        validates_unique :title
        validates_unique :endpoint
      end
    end
  end
end
