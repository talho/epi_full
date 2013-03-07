class Component
  include Mongoid::Document

  embedded_in :template
  embedded_in :multi_row_column

  def self.find_by_loc_ids(loc_ids)
    curr = Template.find(loc_ids.first)
    loc_ids[1..-1].each do |val|
      curr = curr.components.find(val)
    end
    curr
  end

  def loc_ids
    ids = [self.id]
    curr = self
    begin
      curr = curr.template.nil? ? curr.multi_row_column : curr.template
      ids.unshift(curr.id)
    end until curr.is_a? Template

    ids
  end
end
