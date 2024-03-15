class ParticipantsController < ApplicationController
include ApplicationHelper
  before_action :authenticate_user!
  before_action :set_participant, only: %i[ show edit update destroy download ]
  


  # GET /participants or /participants.json
  def index
      if params[:search_ics].present?
        @participants = Participant.where("ics_no LIKE ?", "%#{params[:search_ics]}%")
      else
        @participants = Participant.all
      end
    end

  # GET /participants/1 or /participants/1.json
  def show
  end

  # GET /participants/new
  def new
    @participant = Participant.new
  end

  # GET /participants/1/edit
  def edit
  end

  # POST /participants or /participants.json
  def create
    @participant = Participant.new(participant_params)


  # Find the maximum serial number for the current course category
  max_serial_num = Participant.where(course_category_id: @participant.course_category_id).maximum(:serial_num)

  # Set the serial number for the new participant
  @participant.serial_num = format('%03d', max_serial_num.to_i + 1)



    respond_to do |format|
      if @participant.save
        format.html { redirect_to participant_url(@participant), notice: "Participant was successfully created." }
        format.json { render :show, status: :created, location: @participant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participants/1 or /participants/1.json
  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to participant_url(@participant), notice: "Participant was successfully updated." }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1 or /participants/1.json
  def destroy
    @participant.destroy!

    respond_to do |format|
      format.html { redirect_to participants_url, notice: "Participant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def download
    participant = Prawn::Document.new


    font_the_seasons =  Rails.root.join('app', 'assets', 'fonts', 'The Seasons Bold.ttf')
    participant.font(font_the_seasons)

    background_image_path = Rails.root.join('app', 'assets', 'images', 'cert.jpg')  
   
    # Set the desired position for the image
  desired_position = [-35, participant.bounds.height]

  desired_width = 610
  desired_height = 800

  participant.bounding_box([0, participant.cursor], width: participant.bounds.width, height: participant.bounds.height - 40, margin: 0) do
    # Place the image at the desired position without resizing it

    participant.image background_image_path, at: desired_position,
    # position: :center,
    # vposition: :center,
    width: desired_width,
    height: desired_height,
    # participant.image background_image_path, position: :center,
    # vposition: :center, at: desired_position,
    width: 600,
    height: 780
  
    end

    # participant.move_cursor_to(participant.bounds.height - 50)
    participant.move_cursor_to(participant.bounds.height)

     # Calculate the center point of the page
  center_x = participant.bounds.width / 2
  center_y = (participant.bounds.height - 50) / 2

 
    #single_day = 2

    custom_text = custom_text_helper(@participant)


    if @participant.name.length > 32
        participant.text_box @participant.name.upcase,
        at: [50, 380], 
        align: :center, 
        size: 36, 
        width: participant.bounds.width, 
        leading:-10,
        height: participant.bounds.height do
          stroke_bounds
        end
      else
        participant.text_box @participant.name.upcase,at: [50, 380], align: :center, size: 36, width: participant.bounds.width - (20 + 20), leading:-10,height: participant.bounds.height do
        transparent(0.5)  {stroke_bounds} 
        end
      end
    

    participant.text_box custom_format_ics_no(@participant.ics_no),at: [0, 290], align: :center, size: 22

    font_poppins = Rails.root.join('app', 'assets', 'fonts', 'Poppins-Medium.ttf')
    participant.font(font_poppins)

    
    # participant.text "#{@participant.course_category.name}",
    #                   align: :center,
    #                   font: participant.font(font_the_seasons),
    #                   inline_format: true

    participant.text_box custom_text, align: :center, at: [0, 240], size: 12, :character_spacing => 1
    # participant.text custom_text, align: :center, at: [0, 240], size: 12 , inline_format: true
    
    
    if @participant.serial_num.present?

      font_poppins_italic = Rails.root.join('app', 'assets', 'fonts', 'Poppins-MediumItalic.ttf')
      participant.font(font_poppins_italic)

      participant.text_box serial_number_helper(@participant.serial_num), align: :left, at: [35, 17], size: 6.7
   end
    send_data(participant.render, filename: "#{@participant.name}.pdf", type: 'application/pdf')  
  end
 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def participant_params
      params.require(:participant).permit(:name, :ics_no, :course, :course_category_id, :serial_num, :phone, :email)
    end
end
