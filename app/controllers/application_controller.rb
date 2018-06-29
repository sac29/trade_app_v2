class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :set_flash_metadata
  helper_method :current_user

  private
  def set_flash_metadata
    if flash.present?
      @flash_metadata = Hash.new
      @flash_metadata[:title] = flash[:title]
      @flash_metadata[:msg] = flash[:msg]
      @flash_metadata[:type] = flash[:type]
    end
  end

  def require_login
    if current_user.blank?
      redirect_to '/'
    end
  end

  def without_user
    if current_user.present?
      redirect_to '/trades/index'
    end
  end
end
