
class CompaignsController < ApplicationController
  # GET /compaigns
  # GET /compaigns.json
  def index
    @compaigns = Compaign.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @compaigns }
    end
  end

  # GET /compaigns/1
  # GET /compaigns/1.json
  def show
    @compaign = Compaign.find(params[:id])
    #binding.pry
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @compaign }
    end
  end

  # GET /compaigns/new
  # GET /compaigns/new.json
  def new
    @compaign = Compaign.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @compaign }
    end
  end

  # GET /compaigns/1/edit
  def edit
    @compaign = Compaign.find(params[:id])
  end

  # POST /compaigns
  # POST /compaigns.json
  def create
    @compaign = Compaign.new(params[:compaign])
    #binding.pry
    if params[:maillist] == nil || params[:zhtemplate] == nil
      flash[:notice] = "Please submit tasks excel file."
      render :new and return
    end

    maillist_io = params[:maillist]
    zhtemplatefile = params[:zhtemplate]
    zhtemplate = Template.new
    zhtemplate.lang = "zh"
    zhtemplate.content = zhtemplatefile.read
    zhtemplate.save
    # # binding.pry
    File.open("tmp/#{maillist_io.original_filename}", 'wb') do |file|
      file.write maillist_io.read
    end
    # binding.pry
    oo = Excelx.new("tmp/#{maillist_io.original_filename}")
    oo.default_sheet = oo.sheets.first
    1.upto(oo.last_row) do |line|
      #puts oo.cell(line, 'A')
      task = Task.new
      task.from = @compaign.mailconfig.user_name
      task.to = oo.cell(line, 'A')
      task.template = zhtemplate
      task.compaign = @compaign
      task.status = "initial"
      task.save
    end
    #binding.pry
    respond_to do |format|
      if @compaign.save
        format.html { redirect_to @compaign, notice: 'Compaign was successfully created.' }
        format.json { render json: @compaign, status: :created, location: @compaign }
      else
        format.html { render action: "new" }
        format.json { render json: @compaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /compaigns/1
  # PUT /compaigns/1.json
  def update
    @compaign = Compaign.find(params[:id])

    respond_to do |format|
      if @compaign.update_attributes(params[:compaign])
        format.html { redirect_to @compaign, notice: 'Compaign was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @compaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compaigns/1
  # DELETE /compaigns/1.json
  def destroy
    @compaign = Compaign.find(params[:id])
    @compaign.tasks.each do |task|
      task.destroy
    end
    @compaign.destroy

    respond_to do |format|
      format.html { redirect_to compaigns_url }
      format.json { head :no_content }
    end
  end
end
