class Message
  include ActiveAttr::Model

  attribute :title
  attribute :author
  attribute :summary

  attr_accessible :title, :author, :summary
  
  validates_presence_of :title
  validates_presence_of :author
  validates_presence_of :summary
  validates_length_of :summary, :maximum => 300
end