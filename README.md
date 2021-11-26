# Sinatra Study Session Tracker

## Description of this app:

Study Session Tracker is a CRUD MVC Sinatra app that I designed to help users keep track of the study sessions that they have completed. This website lets you create study lists for a topic (ex: Ruby, Javascript, etc.) that you forsee you'll be studying. A study list can then hold completed study sessions that a user adds to them.

## Overview of functionality:

Study Session Tracker gives users the ability to:

-Login, signup and logout

-Create study lists for certain study topics.

-View the study lists they have created.

-Create completed study sessions that are associated with a specific study list that go onto that study list.

-Edit completed study sessions.

-Delete completed study sessions that have been created.

## Built with:

-Sinatra with MVC structure and RESTful routing

-Sessions for login

-SQLite database

-ActiveRecord

-Rack-Flash

## How to install this program:

-Fork and clone the repository at this link: https://github.com/kkirby16/sinatra-study-session-tracker-app

-Once in the program, open the terminal and run bundle install.

-Next, run rake db:migrate and rake db:seed.

-Then, run shotgun in the terminal.

-Then navigate to http://localhost:9393/users/signup in a web browser and create an account. This will sign you into the website. Instructions for using the website are detailed in the section right below.

## How to use this program:

Once you’ve signed up at the link for signup, you are automatically logged into the website and come to a home screen. As a new user, the next step from this screen would be to click the button for creating a study list.

You’ll then be taken to a page prompting you to create a study list for a topic. Examples of topics could be Ruby, Javascript, React, or whatever you please. Then, press the button to create a study list and you’ll be taken to the study list you just created for that topic.

The study list will say you have no study sessions for it yet since you have not yet created any completed study sessions associated with this list. Click the button to add a study session to this study list.

You’ll then be taken to a page prompting you to create a study session. Make sure you have entered a length of time you studied for this session (ex: 30 minutes, 1 hour, 1.5 hours, etc.) and selected a date in which you completed this study session. If you’d like, you can also add notes from this study session that are important and/or helpful for you to keep hold of. However, notes are optional. Next, press the create study session button to create a study session with your info.

You’re then taken to the page for the study list that you just added this completed study session to, and you’ll see the list now has your newly created study session on it. You’ll notice the study session is a link. Click this link and you’ll see this study session specifically as well as buttons to edit it or delete it.

If you click edit, you’ll be brought to a page where you can fill out new info for the study session. Do this and then click update session. You’ll then be taken to a page showing this specific updated study session, and you’ll notice that if you press the button to go back to the study list, the study list will now show the updated study session as well.

If you click delete on that specific study session page, the study session will be deleted and you’ll be taken back to the study list it used to be on and see that this study session is no longer there.

There are also some links throughout the app to navigate back to the homepage. Also, from the homepage you can click the button to see all of your study lists. This will show you all of your study lists. You can click into your study lists and then click into your study sessions on those lists this way as well to see, edit or delete them.

### Video of how to use my app: https://www.youtube.com/watch?v=88EEq9BEQm0

#### This project is licensed under: https://www.gnu.org/licenses/gpl-3.0.en.html
