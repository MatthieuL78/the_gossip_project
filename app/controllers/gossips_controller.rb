class GossipsController < ApplicationController
  
  before_action :check_login, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    @gossip = Gossip.all.sort_by { |gossip_id, user_id, name, date, content| date }.reverse
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create(name: params[:gossip][:name], date: Time.now, content: params[:gossip][:content], introduction: params[:gossip][:introduction], user_id: current_user.id)
    if @gossip.save
      redirect_to gossip_path(@gossip.id)
    else
      redirect_to root_path
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
  	@gossip = Gossip.find(params[:id])
    unless @gossip.user_id == current_user.id
      redirect_to gossip_path(@gossip.id)
    end
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.name = params[:gossip][:name]
    @gossip.date = Time.now
    @gossip.content = params[:gossip][:content]
    @gossip.save
    if @gossip.save
      redirect_to gossip_path(@gossip.id)
    else
      redirect_to root_path
    end
  end

  def destroy
  	Gossip.find(params[:id]).delete
  	redirect_to user_profile_path(current_user.id)
  end

end
