class KudosController < ApplicationController
  def index
    @kudos = Kudo.all
  end

  def show
    kudo_find
  end

  def new
    @kudo = Kudo.new
  end

  def edit
    kudo_find
  end

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
    kudo_find
    if @kudo.update(kudo_params)
      redirect_to @kudo, notice: 'Kudo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    kudo_find
    @kudo.destroy
    redirect_to kudos_url, notice: 'Kudo was successfully destroyed.'
  end

  private

  def kudo_find
    @kudo = Kudo.find(params[:id])
  end

  def kudo_params
    params.require(:kudo).permit(:title, :content, :giver_id, :receiver_id, :company_value_id)
  end
end
