module ApplicationHelper

  # points description
  # @param array_of_points [Array] [[0,0] , [20,200]]
  #
  # @return [String] "0,0 20,200"
  def points(array_of_points)
    array_of_points.map { |z| z.map { |a| convert(a) }.join(",") }.join(" ")
  end

  # [convert description]
  # @param distance [Float] 2.5m
  #
  # @return [pixel] Integer
  def convert(distance)
    distance * 100 * @convert_cm_in_px
  end
end
