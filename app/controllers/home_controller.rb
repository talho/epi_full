class HomeController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def index
    @ili_templates = current_user.templates.where(category: 'ili')
    @gun_templates = current_user.templates.where(category: 'gun')
    @obesity_templates = current_user.templates.where(category: 'obesity')

    respond_with(@ili_templates, @gun_templates, @obesity_templates)
  end
end
