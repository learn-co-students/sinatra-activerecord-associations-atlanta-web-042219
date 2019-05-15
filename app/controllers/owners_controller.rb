class OwnersController < Sinatra::Base
	set :views, 'app/views/owners'
	set :method_override, true

	get '/owners' do
		erb :index
	end

	post '/owners' do
		redirect "/owners/#{Owner.create(params).id}"
	end

	get '/owners/new' do
		erb :new
	end

	get '/owners/:id' do
		@owner = Owner.find(params[:id])
		erb :show
	end

	delete '/owners/:id' do
		Owner.destroy(params[:id])
		redirect '/owners'
	end
end
