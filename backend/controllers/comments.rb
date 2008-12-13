class CommentsController < Ramaze::Controller
  map '/links/comments'
  def index(link_id)
    Comment.all(:link_id => link_id).collect { |comment| comment.values }.to_json
  end
  
  def create(link_id)
    params = request.params
    @comment = Comment.new(params.merge(:link_id => link_id))
    if @comment.valid?
      @comment.save.values.to_json
    else
      raise "Error"
    end
  end
end

# Rules
Restful_routes[%r!^/links/(\d+)/comments$!] = {
  :POST   => '/links/comments/create/%d',
  :GET    => '/links/comments/index/%d'
}
