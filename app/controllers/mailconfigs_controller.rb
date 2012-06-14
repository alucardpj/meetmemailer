
class MailconfigsController < ApplicationController
  # GET /mailconfigs
  # GET /mailconfigs.json
  def index
    @mailconfigs = Mailconfig.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mailconfigs }
    end
  end

  # GET /mailconfigs/1
  # GET /mailconfigs/1.json
  def show
    @mailconfig = Mailconfig.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mailconfig }
    end
  end

  # GET /mailconfigs/new
  # GET /mailconfigs/new.json
  def new
    @mailconfig = Mailconfig.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mailconfig }
    end
  end

  # GET /mailconfigs/1/edit
  def edit
    @mailconfig = Mailconfig.find(params[:id])
  end

  # POST /mailconfigs
  # POST /mailconfigs.json
  def create
    @mailconfig = Mailconfig.new(params[:mailconfig])

    respond_to do |format|
      if @mailconfig.save
        format.html { redirect_to @mailconfig, notice: 'Mailconfig was successfully created.' }
        format.json { render json: @mailconfig, status: :created, location: @mailconfig }
      else
        format.html { render action: "new" }
        format.json { render json: @mailconfig.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mailconfigs/1
  # PUT /mailconfigs/1.json
  def update
    @mailconfig = Mailconfig.find(params[:id])

    respond_to do |format|
      if @mailconfig.update_attributes(params[:mailconfig])
        format.html { redirect_to @mailconfig, notice: 'Mailconfig was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mailconfig.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mailconfigs/1
  # DELETE /mailconfigs/1.json
  def destroy
    @mailconfig = Mailconfig.find(params[:id])
    @mailconfig.destroy

    respond_to do |format|
      format.html { redirect_to mailconfigs_url }
      format.json { head :no_content }
    end
  end
end
