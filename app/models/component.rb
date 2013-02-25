class Component
  include Mongoid::Document

  embedded_in :template
  embedded_in :multi_row_column

  def to_html
    ''
  end
end
