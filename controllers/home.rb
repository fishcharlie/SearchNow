class Sticky < Sinatra::Base

  set :method_override, true

  # index
  get '/' do
    @notes = Note.all
    erb(:"home")
  end

  # create
  post '/stickies' do
    @note = Note.new(params[:note])
    if @note.save
      redirect("/")
    else
      erb(:"/stickies/new")
    end
  end

  get '/new/stickies' do
    erb(:"new")
  end

  # delete
  delete '/stickies/:id/delete' do
    @note = Note.find(params[:id])
    if @note.destroy
      redirect('/')
    else
      redirect("/")
    end
  end


  # edit
  put '/stickies/:id' do
    @note = Note.find(params[:id])
    if @note.update_attributes(params[:note])
      redirect("/")
    else
      redirect("/")
    end
  end

  get '/stickies/:id/edit' do
    @note = Note.find(params[:id])
    erb(:"edit")
  end





end
