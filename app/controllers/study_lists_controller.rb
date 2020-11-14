class StudyListsController < ApplicationController
  get "/studylists/new" do
    @studylists = StudyList.all
    @studylist = StudyList.find_by(id: params[:id])

    erb :'/studylists/new'
  end

  get "studylists/index" do
    @studylists = StudyList.all
    @studylist = StudyList.find_by(id: params[:id])
    @user = current_user

    erb :'/studylists/index'
  end

  post "/studylists" do
    @user = current_user
    @studylist = StudyList.create(topic: params[:topic])
    @user.study_lists << @studylist
    redirect to "/studylists/#{@studylist.id}"
  end

  get "/studylists/:id" do
    @studylist = StudyList.find_by(id: params[:id])
    erb :'/studylists/show'
  end

  get "/studylists/:id/sessions/new" do
    @studylist = StudyList.find_by(id: params[:id])
    erb :'/studylists/new_session'
  end

  get "/studylists/:id/sessions/post" do
    @studylist = StudyList.find_by(id: params[:id])
    @session = Session.create(time_studied: params[:time_studied], date_completed: params[:date_completed], notes: params[:notes], user_id: current_user.id, study_list_id: @studylist.id)

    redirect "/studylists/#{@studylist.id}"
  end
end
