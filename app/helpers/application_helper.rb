module ApplicationHelper
  # app/assets/images/icons/ 以下のSVGファイルを読み込んで、そのまま埋め込む。
  # fill="currentColor" / stroke="currentColor" を使っているので、
  # 呼び出し側の css_class でTailwindの色(text-primary等)をそのまま指定できる。
  def icon(name, css_class: nil)
    path = Rails.root.join("app/assets/images/icons/#{name}.svg")
    svg = File.read(path)
    svg = svg.sub("<svg ", %(<svg class="#{css_class}" )) if css_class
    svg.html_safe
  end
end
