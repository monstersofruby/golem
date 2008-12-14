class LinksController < Ramaze::Controller
  map '/links'
  def list
    @links = Link.all
    result = {
      :records => @links.collect { |link| link.values },
      :ids => @links.collect { |link| link.id }
    }.to_json
  end
  
  def create
    @link = Link.new(request.params)
    if @link.valid?
      @link.save.values.to_json
    else
      raise "Error"
    end
  end
  
  def show(id)
    Link.find(:id => id).values.to_json
  end
  
  def update(id)
    Link.find(:id => id).update(request.params).values.to_json
  end
end

# Rules
Restful_routes[%r!^/links/(\d+)$!] = {
  :GET    => '/links/show/%d',
  :PUT    => '/links/update/%d',
  :DELETE => '/links/delete/%d'
}

Restful_routes[%r!^/links$!] = {
  :POST   => '/links/create',
  :GET    => '/links/list'
}

Restful_routes[%r!^/$!] = {
  :GET    => '/links/list'
}