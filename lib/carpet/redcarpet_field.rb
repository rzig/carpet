module Carpet
  module RedcarpetField
    def redcarpet_field(^fields)
      fields.each do |field|
        define_method "parsed_#{field}" do
          puts read_attribute(field)
        end
      end
    end
  end
end
