class CommentsController < Ramaze::Controller
  map '/links/comments'
  def list(link_id)
    # Link.create(:title => 'google', :description => 'the browser', :url => 'http://google.es')
    # Link.create(:title => 'yahoo', :description => 'the other', :url => 'http://yahoo.com')

    @comments = Comment.all(:link_id => link_id)
    result = {
      :records => @comments.collect { |comment| comment.values },
      :ids => @comments.collect { |comment| comment.id }
    }.to_json
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
