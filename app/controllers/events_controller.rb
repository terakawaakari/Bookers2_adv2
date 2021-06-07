class EventsController < ApplicationController

	def new
	  @event = Event.new
	end

	def create
      @group = Group.find(params[:group_id])
	  member = @group.users
	  @event = Event.new(event_params)
	  if @event.save
	    UserMailer.send_mail(@event, member).deliver
		redirect_to group_preview_path(@group.id)
	  else
	  	render "new"
	  end
	end

	def preview
	  event = Event.find(params[:group_id])
	  @title = event.title
	  @body = event.body
	end

	private
	def event_params
	  params.permit(:title, :body)
	end

end
