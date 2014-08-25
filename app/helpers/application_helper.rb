module ApplicationHelper

  def get_field_tag question
    if question.custom_field.name == "Numeric"
      tag("input", type: 'number', name:  "survey[#{question.id}][]", class: "survey_number required")
    elsif question.custom_field.name == "Essay"
      content_tag(:textarea, "", name:  "survey[#{question.id}][]", class: "survey_area required")
    elsif question.custom_field.name == "Radio Button"
      radio = ''
      options = question.options.split("\n")
      options.collect{ |text| radio += tag("input", type: 'radio', name:  "survey[#{question.id}][]", value: text, class: "survey_radio required")  + text }
      return raw(radio)
    elsif question.custom_field.name == "Date"
      tag("input", type: 'text', name:  "survey[#{question.id}][]", class: "survey_date required", autocomplete: "off")
    elsif  question.custom_field.name == "Check Box" 
      checkbox = ''
      options = question.options.split("\n")
      options.collect{ |text| checkbox += tag("input", type: 'checkbox', name:  "survey[#{question.id}][]", value: text, class: "survey_check_box required")  + text }
      return raw(checkbox)
    end
  end

end
