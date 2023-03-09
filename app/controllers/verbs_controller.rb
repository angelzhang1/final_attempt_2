class VerbsController < ApplicationController
  def index
    matching_verbs = Verb.all

    @list_of_verbs = matching_verbs.order({ :created_at => :desc })

    render({ :template => "verbs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_verbs = Verb.where({ :id => the_id })

    @the_verb = matching_verbs.at(0)

    render({ :template => "verbs/show.html.erb" })
  end

  def create
    the_verb = Verb.new
    the_verb.verb_description = params.fetch("query_verb_description")
    the_verb.user_id = session.fetch(:user_id)

    if the_verb.valid?
      the_verb.save
      redirect_to("/my_page", { :notice => "Verb created successfully." })
    else
      redirect_to("/my_page", { :alert => the_verb.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_verb = Verb.where({ :id => the_id }).at(0)

    the_verb.verb_description = params.fetch("query_verb_description")
    the_verb.user_id = params.fetch("query_user_id")

    if the_verb.valid?
      the_verb.save
      redirect_to("/verbs/#{the_verb.id}", { :notice => "Verb updated successfully." })
    else
      redirect_to("/verbs/#{the_verb.id}", { :alert => the_verb.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_verb = Verb.where({ :id => the_id }).at(0)

    the_verb.destroy

    redirect_to("/verbs", { :notice => "Verb deleted successfully." })
  end
end
