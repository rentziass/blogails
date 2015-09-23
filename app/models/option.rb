class Option < ActiveRecord::Base
  before_filter :set_default_options

  def set_default_options
    Option.create{
      {title: 'Blog'}
      {subtitle: 'Dio'}
      {footer: 'Cane'}
    }
  end
end
