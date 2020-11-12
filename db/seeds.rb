kevin = User.create(username: "keviniam", password: "password")
mark = User.create(username: "markiam", password: "password")

ruby_on_rails_list = StudyList.create(topic: "Ruby on Rails")
javascript_list = StudyList.create(topic: "Javascript")

kevins_first_session = Session.create(time_studied: "1 hour", date_completed: DateTime.new(2020, 11, 11, 12, 30), notes: "This is an important note from this study session", user_id: kevin.id, study_list_id: ruby_on_rails_list.id)
marks_first_session = Session.create(time_studied: "1 hour and 30 minutes", date_completed: DateTime.new(2020, 11, 11, 11, 25), notes: "A great note to remember for this session", user_id: mark.id, study_list_id: javascript_list.id)

kevin.sessions.create(time_studied: "30 minutes", date_completed: DateTime.new(2020, 11, 11, 13, 10), notes: "A great piece of information", study_list_id: ruby_on_rails_list.id)

marks_entry = mark.sessions.build(time_studied: "45 minutes", date_completed: DateTime.new(2020, 11, 11, 12, 10), notes: "An explanation I loved", study_list_id: javascript_list.id)
marks_entry.save
