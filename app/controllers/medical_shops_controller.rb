class MedicalShopsController < ApplicationController


	def index
		if params[:term].present?
      @medical_shop = MedicalShop.order(:shop_name).where("shop_name ilike ?","%#{params[:term]}%")
      render json: @medical_shop.map(&:shop_name)
    else
      @medical_shop= MedicalShop.all
      render html: @medical_shop
    end
	end

  def new
   @medical = MedicalShop.new
  end

	def show
		@medical = MedicalShop.find(params[:id])
	end

  def edit
   @medical = MedicalShop.find(params[:id])
  end

  def create
    @medical = MedicalShop.new(medical_params)

    respond_to do |format|
      if @medical.save
        format.html { redirect_to @medical, notice: 'successfully created.' }
        format.json { render action: 'new', status: :created, location: @medical }
      else
        format.html { render action: 'new' }
        format.json { render json: @medical.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
		@medical_shop = MedicalShop.find(params[:id])
    respond_to do |format|
      if @medical_shop.update(medical_params)
        format.html { redirect_to @medical_shop, notice: 'successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @medical_shop.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def medical_params
   params.require(:medical_shop).permit(:shop_name, :shop_address)
  end


end
