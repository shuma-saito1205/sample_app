class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end  #対象カラムにデータが入力されていればsave=trueでリダイレクト。falseの場合、入力不備となり新規投稿ページへ。
  end

  def index
    @lists = List.all
  end
  #index=一覧画面に投降したList全てを表示させる
  #listテーブルに保存されている全てのデータを取得し、"@list"というインスタンス変数へ格納。

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end

  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
