# DS Full Stack Developer - Hiring Take Home Assignment

Thank you for applying to Data Sciences. Below is a take home assignment we'd like you to complete. It should take 3-5 hours to find a working solution.

This isn't a made up example, or a computer-sciency test that you can look up a solution to online. This is based on a partial problem/feature we needed to build out for a real application. We want to see you write code. We don't believe in live coding interviews or grinding LeetCode - that doesn't show us what you'd actually do in a real working environment.

Spend as much time as you'd like on this. There are no tricks. The application is a basic scaffold with minimal styling. We want to see what you come up with.

## Background

We work with political clients. One request we received was for an end-user way to update polling locations in an application.

For the uninitiated, Canada is divided into 338 electoral districts or `ridings`. Each riding is divided into polling divisions or `polls`. The number of polls per riding varies but is usually between 170-250. On election day each poll is assigned a polling location (`polling_location`) where people will vote for their assigned poll. Polls can share the same polling location.

## The assignment

We need you to build a form that allows users of the application to edit and update polling location information.

Some guidelines:

- There are no user accounts in this example application. You do not need to create any.
- Each polling location has a `title`, `address`, `city`, and `postal_code`.
- Polls cannot share a polling location.
- Polls have a number unique to a riding. ie. The riding of Avalon has a poll 1, and a poll 2, but can't have two polls numbered 1. Other ridings also have a poll 1.
- There should not be duplicate polling locations in the database. ie. for each riding no polling location should have the same `title`, `address`, `city`, and `postal_code`.
- The form you create should include editable fields for `title`, `address`, `city`, and `postal_code` for each poll. The design is up to you, but consider the user experience carefully. By the end of this assignment, you should be able to edit polling locations for any riding on a single screen and be able to call `PollingLocation.polls` to return a list of all polls at that report to that location. Users should be able to edit all polling locations and their poll assignments on the same screen. Note that you should not create a form specifically for adding individual polling locations.
- The form should be unique to each riding. Ie. the form for Avalon, should be different than the form for Toronto-Centre.
- A poll isn't required to have a polling_location.
- If a polling_location doesn't have any polls assigned to it, it should be destroyed.
- If a polling_location has errors, they should be displayed to the user.

## The application structure

The application is a Rails 7.1.3.4 application using Ruby 3.3.0. Tailwind CSS is used to style the application, and is included in the procfile. `./bin/dev` should get you up and running after you install the dependencies.

We have provided you with a number of models:

- `riding`
- `poll`
- `polling_locations`

A riding has many polls, and many polling_locations. A poll belongs to a riding and a polling_location.

We have provided a `seeds.rb` file to provide you some base data to work with. After you seed your database you should have 338 ridings, 69,606 polls, and 207 polling locations (all in the riding of Avalon).

The two views that likely concern you are the riding index page (root), and if you click on the riding name from this view, the riding show page. This page will display the riding name, riding_code, province, and all polling locations for this riding.

You can make any changes you deem fit to the application to create your solution.

## Your submission

We want to see how you write code. The example application is basic, but that doesn't mean your solution should be inelegant or hard for the user to understand and use. This role will have a large stake in building and deploying features to our existing applications, as well as designing new applications. You should be able to handle everything from front end design & development, Stimulus & javascript, db queries, to testing. So show us what you've got.

To reiterate:

- `polls` can share `polling_locations`.
- `polling_locations` are unique to a riding, and should not be duplicated in the same riding.
- `polling_locations` should be shared across ridings.
- We should be able to edit all polling locations for a riding on the same screen.
- We should be able to edit the seeded data for Avalon to edit the polling locations, and not result in duplicate locations being created.
- We should be able to select any riding and create new polling locations by entering a `title`, `address`, `city`, and `postal_code` for each poll.

Again, we want to see what you'd do if we assigned you this task at work. If you think something should exist for this, then include it in your submission. There aren't any tricks, this is the main part of the interview process.

To submit your application please fork this repository, and create a pull request with your new feature. Do not make the pull request on this repository as other candidates will see them. When you're ready to submit your pull request please send a link to the email address provided to you. Please include your full name, address, phone number, and email address in your submission.

If you have specific questions about the assignment, email the email address provided to you.

Thank you for taking the time to apply, we look forward to your solutions.
