class Link < Sequel::Model(:links)
  set_schema do
    primary_key :id
    varchar :title
    varchar :url
    varchar :description
    integer :votes, :default => 0
  end
  
  has_many :comments
  validates_presence_of :title, :url
  validates_format_of :url, :with => /^http:\/\//
  
  def vote!
    update(:votes => votes + 1)
  end
  
  def votes
    self.values[:votes] || 0
  end
end
