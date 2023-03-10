class VerbsController < ApplicationController
  def index
    self.load_current_user
    matching_verbs = @current_user.verbs

    @list_of_verbs = matching_verbs.order({ :created_at => :desc })

    render({ :template => "verbs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_verbs = Verb.where({ :id => the_id })

    @the_verb = matching_verbs.at(0)

    matching_indicatives = Indicative.all

    matching_indicatives_link = Indicative.where({ :verb_id => the_id })

    @the_indicative_yo_link = matching_indicatives_link.at(0)
    @the_indicative_tu_link = matching_indicatives_link.at(1)
    @the_indicative_usted_link = matching_indicatives_link.at(2)
    @the_indicative_nos_link = matching_indicatives_link.at(3)
    @the_indicative_os_link = matching_indicatives_link.at(4)
    @the_indicative_ellos_link = matching_indicatives_link.at(5)

    render({ :template => "verbs/show.html.erb" })
  end

  def create
    the_verb = Verb.new
    the_verb.verb_description = params.fetch("query_verb_description")
    the_verb.user_id = session.fetch(:user_id)

    if the_verb.valid?
      the_verb.save
      redirect_to("/verbs", { :notice => "Verb created successfully." })
    else
      redirect_to("/verbs", { :alert => the_verb.errors.full_messages.to_sentence })
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
