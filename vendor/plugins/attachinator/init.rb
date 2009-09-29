# Include hook code here
require 'attachinator'

ActionView::Helpers::FormBuilder.send :include, Attachinator::FormBuilderExtensions