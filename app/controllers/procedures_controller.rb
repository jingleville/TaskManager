class ProceduresController < ApplicationController
  before_action :set_procedure, only: %i[ show edit update destroy ]
  before_action :set_group

  def index
    @procedures = @group.procedures.all
  end

  def show
    @stages = @procedure.stages.order(stage_number: :asc)
  end

  def new
    @procedure = @group.procedures.new
  end

  def edit
  end

  def create

    @procedure = @group.procedures.new(procedure_params)

    respond_to do |format|
      if @procedure.save
        format.html { redirect_to @group, notice: "Procedure was successfully created." }
        format.json { render :show, status: :created, location: @procedure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @procedure.update(procedure_params)
        format.html { redirect_to group_procedure_url(@group, @procedure), notice: "Procedure was successfully updated." }
        format.json { render :show, status: :ok, location: @procedure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @procedure.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Procedure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_procedure
      @procedure = Procedure.find(params[:id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    def procedure_params
      params.require(:procedure).permit(:title)
    end
end
