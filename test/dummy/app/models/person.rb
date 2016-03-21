class Person < ApplicationRecord
  redcarpet :about, render_opts: {no_links: true}
  redcarpet :name, renderer: :simple_parser
end
