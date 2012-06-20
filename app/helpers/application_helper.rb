module ApplicationHelper
	def submit_to_popup(label, options = {})
    form_var = options[:form_id] ? "$('#{options[:form_id]}')" :
'this.form'

    url = case options[:url]
          when String then options[:url]
          when Hash   then url_for options[:url]
          else url_for
          end

    button_to_function label, "var
form=#{form_var};form.action='#{url}';form.target='_blank';form.submit();form.action='#{url_for}';form.target='';return
false"
  end 
end
