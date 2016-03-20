class Person < ApplicationRecord
  redcarpet_field :about, render_opts: {no_links: true}
end
