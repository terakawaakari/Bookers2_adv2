class GroupsController < ApplicationController

 before_action :ensure_current_user, {only: [:edit, :update]}

 def index
   @book = Book.new
   @groups = Group.all
 end

  def new
    @group = Group.new
  end

  def show
    @book = Book.new
    @group = Group.find(params[:id])
  end

  def join
    @group = Group.find(params[:id])
    @group.users << current_user
    @group.save
    redirect_to group_path(@group), notice: "#{@group.name}グループに参加しました"
  end

  def leave
    @group = Group.find(params[:id])
    @group.users.delete(current_user)
    redirect_to groups_path, notice: "グループを退会しました"
  end


  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :introduction, :image, user_ids: [])
  end

  def ensure_current_user
    group = Group.find(params[:id])
    if group.owner_id != current_user.id
      redirect_to groups_path, alert: "権限がありません"
    end
  end

end
