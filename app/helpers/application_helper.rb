module ApplicationHelper
  def display_rate_with_color(rate)
    return '-' if rate.nil?
    klass = rate.positive? ? 'text-green-700' : 'text-red-700'
    content_tag(:span, number_to_percentage(rate.abs, precision: 6), class: klass)
  end
end
