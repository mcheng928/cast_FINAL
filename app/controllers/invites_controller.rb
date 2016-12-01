class InvitesController < ApplicationController
  def index
    @invites = Invite.all

    render("invites/index.html.erb")
  end

  def show
    @invite = Invite.find(params[:id])

    render("invites/show.html.erb")
  end

  def new
    @invite = Invite.new

    render("invites/new.html.erb")
  end

  def create
    @invite = Invite.new

    @invite.event_id = params[:event_id]
    @invite.invitee_id = params[:invitee_id]

    save_status = @invite.save

    if save_status == true
      redirect_to("/invites/#{@invite.id}", :notice => "Invite created successfully.")
    else
      render("invites/new.html.erb")
    end
  end

  def edit
    @invite = Invite.find(params[:id])

    render("invites/edit.html.erb")
  end

  def update
    @invite = Invite.find(params[:id])

    @invite.event_id = params[:event_id]
    @invite.invitee_id = params[:invitee_id]

    save_status = @invite.save

    if save_status == true
      redirect_to("/invites/#{@invite.id}", :notice => "Invite updated successfully.")
    else
      render("invites/edit.html.erb")
    end
  end

  def destroy
    @invite = Invite.find(params[:id])

    @invite.destroy

    if URI(request.referer).path == "/invites/#{@invite.id}"
      redirect_to("/", :notice => "Invite deleted.")
    else
      redirect_to(:back, :notice => "Invite deleted.")
    end
  end
end
