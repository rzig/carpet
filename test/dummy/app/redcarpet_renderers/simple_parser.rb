class SimpleParser < Redcarpet::Render::HTML
  def paragraph(text)
    "*#{text}*"
  end
end
