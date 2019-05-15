class AppController < Sinatra::Base
	set :views, 'app/views/main'
	set :method_override, true

	get '/' do
		erb :index
	end
end