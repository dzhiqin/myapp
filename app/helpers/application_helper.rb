module ApplicationHelper
  def kramdown(content)
    require 'kramdown'

    Kramdown::Document.new(content).to_html
  end
end
