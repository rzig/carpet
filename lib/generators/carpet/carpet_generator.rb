class CarpetGenerator < Rails::Generators::Base
  desc "Create a new markdown parser. Type in the name like my_parser"

  source_root File.expand_path("../templates", __FILE__)

  class_option :name
  def create_initializer_file
    template "parser.rb.erb", "mdrenderers/#{options[:name]}.rb"
  end
end
