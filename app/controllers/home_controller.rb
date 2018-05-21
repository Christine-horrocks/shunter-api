
class HomeController < ApplicationController
  before_action :disable_top_navigation, :disable_status_banner
  before_action :data_check, :build_request, except: :index

  before_action :enable_top_navigation, :enable_status_banner, except: :index
  before_action :enable_pingdom, only: :mps

  def index
    render_page(PageSerializer::HomePageSerializer.new)
  end
end
