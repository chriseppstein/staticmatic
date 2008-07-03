module StaticMatic
  autoload :Builder,     'staticmatic/builder'
  autoload :Config,      'staticmatic/config'
  autoload :Deprecation, 'staticmatic/deprecation'
  autoload :Previewer,   'staticmatic/previewer'
  autoload :Rescue,      'staticmatic/rescue'
  
  module Helpers
    autoload :AssetTagHelper,    'staticmatic/helpers/asset_tag_helper'
    autoload :DeprecatedHelpers, 'staticmatic/helpers/deprecated_helpers'
    autoload :PageHelper,        'staticmatic/helpers/page_helper'
    autoload :UrlHelper,         'staticmatic/helpers/url_helper'
  end
  
  module TemplateHandlers
    autoload :Sass, 'staticmatic/template_handlers/sass'
  end
end

require 'staticmatic/actionpack_support/mime'