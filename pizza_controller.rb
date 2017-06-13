require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza')

 #

get '/pizzas' do
  @pizzas = Pizza.all()
  erb( :index)
end

get '/pizzas/new' do # new
  erb ( :new)
end

get '/pizzas/:id' do # show
  @pizza = Pizza.find( params[:id])
  erb( :show)

end

get '/pizzas/update/:id' do
  @pizza = Pizza.find( params[:id])
  erb( :update)
end


post '/pizzas' do # create
  @pizza = Pizza.new( params )
  @pizza.save()
  erb( :create)
  end

  post '/pizzas/update' do # update
    @pizza = Pizza.new ( params )
    @pizza.update()
    erb( :index)
  end

  get '/pizzas/delete/id' do # delete
    @pizza = Pizza.find( params[:id])
    @pizza.delete()
    erb( :index)
  end

