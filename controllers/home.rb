class Sticky < Sinatra::Base

  set :method_override, true

  # index
  get '/' do
    @notes = Note.all
    erb(:"home")
  end


end
