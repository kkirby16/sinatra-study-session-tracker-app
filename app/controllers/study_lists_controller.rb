class StudyListsController < ApplicationController
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
    if params[:topic] != "" && current_user.study_lists.find_by(topic: params[:topic]) == nil
      @user = current_user
      @studylist = StudyList.create(topic: params[:topic])

      @user.study_lists << @studylist
      redirect to "/studylists/#{@studylist.id}"
    else
      redirect "/users/login"
    end
  end

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
      @session = Session.create(time_studied: params[:time_studied], date_completed: params[:date_completed], notes: params[:notes], user_id: current_user.id, study_list_id: @studylist.id)
      redirect "/studylists/#{@studylist.id}"
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
end
