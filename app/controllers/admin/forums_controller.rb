class Admin::ForumsController < ApplicationController
  before_filter :find_Forum, :only => [:show, :edit, :update, :destroy]

  include AuthenticatedSystem
  before_filter :login_required
  before_filter :check_admin

  def index
    @forums = Forum.all
  end

  def show
    sort_params = { "by_user" => "user_id", "by_date" => "created_at DESC",
                    "by_id" => "id", "by_update" => "updated_at"  }
    #@posts = @forum.posts.order(:id).page(params[:page]).per(5)
    @posts = @forum.posts.test_order(sort_params[params[:sort]]).page(params[:page]).per(5)
  end

  def new
    @forum = Forum.new
  end

  def edit
  end

  def create
    @forum = Forum.new(params[:forum])

    if @forum.save
      redirect_to(@forum, :notice => '新增一個版')
    else
      render :action => "new"
    end
  end

  def update
    if @forum.update_attributes(params[:forum])
      redirect_to(@forum, :notice => 'Forum updated...lol')
    else
      render :action => "edit"
    end
  end

  def destroy
    @forum.destroy

    redirect_to(forums_url)
  end

  protected

  def find_Forum
    @forum = Forum.find(params[:id])
  end

  def check_admin
    if !(current_user.is_admin)
      redirect_to(forums_path, :notice => '你 不 能 過 ！')
    end
  end
end
