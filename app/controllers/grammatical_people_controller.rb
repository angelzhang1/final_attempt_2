class GrammaticalPeopleController < ApplicationController
  def index
    matching_grammatical_people = GrammaticalPerson.all

    @list_of_grammatical_people = matching_grammatical_people.order({ :created_at => :desc })

    render({ :template => "grammatical_people/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_grammatical_people = GrammaticalPerson.where({ :id => the_id })

    @the_grammatical_person = matching_grammatical_people.at(0)

    render({ :template => "grammatical_people/show.html.erb" })
  end

  def create
    the_grammatical_person = GrammaticalPerson.new
    the_grammatical_person.pov = params.fetch("query_pov")

    if the_grammatical_person.valid?
      the_grammatical_person.save
      redirect_to("/grammatical_people", { :notice => "Grammatical person created successfully." })
    else
      redirect_to("/grammatical_people", { :alert => the_grammatical_person.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_grammatical_person = GrammaticalPerson.where({ :id => the_id }).at(0)

    the_grammatical_person.pov = params.fetch("query_pov")

    if the_grammatical_person.valid?
      the_grammatical_person.save
      redirect_to("/grammatical_people/#{the_grammatical_person.id}", { :notice => "Grammatical person updated successfully."} )
    else
      redirect_to("/grammatical_people/#{the_grammatical_person.id}", { :alert => the_grammatical_person.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_grammatical_person = GrammaticalPerson.where({ :id => the_id }).at(0)

    the_grammatical_person.destroy

    redirect_to("/grammatical_people", { :notice => "Grammatical person deleted successfully."} )
  end
end
