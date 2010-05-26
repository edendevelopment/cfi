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
  
  def output_fields_for(object)
    return if object.nil?
    outputter = FieldOutputter.new(object)
    yield outputter
  end
  
  class FieldOutputter < ActionView::Base
    
    def initialize(object)
      @object = object
    end
    
    def text(field_name, options = {})
      output(field_name, simple_format(@object.send(field_name)), options)
    end
    
    def boolean(field_name, options = {})
      output(field_name, @object.send(field_name) ? "Yes" : "No", options)
    end
    
    def output(field_name, field_value, options = {})
      options[:label_name] ||= field_name.humanize
      options[:class_name] ||= options[:label_name].parameterize
      
      content_tag(:div) do 
        content_tag(:span, options[:label_name], :class => "label") +
        content_tag(:span, field_value, :class => options[:class_name])
      end
    end
  end
end