class ForumsController < ApplicationController
  before_filter :find_Forum, :only => [:show, :edit, :update, :destroy]

  include AuthenticatedSystem
  #before_filter :login_required, :except => [:index, :show]

  def index
    @forums = Forum.all
  end

  def show
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
end
