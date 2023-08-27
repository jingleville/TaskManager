class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy move_forward move_back ]
  before_action :set_group, :set_procedure

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    @stages = @procedure.stages
    @first_stage = @stages.find_by(stage_number: @stages.minimum('stage_number'))
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to group_procedure_path(@group, @procedure), notice: "Stage was successfully updated." }
        format.json { render :show, status: :ok, location: @stage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to group_procedure_path(@group, @procedure), notice: "Stage was successfully updated." }
        format.json { render :show, status: :ok, location: @stage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def move_back
    if @project.stage.next == 'already the last'
      redirect_to group_procedure_path(@group, @procedure) 
      return
    end
    @stage = @project.stage
    next_stage = @stage.next
    @project.stage_id = next_stage.id
    @project.save
    redirect_to group_procedure_path(@group, @procedure)
  end

  def move_forward
    if @project.stage.previous == 'already the first'
      redirect_to group_procedure_path(@group, @procedure) 
      return
    end
    @stage = @project.stage
    previous_stage = @stage.previous
    @project.stage_id = previous_stage.id
    @project.save
    redirect_to group_procedure_path(@group, @procedure)  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def set_procedure
      @procedure = Procedure.find(params[:procedure_id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end   

    # Only allow a list of trusted parameters through.
    def project_params
      p params
      @procedure = Procedure.find(params[:procedure_id])
      @stages = @procedure.stages
      params[:project][:stage_id] = @stages.find_by(stage_number: @stages.minimum('stage_number')).id
      params[:project][:procedure_id] = params[:procedure_id]
      params.require(:project).permit(:title, :position, :stage_id, :procedure_id)
    end
end
