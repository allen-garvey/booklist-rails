module ApplicationHelper
	module BootstrapExtension
		FORM_CONTROL_CLASS = "form-control"

		# Override the 'text_field_tag' method defined in FormTagHelper[1]
		#
		# [1] https://github.com/rails/rails/blob/master/actionview/lib/action_view/helpers/form_tag_helper.rb
		def text_field(name, value = nil, options = {})
			set_class(options)
			super
		end
		def date_field(name, value = nil, options = {})
			set_class(options)
			super
		end
		def number_field(name, value = nil, options = {})
			set_class(options)
			super
		end
		def select(name, choices=nil, options = {}, something=nil, html_options=nil)
			set_class(html_options)
			super
		end
		def set_class(options)
			class_name = options[:class]
			if class_name.nil?
				# Add 'form-control' as the only class if no class was provided
				options[:class] = FORM_CONTROL_CLASS
			else
				# Add ' form-control' to the class if it doesn't already exist
				options[:class] << " #{FORM_CONTROL_CLASS}" if " #{class_name} ".index(" #{FORM_CONTROL_CLASS} ").nil?
			end
		end
	end

	# Add the modified method to ApplicationHelper
	include BootstrapExtension
end
