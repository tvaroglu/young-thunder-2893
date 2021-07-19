# Movie Tracker

This repository requires and has been tested on Ruby v2.7.2 and is based on Rails 5.2.5

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <paste_repo>`
4. `cd young-thunder-2893`
5. `bundle install`

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork once the time is up (not before!)

## Submission

Once the time for the assessment is up (and not before), push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* How far you got through the user stories
  * Please include any user stories you partially complete, for example "completed user stories 1 and 2, really close to completing 3"
* A reflection on how you felt you did with this challenge

## Requirements

* TDD all new work
* model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## User Stories

We are creating an application to track studios, movies, and actors

* Studios have a name and location
  * ex. name: ‘Universal Studios’, location: ‘Hollywood’
* Movies have a title, creation year, and genre
  *ex. title: ‘Raiders of the Lost Ark’, creation_year: 1981, genre: ‘Action/Adventure’
* Actors have a name and age
  * name: ‘Harrison Ford’, age: 78
* Studios have many Movies
* Movies belong to a Studio
* Movies have many Actors
* Actors can be in many Movies

Some of the initial migrations and model set up has been done for you.

```
Story 1
Studio Index
 
As a user,
When I visit the studio index page
I see a each studio's name and location
And underneath each studio, I see the titles of all of its movies.
```

```
Story 2
Movie Show
 
As a user,
When I visit a movie's show page.
I see the movie's title, creation year, and genre,
and a list of all its actors from youngest to oldest.
And I see the average age of all of the movie's actors
```

```
Story 3
Add an Actor to a Movie
 
As a user,
When I visit a movie show page,
I do not see any actors listed that are not part of the movie
And I see a form to add an actor to this movie
When I fill in the form with the name of an actor that exists in the database
And I click submit
Then I am redirected back to that movie's show page
And I see the actor's name is now listed
(You do not have to test for a sad path, for example if the name submitted is not an existing actor)
```

## Extension

```
Coactors
 
As a user,
When I visit an actor's show page
I see that actors name and age 
And I see a unique list of all of the actors this particular actor has worked with.
```
