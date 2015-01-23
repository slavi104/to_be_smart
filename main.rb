require "rubygems"
require "sinatra"
require "active_record"
require "sqlite3"
require "sinatra/reloader"
require "erb"
require_relative 'user.rb'
require_relative 'index.rb'

also_reload 'C:/Users/Slavi/2besmart/users.rb'
also_reload 'C:/Users/Slavi/2besmart/user.rb'
also_reload 'C:/Users/Slavi/2besmart/index.rb'
also_reload 'C:/Users/Slavi/2besmart/views/index.erb'
also_reload 'C:/Users/Slavi/2besmart/views/registration.erb'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'to_be_smart.sqlite3.db'
)

get '/' do
  Index.show_main_page
end

post '/save_new_user' do
  User.save_new_user(params)
end

get '/users' do
  User.get_all_users
end

get '/registration' do
# erb :registration #does not work!!!!!!!!!!!!!!!!!!!!!!!!!
'<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title> 2 be smart</title>
        <meta name="description" content="Online test engine.">
        <meta name="keywords" content="tests, 2 be smart, 2besmart">
        <meta name="author" content="Stanislav Venkov">
        <meta name="viewport" content="width=device-width">
        <!-- <link rel="stylesheet" href="../css/main.css">
        <link rel="stylesheet" href="../css/bootstrap.min.css"> -->
        <style>
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
        </style>

    <!-- <link rel="stylesheet" type="text/css" href="../css/metro-bootstrap.css">
    <link rel="stylesheet" href="../docs/font-awesome.css"> -->
    </head>
    <body>
        <div id="registrationForm">
            <h2>Registration:</h2>
            <form method="POST" action="/save_new_user" id="registrationForm">
                <div class="labelAndInput">
                    <label>Username:</label>
                    <input type="text" id="name" name="user_name">
                    <span class="errorloc"></span>
                </div>
                <div class="labelAndInput">
                    <label>Mail:</label>
                    <input type="text" id="email" name="email">
                    <span class="errorloc"></span>
                </div>
                
                <div class="labelAndInput">
                    <label>Password:</label>
                    <input type="password" id="pass1" name="password">
                    <span class="errorloc"></span>
                </div>
                <div class="labelAndInput">
                    <label>Gender:</label>
                    <input type="radio" name="sex" value="male">Male<br>
                    <input type="radio" name="sex" value="female">Female
                </div>
                <div class="labelAndInput">
                    <label>Reapeat password:</label>
                    <input type="password" id="pass2" name="password_repeat">
                    <span class="errorloc"></span>
                </div>
                
                <input type="submit" id="registerButton" value="Register">
            </form>
        </div>
    </body>
</html>
'
end