class KudosController < ApplicationController
  before_action :set_kudo, only: %i[show edit update destroy]
  before_action :require_login

  def index
    @kudos = Kudo.all
  end

  def show; end

  def new
    @kudo = Kudo.new
  end

  def edit; end

  def create
    @kudo = Kudo.new(kudo_params)
    @kudo.giver_id = current_employee.id

    if @kudo.save
      redirect_to profile_path(@kudo.giver_id), notice: 'Kudo was successfully created.'
    else
      render :new
    end
  end

  def update
    if @kudo.update(kudo_params)
      redirect_to @kudo, notice: 'Kudo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @kudo.destroy
    redirect_to kudos_url, notice: 'Kudo was successfully destroyed.'
  end

  private

  def set_kudo
    @kudo = Kudo.find(params[:id])
  end

  def kudo_params
    params.require(:kudo).permit(:title, :content, :giver_id, :receiver_id)
  end
end
