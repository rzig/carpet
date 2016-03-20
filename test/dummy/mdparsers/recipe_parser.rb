require 'redcarpet'

## A custom markdown parser, which is safe and puts checkboxes for list items.

class RecipeParser < Redcarpet::Render::HTML
  # Use Smarty Pants for HTML character generation
  include Redcarpet::Render::SmartyPants
  # Remove any multiline embedded code.
  #
  # @param code [String] The code to remove
  # @param language [String] The language of the code to remove
  # @return [nil] Nothing, this removes code
  def block_code(code, language)
    nil
  end

  # Remove any inline embedded code.
  #
  # @param code [String] The code to remove
  # @return [nil] Nothing, this removes code
  def codespan(code)
    nil
  end

  # Remove any headers.
  #
  # @param title [String] The header text
  # @param level [Integer] The header level
  # @return [String] The header text stripped of the header
  def header(title, level)
    "#{title} <br/>"
  end
  # Return the contents of a paragraph, without the <p> tag.
  #
  # @param text [String] The body of the paragraph
  # @return [String] The body of the paragraph
  def paragraph(text)
    text
  end

  # Return a list with items in it.
  #
  # @param content [String] The content of the list
  # @param list_type [Symbod] The type of list
  # @return [String] The formatted list
  def list(content, list_type)
    "<ul>#{content}</ul>"
  end

  # Return a list item, with a checkbox before it.
  #
  # @param content [String] The content of the list item
  # @param list_type [Symbol] The type of list
  # @return [String] The formatted list item
  def list_item(content, list_type)
    "<li><input type='checkbox'>#{content}</li>"
  end

  # Remove a table.
  #
  # @param header [String] The table header
  # @param body [String] The table body
  # @return [nil] Return nothing to remove the table
  def table(header, body)
    nil
  end

  # Remove a table row.
  #
  # @param content [String] The row's content
  # @return [nil] Return nothing to remove the row
  def table_row(content)
    nil
  end

  # Remove a table cell.
  #
  # @param content [String] The cell's content
  # @param alignment [String] The cell's alignment
  # @return [nil] Return nothing to remove the cell
  def table_cell(content, alignment)
    nil
  end

  # Remove <hr> element.
  #
  # @return [nil] Return nothing to remove the <hr>
  def hrule
    nil
  end

  # Remove footnote.
  #
  # @param content [String] Content of the footnote
  # @return [nil] Return noting to remove the footnote
  def footnote(content)
    nil
  end

  # Remove footnote definition.
  #
  # @param content [String] Footnote's content
  # @param number [Integer] Footnote's number
  # @return [nil] Return nothing to remove the footnote definition
  def def_footnote(content, number)
    nil
  end

  # Remove a footnote reference
  #
  # @param number [Integer] The footnote number
  # @return [nil] Return nothing to remove the footnote ref
  def footnote_ref(number)
    nil
  end

  # Remove block html.
  #
  # @param content [String] HTML block's content
  # @return [nil] Return nothing to remove the block html
  def block_html
    nil
  end

  # Remove a block quote.
  #
  # @param quote [String] Quote's content
  # @return [nil] Return nothing to remove the quote
  def block_quote(quote)
    nil
  end

  # Remove an auto-generated link.
  #
  # @param link [String] URL to link to
  # @param link_type [String] The type of link
  # @return [nil] Return nothing to remove the link
  def autolink(link, link_type)
    nil
  end

  # Remove an image.
  #
  # @param link [String] Image's URL
  # @param title [String] Image's title
  # @param content [String] Image content
  # @return [nil] Return nothing to remove the image
  def image(link, title, content)
    nil
  end

  # Remove a manually-generated link.
  # @param link [String] Link's URL
  # @param title [String] Link's title
  # @param content [String] Link's content
  # @return [nil] Return nothing to remove the link
  def link(link, title, content)
    nil
  end

  # Remove raw HTML.
  #
  # @param raw_html [String] Raw HTML
  # @return [nil] Return nothing to remove the raw html
  def raw_html(raw_html)
    nil
  end

  # Remove HTML header.
  #
  # @return [nil] Return nothing to remove the HTML header
  def doc_header
    nil
  end

  # Remove HTML footer.
  #
  # @return [nil] Return nothing to remove the HTML footer
  def doc_footer
    nil
  end
end
