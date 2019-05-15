class CatsController < Sinatra::Base
	set :views, 'app/views/cats'
	set :method_override, true

	get '/cats' do
		erb :index
	end

	post '/cats' do
		params[:owner] = Owner.find_or_create_by(name: params[:owner_name].capitalize)
		params.delete(:owner_name)
		params[:name] = params[:name].capitalize
		redirect "/cats/#{Cat.create(params).id}"
	end

	get '/cats/new' do
		erb :new
	end

	get '/cats/:id' do
		@cat = Cat.find(params[:id])
		erb :show
	end

	patch '/cats/:id' do
		params[:owner] = Owner.find_or_create_by(name: params[:owner_name].capitalize)
		params.delete(:owner_name)
		params.delete(:_method)
		params[:name] = params[:name].capitalize
		redirect "/cats/#{Cat.update(params[:id], params).id}"
	end

	delete '/cats/:id' do
		Cat.delete(params[:id])
		redirect '/cats'
	end

	get '/cats/:id/edit' do
		@cat = Cat.find(params[:id])
		erb :edit
	end
end
