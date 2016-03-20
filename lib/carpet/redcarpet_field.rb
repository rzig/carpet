module Carpet
  module RedcarpetField
    extend ActiveSupport::Concern

    module ClassMethods

      def redcarpet_field(*fields)
        fields.each do |field|
          define_method "parsed_#{field}" do
            puts read_attribute(field)
          end

        end

      end

    end
  end
end

ActiveRecord::Base.send :include, Carpet::RedcarpetField
