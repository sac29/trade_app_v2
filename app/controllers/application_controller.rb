class ApplicationController < ActionController::Base
  before_action :set_flash_metadata

  private
  def set_flash_metadata
    if !flash.blank?
      @flash_metadata = Hash.new
      @flash_metadata[:title] = flash[:title]
      @flash_metadata[:msg] = flash[:msg]
      @flash_metadata[:type] = flash[:type]
    end
  end
end
