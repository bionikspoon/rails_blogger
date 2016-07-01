module AuthorsHelper
  def zero_authors_or_authenticated
    unless Author.count == 0 || current_user
      redirect_to root_path
      false
    end
  end

  def author_params
    params.require(:author).permit(:username, :email, :password, :password_confirmation)
  end
end
