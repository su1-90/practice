class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show

  # user 一覧画面表示
  def index
    @users = User.all
  end

  # user 画面表示
  def show
    @user = User.find(params[:id])
    if user_signed_in? && @user == current_user
      # この部分は何も処理しない
    else
      # ログインしていないか、他のユーザーの詳細ページにアクセスしようとした場合はリダイレクト
      redirect_to users_path, alert: "他のユーザーの詳細ページにアクセスする権限がありません"
    end
  end
  
  def edit
    # 現在のユーザー情報を取得して、form_forに渡す
    @user = current_user
  end

  # user 作成画面表示
  def new
    @user = User.new
  end

  # user 作成処理
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to action: :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end