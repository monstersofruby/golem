class VotesController < Ramaze::Controller
  map '/links/votes'
  
  def create(link_id)
    @link = Link.find(:id => link_id)
    @link.vote!
  end
end

# Rules
Restful_routes[%r!^/links/(\d+)/votes$!] = {
  :POST   => '/links/votes/create/%d',
}

