module PeopleHelper
  def person_form_for(type_name)
    concat content_tag(:h1, "Edit #{type_name} for #{@person.name}")
    form_for @person, :html => { :multipart => true } do |form|
      yield form
      concat form.submit("Save")
      concat " or "
      concat link_to("cancel", person_path(@person))
    end
  end
end