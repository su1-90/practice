class TasksController < ApplicationController
    before_action :set_task, only: %i[edit update destroy]
    # Task 一覧画面表示
    def index
        @tasks = Task.all
    end
    # Task 作成画面
    def new
        @task = Task.new
    end
    # Task 作成処理
    def create
        @task = Task.new(task_params)
        @task.user_id = Task.user_id_from_name(params[:task][:user_name]) # ユーザー名からユーザーIDを検索
        if @task.save
          redirect_to tasks_path
        else
            render :new
        end
      end
    # Task 編集画面表示
    def edit
    end
    # Task 更新処理
    def update
        if @task.update(task_params)
          redirect_to tasks_path
        end
    end
#    def update
#        @task.update(task_params)
#    end
    # Task 削除処理
    def destroy
        @task.destroy
        redirect_to tasks_path
    end
    # id指定でtaskを検索して設定
    def set_task
        @task = Task.find(params[:id])
    end

    private
    # ストロングパラメータ
    # permitで指定した項目を許可する
    def task_params
        params.require(:task).permit(:user_id, :content)
    end
end
