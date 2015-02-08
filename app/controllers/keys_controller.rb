class KeysController < ApplicationController
  before_filter :authenticate_user!, except: :show

  def show
    @key = PublicKey.find(params[:id])
  end

  def index
    @keys = current_user.public_keys.where.not(id: nil)
    @key = current_user.public_keys.new
  end

  def create
    @key = current_user.public_keys.new(key_params)
    if @key.save
      redirect_to public_keys_path, notice: "Your public key was saved"
    else
      render action: 'index'
    end
  end

  private

    def key_params
      params.require(:public_key).permit(:key)
    end
end
