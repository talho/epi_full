class Zip::Code
  include Mongoid::Document

  field :zip, type: String
  field :path, type: String
  field :coords, type: Array, default: []
  field :lat, type: Float
  field :lng, type: Float
  field :state_id, type: Integer
  field :detail_ids, type: Array, default: []

  def path
    self[:path] || self.coords.map{|c| "M#{c.first.join(" ")}L#{c.join(" ")}Z"}.join
  end
end
