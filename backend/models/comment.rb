class Comment < Sequel::Model(:comments)
  set_schema do
    primary_key :id
    varchar :author
    text :body
    integer :link_id
    datetime :creted_at
    datetime :updated_at
  end
  
  belongs_to :link
  validates_presence_of :author, :body, :link_id
end
