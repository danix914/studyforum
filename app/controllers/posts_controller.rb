class PostsController < ApplicationController

  before_filter :find_forum
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]

  include AuthenticatedSystem
  before_filter :login_required, :except => [:index, :show]

  def index
    @posts = @forum.posts.order(:id).page(params[:page]).per(3)
  end

  def show
    #@post = @forum.posts.find(params[:id])
  end

  def new
    @post = @forum.posts.new
    @post.author = :current_user
  end

  def edit
  end

  def create
    @post = @forum.posts.new(params[:post])

    if @post.save
      redirect_to(forum_post_path(@forum, @post), :notice => '新增文章.')
    else
      render :action => "new"
    end
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to(forum_post_path(@forum, @post), :notice => 'Post updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to forum_posts_path(@forum)
  end

  protected

  def find_forum
    @forum = Forum.find(params[:forum_id])
  end

  def find_post
    @post = @forum.posts.find(params[:id])
  end
end
