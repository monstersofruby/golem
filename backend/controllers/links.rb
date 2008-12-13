class LinksController < Ramaze::Controller
  map '/links/links'
  def index
    Link.all.collect { |link| link.values }.to_json
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
  :GET    => '/links/links/show/%d',
  :PUT    => '/links/links/update/%d',
  :DELETE => '/links/links/delete/%d'
}

Restful_routes[%r!^/links$!] = {
  :POST   => '/links/links/create',
  :GET    => '/links/links/index'
}

Restful_routes[%r!^/$!] = {
  :GET    => '/links/links/index'
}