class Public::CommentsController < ApplicationController
  before_action :ensure_correct_customer, only: [:create]
  
  def create
    @comment = current_customer.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
    end
  end

  private
  
  def ensure_correct_customer
    redirect_to root_path unless customer_signed_in?
  end
  
  def comment_params
    params.require(:comment).permit(:message, :animal_id)  #formにてanimal_idパラメータを送信して、コメントへanimal_idを格納するようにする必要がある。
  end
end
