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

  def door(x = 0, y = 0, rot = 0.0, state = :open)
    length = 1

    door_nut = content_tag(:circle, "", cx: convert(x), cy: convert(y + length), r: "2", class: "door-handle")
    case state
    when :open
      base_line = rotate_line(x, y, x, y + length, 0, "baseline")
      door_line = rotate_line(x, y + length, x, y, 45)
      door_handle = content_tag(:circle, "", cx: convert(x - 0), cy: convert(y + 0.2), r: "5", class: "door-handle", transform: "rotate(-45, #{convert(x)}, #{convert(y+1)})")
    when :closed
      base_line = ""
      door_line = rotate_line(x, y, x, y + length, 0)
      door_handle = content_tag(:circle, "", cx: convert(x - 0), cy: convert(y + 0.2), r: "5", class: "door-handle")
    end
    content_tag :g, transform: "rotate(#{rot}, #{convert(x)}, #{convert(y)})" do
      concat(base_line)
      concat(door_line)
      concat(door_handle)
      concat(door_nut)
    end
  end

  def window(x = 0, y = 0, rot = 0.0, state = :open)
    length = 1

    door_nut = content_tag(:circle, "", cx: convert(x), cy: convert(y + length), r: "2", class: "door-handle")
    case state
    when :open
      base_line = rotate_line(x, y, x, y + length, 0, "baseline")
      door_line = rotate_line(x, y + length, x, y, 45)
      door_handle = content_tag(:circle, "", cx: convert(x - 0), cy: convert(y + 0.2), r: "5", class: "door-handle", transform: "rotate(-45, #{convert(x)}, #{convert(y+1)})")
    when :closed
      base_line = ""
      door_line = rotate_line(x, y, x, y + length, 0)
      door_handle = content_tag(:circle, "", cx: convert(x - 0), cy: convert(y + 0.2), r: "5", class: "door-handle")
    end
    content_tag :g, transform: "rotate(#{rot}, #{convert(x)}, #{convert(y)})", class: "window" do
      concat(base_line)
      concat(door_line)
      concat(door_handle)
      concat(door_nut)
    end
  end

  def rotate_line(x1, y1, x2, y2, rot = 0.0, css_names = "")
    rot = rot * Math::PI / 180
    x1 = convert(x1)
    y1 = convert(y1)
    x2 = convert(x2)
    y2 = convert(y2)

    rotated_x2 = x1 + (x2 - x1) * Math.cos(rot.to_f) + (y2 - y1) * Math.sin(rot.to_f)
    rotated_y2 = y1 - (x2 - x1) * Math.sin(rot.to_f) + (y2 - y1) * Math.cos(rot.to_f)
    content_tag(:line, "", class: "door #{css_names}", x1: x1, y1: y1, x2: rotated_x2, y2: rotated_y2)
  end

end
