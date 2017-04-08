require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  # end

  #CREATE ACTION:::
  #new - form to create a new blog post...
  #action="/posts" on new.erb form redirects to /posts
  get '/posts/new' do #form to create new blog post
    erb :new
  end

  #create a new blog post with Post.create(params) and post it to /posts
  post '/posts' do
    @new_post = Post.create(params) #create ActiveRecord method creates and saves new instance to database
    erb :index #index shows us our blog post
  end

  #READ ACTION:::
  #index action::::
  #show all the blog posts on the index
  get '/posts' do #gets posts
    @all_posts = Post.all #show all posts, set as instance variable @all_posts
    erb :index #index.erb page shows us our blog post
  end

  #show action::::
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  #update action::::
  get '/posts/:id/edit' do
    #@post = Post.find([params[:id])
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  #update action::::
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:edit_name], content: params[:edit_content])
    redirect to("/posts/#{@post.id}")
  end

  #destroy action:::
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
    #redirect to("/posts")
    erb :delete
  end


end #end class
