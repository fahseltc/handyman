class JobsController < ApplicationController

  before_action :authenticate_user!, only:[:index, :show]

  def new
    @job = Job.new
  end

  def index
    @jobs = Job.all
  end

  def create
    @job = Job.new(article_params)
    if @job.save
      NewJobMailer.new_job(@job.id).deliver_now
      flash['alert-success'] = "Your request has been submitted. We'll get back to you as soon as possible!"
      redirect_to root_path
    else
      flash['alert-warning'] = "Please answer the security question"
      redirect_to new_job_path
    end
  end

  def show
    if current_user.try(:admin?)
      @job = Job.find(params[:id])
    else
      redirect_to new_job_path
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to jobs_path
  end

  def update_note

    @job = Job.find(params[:id])
    @job.notes = params[:note]
    if @job.save
      @updated = true
      #flash[:success] = "Welcome to the Sample App!"
    else
      @updated = false
    end
    #redirect_to job_path(params[:id])

    respond_to do |format|
      format.js
    end
  end


  private
    def article_params
      params.require(:job).permit(:description, :location, :email, :phone, :contact_info, :humanizer_answer, :humanizer_question_id)
    end

end
