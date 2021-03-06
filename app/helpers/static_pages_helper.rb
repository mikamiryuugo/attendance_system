module StaticPagesHelper
  def not_yet_attend?(day)
    day.strftime('%m/%d') == Date.today.strftime('%m/%d')
  end

# 出勤ボタン押したか？のヘルパー
  def attended?(day)
    # day.strftime('%a, %d %b %Y') == current_user.attendances.where(recorded_on: Date.today.strftime('%a, %d %b %Y')).recorded_on.strftime('%a, %d %b %Y')
    # whereは複数取り出す。find_byは一つ
    return if current_user.attendances.find_by(recorded_on: day.strftime('%a, %d %b %Y')).nil?
    # 真偽判定する以前にこの式のコードでエラー出る。だから、ここでこそ、returnの出番じゃないのか！！！recorded_onがから（nil）の場合は、returnで終了
    day.strftime('%a, %d %b %Y') == current_user.attendances.
    find_by(recorded_on: day.strftime('%a, %d %b %Y')).recorded_on.strftime('%a, %d %b %Y')

    # recorded_onのデータ型は？？
  end

  def leaved?(day)
    return if current_user.attendances.find_by(recorded_on: day.strftime('%a, %d %b %Y')).nil?
    current_user.attendances.find_by(recorded_on: day.strftime('%a, %d %b %Y')).leave_time.present?
  end 
  
  # こっちかな？
  # def leaved?(day)
  #   return if current_user.attendances.find_by(recorded_on: day.strftime('%a, %d %b %Y')).nil?
  #   current_user.attendances.find_by(recorded_on: day.strftime('%a, %d %b %Y')).leave_time.present?
  # end 


  #出勤の時、分を表示するヘルパー
  def attend_time(day)
    return if current_user.attendances.find_by(recorded_on: day.strftime('%a, %d %b %Y')).nil?
    current_user.attendances.find_by(recorded_on: day).attend_time.strftime("%H")
  end

  def attend_minute(day)
    return if current_user.attendances.find_by(recorded_on: day.strftime('%a, %d %b %Y')).nil?
    current_user.attendances.find_by(recorded_on: day).attend_time.strftime("%M")
  end


  #退勤の時、分を表示するヘルパー
  def leave_time(day)
    return if current_user.attendances.find_by(recorded_on: day.strftime('%a, %d %b %Y')).nil?
    current_user.attendances.find_by(recorded_on: day).leave_time.strftime("%H")
  end

  def leaved_minute(day)
    return if current_user.attendances.find_by(recorded_on: day.strftime('%a, %d %b %Y')).nil?
    current_user.attendances.find_by(recorded_on: day).leave_time.strftime("%M")
  end

  def worked_time(day)
    return if current_user.attendances.find_by(leave_time: day.beginning_of_day..day.end_of_day).nil?
    at = current_user.attendances.find_by(recorded_on: day).attend_time.strftime('%H%M')
    le = current_user.attendances.find_by(recorded_on: day).leave_time.strftime('%H%M')

      worked = at.to_i - le.to_i
      worked / 3600.0
  end

end
