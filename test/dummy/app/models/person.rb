class Person < ApplicationRecord
  redcarpetable :about, render_opts: {no_links: true}
  redcarpetable :name, renderer: :simple_parser, as: :cool_name
end
