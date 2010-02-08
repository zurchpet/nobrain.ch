#To add I18n to will_paginate gem
include WillPaginate::ViewHelpers

# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def will_paginate_with_i18n(collection, options = {})
    will_paginate_without_i18n(collection, options.merge(:previous_label => "< Neuere", :next_label => "Ältere >"))
  end
  alias_method_chain :will_paginate, :i18n
end
