class Template
  include Mongoid::Document

  field :title, type: String
  field :category, type: String

  belongs_to :user
  embeds_many :components

end
