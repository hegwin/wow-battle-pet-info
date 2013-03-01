class PetsController < ApplicationController
  before_filter :authorize, except: [:index, :show, :search]
  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.page(params[:page]).per(20).includes(:category).includes(:acquirings)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pets }
    end
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    @pet = Pet.find(params[:id])
    @acquirings = @pet.acquirings.order(:acquire_level).includes(:skill)
    @zones = @pet.zones

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pet }
    end
  end

  # GET /pets/new
  # GET /pets/new.json
  def new
    @pet = Pet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pet }
    end
  end

  # GET /pets/1/edit
  def edit
    @pet = Pet.find(params[:id])
    @acquirings = @pet.acquirings.order(:acquire_level).includes(:skill).order(:acquire_level)
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(params[:pet])

    respond_to do |format|
      if @pet.save
        format.html { redirect_to edit_pet_url(@pet), notice: 'Pet was successfully created.' }
        format.json { render json: @pet, status: :created, location: @pet }
      else
        format.html { render action: "new" }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pets/1
  # PUT /pets/1.json
  def update
    @pet = Pet.find(params[:id])

    respond_to do |format|
      if @pet.update_attributes(params[:pet])
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def acquire
    @pet = Pet.find(params[:id])
    @pet.forget_all_skills
    @pet.acquire_skills(params[:skills])

    redirect_to @pet, notice: "Pet have successfully acquired skills"
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy

    respond_to do |format|
      format.html { redirect_to pets_url }
      format.json { head :no_content }
    end
  end

  def search
    @pets = Pet.where('title_cn like ?', "%#{params[:q]}%").page(params[:page]).per(20).includes(:category).includes(:acquirings)

    render :index
  end
end
