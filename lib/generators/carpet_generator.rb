class CarpetGenerator < Rails::Generators::NamedBase
  desc "Create a new markdown parser. Type in the name like my_parser"

  source_root File.expand_path("../templates", __FILE__)

  def create_initializer_file
    template "parser.rb.erb", "mdparsers/#{name}.rb"
  end
end
