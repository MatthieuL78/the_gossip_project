class CommentsController < ApplicationController

  before_action :check_login, only: [:new, :create, :edit, :update, :destroy]

	def new 
	  @comment = Comment.new
	end

	def create
	  @comment = Comment.create(content: params[:comment], date: Time.now, gossip_id: Integer(params[:id]), user_id: current_user.id)
	  if @comment.save
	  	redirect_to gossip_path(@comment.gossip_id)
	  else
	  	redirect_to root_path
	  end
	end

	def edit
	  @comment = Comment.find(params[:id])
	  unless @comment.user_id == current_user.id
	  	redirect_to gossip_path(@comment.gossip_id)
	  end
	end

	def update
	  @comment = Comment.find(params[:id])
	  @comment.content = params[:comment][:content]
	  @comment.date = Time.now
	  @comment.save
	  if @comment.save
	  	redirect_to gossip_path(Integer(@comment.gossip_id))
	  else
	  	redirect_to root_path
	  end
	end

	def destroy
	  @gossip_id = Comment.find(params[:id]).gossip_id
		  Comment.find(params[:id]).delete
		  redirect_to gossip_path(@gossip_id)
		end

end
