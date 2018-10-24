# JavaScript Challenger
JavaScript Challenger is an web application that allows users to create, evaluate and take code challenges in sandboxed environment using Javascript.

[Click here to view the frontend of JavaScript Challenger](https://github.com/MarvinClerge/Challenger)

## Motivation
The goal of this web application was to create a website that would allow users to write, execute, save and take on challenges in Javascript.

## Tech/framework used
#### React.js
Used to create frontend, manage application state, user interface, DOM manipulation, and fetching data from backend API.
#### Ruby on Rails
Used to create backend JSON API.
#### PostgreSQL
Used to store and manage user information.
#### AceEditor
Used for live syntax checking and highlighting of JavaScript code.
#### JS-Interpreter
Used to evaluate JavaScript code in a sandboxed environment

## Installation
In order to use this application ruby and node js must be installed
### MAC OS
1. Download both the frontend and backend of JavaScript Challenger
2. Go to the backend folder location in your terminal and run `bundle install`
3. After the installation is complete run `rails db:migrate` and `rails db:seed` to create the database
4. Run `rails s -p 3001` to start the backend rails server
5. Go to the frontend folder location in your terminal
6. Run `npm install` to install required node packages
7. Run `npm start` to start the frontend server
8. Go to http://localhost:3000 in your browser


## License
MIT License

Copyright (c) 2018 Marvin Clerge

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
