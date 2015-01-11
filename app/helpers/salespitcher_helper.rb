module SalespitcherHelper
  def redactor_text_area form, obj, attribute, options = {}
    casein_form_tag_wrapper(form.text_area(attribute, strip_casein_options(options_hash_with_merged_classes(options, 'form-control redactor'))), form, obj, attribute, options).html_safe
  end

  def redactor_text_area_no_well form, obj, attribute, options = {}
    form.text_area(attribute, strip_casein_options(options_hash_with_merged_classes(options, 'form-control redactor'))).html_safe
  end

  def btn_mini_show_icon icon_name
    "<div class='icon' style='line-height: 1;'><span class='glyphicon glyphicon-#{icon_name}'></span></div>".html_safe
  end

  def gastrovia_get_footer_string include_version = false
    if include_version
      "Ein Service von #{link_to 'Gastrovia', 'http://www.gastrovia.ch'} #{casein_get_full_version_string}.".html_safe
    else
      "Ein Service von #{link_to 'Gastrovia', 'http://www.gastrovia.ch'}.".html_safe
    end
  end

  def tel_tag(phonenumber)
    "tel:" + phonenumber.gsub(/\s+/, "").to_s
  end
end
