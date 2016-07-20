class Sticky < Sinatra::Base

  set :method_override, true

  # index
  get '/' do
    @notes = Notes.all
    erb(:"home")
  end


end
