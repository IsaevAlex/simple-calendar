class MeetingsController < ApplicationController
  before_action :set_user_id, only: [:edit, :new, :create, :update, :show, :destroy ]

  respond_to :html, :json

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting = @user.meetings.find(params[:id])
    respond_to do |format|
          format.js {}
     end
  end

  # GET /meetings/new
  def new
    @meeting = @user.meetings.build
    respond_to do |format|
          format.js {}
     end
  end

  # GET /meetings/1/edit
  def edit
     @meeting = @user.meetings.find(params[:id])
     respond_to do |format|
          format.js {}
     end
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = @user.meetings.create(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to current_user, notice: 'Meeting was successfully created.' }
        
      else
        format.html { render :new }
        
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    @meeting = @user.meetings.find(params[:id])
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to current_user, notice: 'Meeting was successfully created.' }
        
      else
        format.html { render :edit }
        
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting = @user.meetings.find(params[:id])
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Meeting was successfully destroyed.' }
    end
  end

  private

    def set_user_id
       @user = User.find(params[:user_id])
       
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :user_id, :end_time, :description, :priority_id)
    end
end
