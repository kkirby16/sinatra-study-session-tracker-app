require "sinatra"
require "rack-flash"

class StudyListsController < ApplicationController
  use Rack::Flash

  get "/studylists/new" do
    if logged_in?
      @studylists = StudyList.all
      @studylist = StudyList.find_by(id: params[:id])

      erb :'/studylists/new'
    else
      redirect "/users/login"
    end
  end

  get "/studylists/index" do
    if logged_in?
      @studylists = StudyList.all
      @studylist = StudyList.find_by(id: params[:id])
      @user = current_user

      erb :'/studylists/index'
    else
      redirect "/users/login"
    end
  end

  post "/studylists" do
    if logged_in?
      @studylist = StudyList.new(topic: params[:topic], user_id: current_user.id)
      if @studylist.save
        redirect to "/studylists/#{@studylist.id}"
      else
        flash[:message] = "*Make sure you have a topic filled in that is also a topic you haven't used before for a studylist."
        redirect "/studylists/new"
      end
    else
      redirect "/users/login"
    end
  end

  #@user = User.new(params)
  #if @user.save
  #session[:user_id] = @user.id

  get "/studylists/:id" do
    if logged_in?
      @studylist = StudyList.find_by(id: params[:id])
      erb :'/studylists/show'
    else
      redirect "/users/login"
    end
  end

  get "/studylists/:id/sessions/new" do
    if logged_in?
      @studylist = StudyList.find_by(id: params[:id])
      erb :'/studylists/new_session'
    else
      redirect "/users/login"
    end
  end

  get "/studylists/:id/sessions/post" do
    if logged_in?
      @studylist = StudyList.find_by(id: params[:id])
      @session = Session.new(time_studied: params[:time_studied], date_completed: params[:date_completed], notes: params[:notes], user_id: current_user.id, study_list_id: @studylist.id)
      if @session.save
        redirect "/studylists/#{@studylist.id}"
      else
        flash[:message] = "*Make sure you have filled out both the time studied box and selected a date for date completed. Notes are optional."

        redirect "/studylists/#{@studylist.id}/sessions/new"
      end
    else
      redirect "/users/login"
    end
  end

  get "/studylists/:id/sessions/:number" do
    if logged_in?
      @studylist = StudyList.find_by(id: params[:id])
      @session = Session.find_by(id: params[:number])
      erb :'/studylists/session_show'
    else
      redirect "/users/login"
    end
  end

  get "/studylists/:id/sessions/:number/edit" do
    if logged_in?
      @studylist = StudyList.find_by(id: params[:id])
      @session = Session.find_by(id: params[:number])
      erb :'/studylists/session_edit'
    else
      redirect "/users/login"
    end
  end

  patch "/studylists/:id/sessions/:number" do
    if logged_in?
      @studylist = StudyList.find_by(id: params[:id])
      @session = Session.find_by(id: params[:number])
      @session.update(time_studied: params[:time_studied], date_completed: params[:date_completed], notes: params[:notes])
      if @session.save
        redirect "/studylists/#{@studylist.id}/sessions/#{@session.id}"
      else
        flash[:message] = "*Make sure you have filled out both the time studied box and selected a date for date completed. Notes are optional."
        redirect "/studylists/#{@studylist.id}/sessions/#{@session.id}/edit"
      end
    else
      redirect "/users/login"
    end
  end

  delete "/studylists/:id/sessions/:number/delete" do
    if logged_in?
      @studylist = StudyList.find_by(id: params[:id])
      @session = Session.find_by(id: params[:number])
      @session.delete
      redirect "/studylists/#{@studylist.id}"
    else
      redirect "/users/login"
    end
  end
end
