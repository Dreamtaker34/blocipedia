class CollaboratorsController < ApplicationController
  def index
  end

  def about
  end

  def create
    #retrieve the wiki
    @wiki = Wiki.find(params[:wiki_id])
    #collaborators object for if the function errors out
    @collaborators = @wiki.collaborators
    #retrieve th3e user associated with the email
    @user = User.find_by(email: params[:user][:email])
    #create a new collaborator, we do it here also in case if it errors out
    @collaborator = Collaborator.new(wiki: @wiki)
    #see if user exists according to email
    if @user
      # attach user to collaborator, we do this separately again because if function errors out we want to have a collaborators object
      @collaborator.user = @user
      authorize @collaborator
      if @collaborator.save
        flash[:notice] = "Wiki was saved."
        redirect_to @wiki
      else
        # raise
        flash.now[:alert] = "There was an error saving the wiki. Please try again."
        render "wikis/edit"
      end
    else
      flash.now[:alert] = "No user associated w/ the email entered.."
      render "wikis/edit"
    end

  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render "wikis/show"
    end
  end
end
