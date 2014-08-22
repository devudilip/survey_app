module ApplicationHelper

  def get_field_tag question
    if question.custom_field.name == "Numeric"
      tag("input", type: 'number', name:  "survey[#{question.id}][]")
    elsif question.custom_field.name == "Essay"
      tag("input", type: 'text_area', name:  "survey[#{question.id}][]", class: "survey_area")
    elsif question.custom_field.name == "Radio Button"
      radio = ''
      options = question.options.split("\n")
      options.collect{ |text| radio += tag("input", type: 'radio', name:  "survey[#{question.id}][]", value: text)  + text }
      return raw(radio)
    elsif question.custom_field.name == "Date"
      tag("input", type: 'date', name:  "survey[#{question.id}][]")
    elsif  question.custom_field.name == "Check Box" 
      checkbox = ''
      options = question.options.split("\n")
      options.collect{ |text| checkbox += tag("input", type: 'checkbox', name:  "survey[#{question.id}][]", value: text)  + text }
      return raw(checkbox)
    end
  end

end
