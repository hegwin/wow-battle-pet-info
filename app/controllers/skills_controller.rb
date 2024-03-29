class SkillsController < ApplicationController
  before_action :authorize, except: [:index, :show, :search]
  # GET /skills
  # GET /skills.json
  def index
    @skills = Skill.page(params[:page]).per(20).includes(:category)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skills }
    end
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
    @skill = Skill.find(params[:id])
    @pets = @skill.pets.page(params[:page]).per(20).includes(:category).includes(:acquirings)
    @category = @skill.category
    @restrained_category = @category.restrain
    @decayed_category = @category.decay

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @skill }
    end
  end

  # GET /skills/new
  # GET /skills/new.json
  def new
    @skill = Skill.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @skill }
    end
  end

  # GET /skills/1/edit
  def edit
    @skill = Skill.find(params[:id])
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(params[:skill])

    respond_to do |format|
      if @skill.save
        format.html { redirect_to @skill, notice: 'Skill was successfully created.' }
        format.json { render json: @skill, status: :created, location: @skill }
      else
        format.html { render action: "new" }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /skills/1
  # PUT /skills/1.json
  def update
    @skill = Skill.find(params[:id])

    respond_to do |format|
      if @skill.update_attributes(params[:skill])
        format.html { redirect_to @skill, notice: 'Skill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy

    respond_to do |format|
      format.html { redirect_to skills_url }
      format.json { head :no_content }
    end
  end

  def search
    @skills = Skill.where('title_cn like ?', "%#{params[:q]}%").page(params[:page]).per(20).includes(:category).includes(:acquirings)

    render :index
  end

  def verify
    @skill = Skill.select([:id, :description]).find_by_title_cn(params[:title_cn])

    respond_to do |format|
      format.json { render json: @skill.to_json }
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:blz_id, :category, :category_id, :cd, :comments, :description, :hit_rate, :status, :title_cn, :title_en)
  end
end
