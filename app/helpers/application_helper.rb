module ApplicationHelper
  def display_rate_with_color(rate)
    return '-' if rate.nil?
    klass = rate.positive? ? 'text-green-700' : 'text-red-700'
    content_tag(:span, number_to_percentage(rate.abs, precision: 6), class: klass)
  end

  def calculate_arb(rate1, rate2)
    return '-' if rate1.nil? || rate2.nil?
    display_rate_with_color(rate1 - rate2)
  end
end
