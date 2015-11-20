module AddUrlProtocol
  extend ActiveSupport::Concern
  included do
    before_validation :add_link_protocol
  end

  protected

  def add_link_protocol
    unless self.link[/\Ahttp:\/\//] || self.link[/\Ahttps:\/\//]
      self.link = "http://#{self.link}"
    end
  end
end