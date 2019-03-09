module StaticPagesHelper
  def not_yet_attend?(day)
    day.strftime('%m/%d') == Date.today.strftime('%m/%d')
  end

  def attended?(day)
    # day.strftime('%a, %d %b %Y') == current_user.attendances.where(recorded_on: Date.today.strftime('%a, %d %b %Y')).recorded_on.strftime('%a, %d %b %Y')
    # whereは複数取り出す。find_byは一つ
    return if current_user.attendances.find_by(recorded_on: Date.today.strftime('%a, %d %b %Y')).nil?
    # 真偽判定する以前にこの式のコードでエラー出る。だから、ここでこそ、returnの出番じゃないのか！！！recorded_onがから（nil）の場合は、returnで終了
    day.strftime('%a, %d %b %Y') == current_user.attendances.
    find_by(recorded_on: Date.today.strftime('%a, %d %b %Y')).recorded_on.strftime('%a, %d %b %Y')
  end

  #出勤の時、分を表示するヘルパー
  def attend_time(day)
    if attended?(day)
      current_user.attendances.find_by(recorded_on: Date.today.strftime('%a, %d %b %Y')).attend_time.strftime("%H")
    end
  end

  def attend_minute(day)
    if attended?(day)
      current_user.attendances.find_by(recorded_on: Date.today.strftime('%a, %d %b %Y')).attend_time.strftime("%M")
    end
  end



end
