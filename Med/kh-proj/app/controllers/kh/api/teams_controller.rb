class Kh::Api::TeamsController < ApplicationController


  # http://127.0.0.1:4070/kh/api/

  # GET /teams/all
  def getAllTeams
    @teams = Team.all.order("id DESC")
    render json: @teams
  end

  # GET /show-one/:id
  def getTeamById
    @team = Team.find(params[:id])
    render json: @team
  end

  # POST /create
  def createTeam
    @team = Team.new(team_params)
      if @team.save
        render json: {Team: @team, message: 'Team Successfully CREATED.'},status:200
      else
        render error: {error: 'Unable to CREATE Team.'},status:400
      end
  end

  # PUT /update-one/:id
  def updateTeam
    @team = Team.find(params[:id])
      if @team
         @team.update(team_params)
         render json: {Team: @team, message: 'Team Successfully UPDATED.'},status:200
      else
        render error: {error: 'Unable to UPDATE Team.'},status:400
      end
  end


   # DELETE /destroy-one/:id
   def destroyTeam
    @team = Team.find(params[:id])
    if @team
       @team.destroy
       render json: {message: 'Team Successfully DELETED !!'},status:200
    else
      render error: {error: 'Unable to DELETE Team.'},status:400
    end
  end




  private
  def team_params
    params.require(:team).permit(:name, :nickname, :founded, :owner, :league, :logo)
  end

end
