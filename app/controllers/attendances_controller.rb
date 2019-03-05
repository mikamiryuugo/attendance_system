class AttendancesController < ApplicationController
  # static_pagesのhomeにインスタンスをセットすればいいからここ入らんか
  # def index
  # end

  def create
    @attendance = current_user.attendances.build(attendance_params)
    if @attendance.save
      flash[:success] = "出勤時間を入力しました"
      redirect_to root_url
    else
      flash[:danger] = "出勤時間の入力に失敗しました"
      render 'static_pages/home'
    end
    
  end

  def edit
    # ここらのfind(params[:id])って送られてくるattendanceのパラメータの中に入ってるのだよ
    @attendance = current_user.attendance.find(params[:id])
  end

  def update
    @attendance = current_user.attendances.find(params[:id])
    @attendance.assign_attributes(attendance_params)
    if @attendance.save 
      flash[:success] = "出勤時間を更新しました"
      redirect_to root_url
    else
      flash[:danger] = "出勤時間の更新に失敗しました"
      render 'attendances/edit'
    end
  end

#   def destroy
# ここいるか？いらない気が。。
#   end
  
  private
  
  def attendance_params
    params.require(:attendance).permit(:attend_time, :leave_time, :work_time, :remarks, :recorded_on)
  end
end
