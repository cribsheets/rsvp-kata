# RSVP (an app kata from cribsheets)

This application is a straightforward implementation of a simple web-based RSVP
application. Users visit a page and indicate whether they can attend an event;
this RSVP is stored in a relational database. In subsequent parts, the project
gains complexity.

It mimics the usual pathway of growth for a typical web application: make it
work with a minimal feature set, add a deployment scenario, follow on with
authentication, then use the authentication to create a multi-tenant application
deployed to the cloud. After that, adding an independent web front end
contacting an API, followed by a mobile front end.

It is presented as an application kata, a practice application to be used to
develop muscle memory in an increasingly complex (but familiar) codebase.

To play along, fork this repo and implement in the framework of your choice.

# Part 1: Relational Storage, Run Locally

## Background

The client is creating a simple RSVP service for its users. One user can create an event, and other users can respond in the affirmative or negative.

## Features

### List Events

By visiting `/events/`, a list of currently-existing events is displayed. From
this event, a link allows the user to create a new event. For each event, a link
allows the user to edit or delete the event. Another link in the event's display
allows a user to respond to an event.

### Create an Event

By visiting `/events/new` (or similar), a form is displayed that allows the user
to create a new event, giving it a title and a date. Both are required fields.
If one is missing, the form is returned with an indicator of the missing field.

### Display an Event's Details and Respond

By visiting `/events/:id` (e.g., `/event/3`), a page is displayed showing the
details of the event, and a form that the user can fill out to respond to the
event. The fields are `name`, `email` address, and a checkbox indicating that
they are `going` to attend. Submitting this form will create an
`event_response`.

### Edit an Event

By visiting `/events/:id/edit` (or similar), a form is displayed prepopulated
with event data, which can be edited and saved (or cancelled to return to the
event list).

### List Event Responses

By visiting `/events/:id/responses/` a list of responses for that event is
displayed. The page should also include a link to the event detail.

## Rough Data Model

An `event` includes a title and a date.

An `event_response` includes a reference to the `event` to which it refers
(likely the `id`), its own `id`, a `name`, validated `email` address, and a
boolean flag indicating whether the responder is `going` or not. (In this case,
validate that the email is a valid email address format, not that the email
address is a real email address.)

## Requirements

README in the git repo (this file) should indicate how to check out the project, run the
project locally, and run the project's tests.

Unit tests should validate each action in positive (it works as expected) and
negative (it fails as expected) cases.

All features are implemented.

## Implementation Recommendations

Find a nice calendar widget for inputting the date for the event. Don't
overcomplicate the project, but use `bootstrap` or some other UI framework to
make things simple, yet pleasing.

# Part 2: Container'd, Additional Features

## Features

### Dashboard

### Email Notification on Change

### Run in Docker Container

# Part 3: Authentication / Reporting

# Part 4: Multi-tenant Implementation

# Part 5: Heroku / AWS Deployments

# Part 6: Outlook Calendar Integration

# Part 6: ReactJS Front End

# Part 7: React-Native mobile app

# Part 8: Guest Registration

## Features

### Guest user invite

### Guest user registration by account
