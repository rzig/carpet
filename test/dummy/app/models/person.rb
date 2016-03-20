class Person < ApplicationRecord
  redcarpet :about, render_opts: {no_links: true}
end
