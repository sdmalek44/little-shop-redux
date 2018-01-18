---
layout: page
---

# Little Shop Redux

## Abstract

In this project you'll use Ruby, Sinatra, and Activerecord to build a site that shows items by categories and analyzes those items.

## Learning Goals

### ActiveRecord

* Use ActiveRecord migrations to create a normalized database.
* Use beginner/intermediate ActiveRecord queries to calculate and report on information in the database.
* Utilize ActiveRecord methods and relationships to efficiently query the database.

### User Experience and Conventions

* Use Sinatra and ERB templates to render views to create, read, update, and delete resources using RESTful routes and appropriate HTTP verbs.
* Use Sinatra and ERB templates to display a dashboard not related to a specific resource saved in the database.
* Use HTML and CSS to create a user experience that allows users to comfortably navigate a site.

### Code Organization/Quality

* Organize code using best practices (use POROs when appropriate, avoid long methods, etc.).
* Create methods using ActiveRecord on the appropriate class.

### Testing

* Use RSpec to drive development at the feature and model levels.

### Working Collaboratively

* Use Git and GitHub to work collaboratively, develop in smaller groups, and resolve merge conflicts

## Getting Started

### Define the Relationship with Your Group

DTR with your group [here](http://backend.turing.io/career_development_curriculum/module_one/dtr_guidelines_memo). One group member should send a link of the forked gist to your anchor as soon as it's complete.

### Clone the Project

1. One team member forks this skeleton repository.
1. Add the other team members as collaborators.
1. Add instructors as collaborators.

### Requirements

This project must use:

* [Sinatra](http://www.sinatrarb.com/)
* [PostgreSQL](http://www.postgresql.org/)
* [ActiveRecord](http://guides.rubyonrails.org/active_record_basics.html)

This base repo has already configured those three for you.

You'll want to set up the [DatabaseCleaner](https://github.com/DatabaseCleaner/database_cleaner) gem in order to have a clean database each time you run tests. Follow the instructions for setting up the gem. Due to a bug in the most recent version of the gem, you'll need to use this line when you set the strategy in your test helper file:

```ruby
DatabaseCleaner.strategy = :truncation
```

See the "Resources" section at the bottom of this page for additional helpful documentation.

### Restrictions

The project may not use:

* `Rails`

## Instructions

Iterations 0-9 must be completed in order to consider the project complete.
Please TDD throughout. Tests are expected for all features and all models.

## Base Expectations

### Iteration 1

Create full CRUD functionality for a merchant with the following characteristics:

* name - must be present

Once you have the `Merchant` model started, finish it off by creating validations for the `Merchant` attributes.

You can use ActiveRecord's [validations feature](http://guides.rubyonrails.org/active_record_validations.html) to make sure no record is saved without having all attributes present.

**Be sure to have a test for each individual validation.**

At the end of this iteration, you should be able to view an index of all merchants, view a page for a single merchant, create a merchant, edit a merchant, and delete a merchant from either the index or the show pages

### Iteration 2

Seed Merchants from [CSV](data/merchants.csv).

### Iteration 3

Create full CRUD functionality for a category with the following characteristics:

* name - must be present

Once you have the `Category` model started, finish it off by creating validations for the `Category` attributes.

You can use ActiveRecord's [validations feature](http://guides.rubyonrails.org/active_record_validations.html) to make sure no record is saved without having all attributes present.

**Be sure to have a test for each individual validation.**

At the end of this iteration, you should be able to view an index of all categories, view a page for a single category, create a category, edit a category, and delete a category from either the index or the show pages.

### Iteration 4

Create Seeds for Categories.

### Iteration 5

Create full CRUD functionality for an item with the following characteristics:

* title
* description
* price
* image

Once you have the `Item` model started, finish it off by creating validations for the `Item` attributes.

* All the attributes must be present.

You can use ActiveRecord's [validations feature](http://guides.rubyonrails.org/active_record_validations.html) to make sure no record is saved without having all attributes present.

**Be sure to have a test for each individual validation.**

At the end of this iteration, you should be able to view an index of all items, view a page for a single item, create an item, edit an item, and delete an item from either the index or the show pages.

- When creating an item, there should be a dropdown of all merchants and categories to select from.

### Iteration 6

- Seed Item [CSV](data/items.csv).

### Iteration 7

Create a item dashboard route. When you visit `/items-dashboard` you should be shown a page with the following information:

* Total count of items
* Average price per item.
* Most recently created item.
* Oldest item.

### Iteration 8

Create a categories dashboard route. When you visit `/categories-dashboard` users should be shown a page with the following information:

* Average price of item breakdown by each category.
* Category with most expensive item.
* Category with least expensive item.


### Iteration 9

Create a merchants dashboard route. When you visit `/merchants-dashboard` users should be shown a page with the following information:

* Merchant with the most items and that items information.
* Merchant with the highest priced item and that items information.
* Breakdown of each merchant with total number of items and total price for all items.

## Extensions

* Use [Google Charts](https://developers.google.com/chart/) to display information on one or more of your dashboards.
* Read about [JSON](http://www.ruby-doc.org/stdlib-2.0/libdoc/json/rdoc/JSON.html). Create an endpoint at `api/v1/items/:id` that responds to requests with JSON instead of HTML.
* Deploy your application to [Heroku](https://devcenter.heroku.com/articles/rack)
