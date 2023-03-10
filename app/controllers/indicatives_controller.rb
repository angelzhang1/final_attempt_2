class IndicativesController < ApplicationController
  def index
    self.load_current_user
    #code for restricting drop down verbs to the user's own verbs
    matching_verbs = @current_user.verbs
    @list_of_verbs = matching_verbs.order({ :created_at => :desc })

    #code for the table of all indicatives created
    matching_indicatives = Indicative.all
    #@matching_verbs = @current_user.verbs
    #matching_indicatives = @matching_verbs.indicatives
    @list_of_indicatives = matching_indicatives.order({ :created_at => :desc })

    render({ :template => "indicatives/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_indicatives = Indicative.where({ :id => the_id })

    @the_indicative = matching_indicatives.at(0)

    render({ :template => "indicatives/show.html.erb" })
  end

  def create
    the_indicative = Indicative.new
    the_indicative.verb_id = params.fetch("query_verb_id")
    the_indicative.pov_id = params.fetch("query_pov_id")
    the_indicative.present_conjugation = params.fetch("query_present_conjugation")
    the_indicative.preterite_conjugation = params.fetch("query_preterite_conjugation")
    the_indicative.imperfect_conjugation = params.fetch("query_imperfect_conjugation")

    if the_indicative.valid?
      the_indicative.save
      redirect_to("/indicatives/#{the_indicative.id}", { :notice => "Indicative created successfully." })
    else
      redirect_to("/indicatives", { :alert => the_indicative.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_indicative = Indicative.where({ :id => the_id }).at(0)

    the_indicative.verb_id = params.fetch("query_verb_id")
    the_indicative.pov_id = params.fetch("query_pov_id")
    the_indicative.present_conjugation = params.fetch("query_present_conjugation")
    the_indicative.preterite_conjugation = params.fetch("query_preterite_conjugation")
    the_indicative.imperfect_conjugation = params.fetch("query_imperfect_conjugation")

    if the_indicative.valid?
      the_indicative.save
      redirect_to("/indicatives/#{the_indicative.id}", { :notice => "Indicative updated successfully." })
    else
      redirect_to("/indicatives/#{the_indicative.id}", { :alert => the_indicative.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_indicative = Indicative.where({ :id => the_id }).at(0)

    the_indicative.destroy

    redirect_to("/verbs", { :notice => "Indicative deleted successfully." })
  end
end
