module StaticPagesHelper
  def not_yet_attend?(day)
    day.strftime('%m/%d') == Date.today.strftime('%m/%d')
  end

  def attended(day)
    # day.strftime('%a, %d %b %Y') == current_user.attendances.where(recorded_on: Date.today.strftime('%a, %d %b %Y')).recorded_on.strftime('%a, %d %b %Y')
    # whereは複数取り出す。find_byは一つ
    day.strftime('%a, %d %b %Y') == current_user.attendances.find_by(recorded_on: Date.today.strftime('%a, %d %b %Y')).recorded_on.strftime('%a, %d %b %Y')

  end

end
