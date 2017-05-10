class DashboardController < ApplicationController
  def index
    @view_port_width = 800.0
    @view_port_height = 450

    max_width_cm = 1800.0
    @convert_cm_in_px = @view_port_width / max_width_cm
  end
end
