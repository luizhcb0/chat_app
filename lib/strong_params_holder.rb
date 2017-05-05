# This module has the purpose of holdng the models strong parameters so that
# different controllers can use it in order for not having multiple places to
# change when some model be modified

module StrongParamsHolder
  def sign_up_params
    params.require(:user).permit(:username)
  end
end
