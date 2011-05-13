class Admin::PostsController < ApplicationController

  before_filter :find_forum
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]

  include AuthenticatedSystem
  before_filter :login_required, :except => [:index, :show]
  before_filter :check_user, :only => [:edit, :update, :destroy]

  def index
    sort_params = { "by_user" => "user_id", "by_date" => "created_at DESC",
                    "by_id" => "id", "by_update" => "updated_at"  }
    #@posts = @forum.posts.order(:id).page(params[:page]).per(5)
    @posts = @forum.posts.test_order(sort_params[params[:sort]]).page(params[:page]).per(10)
  end

  def show
    #@post = @forum.posts.find(params[:id])
  end

  def new
    @post = @forum.posts.new
  end

  def edit
  end

  def create
    @post = @forum.posts.new(params[:post])
    @post.user_id = current_user.id

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
    redirect_to forum_path(@forum)
  end

  protected

  def find_forum
    @forum = Forum.find(params[:forum_id])
  end

  def find_post
    @post = @forum.posts.find(params[:id])
  end

  def check_user
    if !(current_user && @post.user_id == current_user.id)
      redirect_to(forum_path(@forum), :notice => '你 不 能 過 ！')
    end
  end
end
