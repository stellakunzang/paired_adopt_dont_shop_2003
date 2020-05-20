# Paired: Adopt Don't Shop
Back End Mod 2 Paired Project
_Ana Pérez Santos and Stella Bonnie_

## Learning Goals 

_From Instructors_

### Rails
* Describe use cases for a model that inherits from ApplicationRecord vs. a PORO
* Use MVC to organize code effectively, limiting the amount of logic included in views and controllers
* Make use of flash messages
* Use Inheritance from ApplicationController or a student created controller to store methods that will be used in multiple controllers
* Use POROs to logically organize code for objects not stored in the database

### ActiveRecord
* Use built-in ActiveRecord methods to:
* create queries that calculate, select, filter, and order data from a single table

### Databases
* Describe Database Relationships, including the following terms:
* Many to Many
* Join Table

### Testing and Debugging
* Write feature tests utilizing
* Sad Path Testing
* Write model tests with RSpec including validations, and class and instance methods

### Web Applications
* Explain how Cookies/Sessions are used to create and maintain application state
* Describe and implement ReSTful routing
* Identify use cases for, and implement non-ReSTful routes
* Identify the different components of URLs(protocol, domain, path, query params)

_*From Team Members*_

### Ana
* Github best pratices 
* Troubleshooting merge issues 

### Stella 
* Gain appreciation for the benefits of working with a partner 
* Develop competence using project management 

### Together 
* Gain confidence interacting with database in `rails c` 
* Become more comfortable using ActiveRecord 
* Be able to implement fundamental styling 
* Get better at testing for edge cases in RSpec 
* Improve writing query code for SQL and ActiveRecord 
* Learn how and when to write methods in models

## Project Description
We worked individually and in pairs to build on Stella's "Adopt Don't Shop" solo project, following the ample user stories presented by the instructors. We chose this project as this base because it included some modest styling, including custom css, that would give us a leg up on styling the pages we would build for this new project. 

In addition to adding functionality to existing pages, we also built pages for shelter review, favorites, and adoption applications. On the site, a user can now leave a review for a shelter, add a pet to their favorites, apply to adopt a pet, and have their application approved which includes the pet no longer being listed as adoptable by others. We also successfully implemented flash messages throughout the site, following the requirements in the user stories. 

Some of the more interesting challenges we faced included implementing the functionality related to favorites which included working with sessions in order to track the favorites for a given session as though it were a shopping cart. We first tried to use an array to store this data but ended up switching to a hash and adhering more closely to the cart lesson. 

Creating the joins table for Pets and Adoption Applications (called Pet Applications) was another new challenge where we learned lessons the hard way; approving an application for a particular pet required adding a column to the Pet Application table with approval status, but initially we added it to the Adoption Applications table before realizing that approving that application would approve all pets that it was for, rather than just one as intended. 

## Challenges 
We tried to put methods into the models and controllers following best practices, but struggled with a few helper methods which were left in the controllers. The helper methods that we did create in the models mainly used ruby instead of ActiveRecord so this is an area we can strive to improve in the future. We were also left with some questions about whether our routes were RESTful and how we could make them more restful while also passing all the required data. It seems like query params might be the solve, and in one case we did utilize query params to pass data that was otherwise inaccessible. 

We were unable to go back and implement partials to dry out the code and eliminate uneccesary repetiton in the views because of time limitations. We also had a few other issues that, because they were not urgent, were postponed until the end if there was time and ended up being left unresolved. 

The most glaring of these is that pet application can't apply to more than one pet. A checkbox appears on the form for every favorited pet and a user can check multiple boxes, but only one pet object is carried over to create the new application. We have, however, verified that an application can work for multiple pets by creating these manually in the tests and the seeds. The same application can be used to create multiple Pet Application instances with different pets. 

Another issue left unresolved is the testing of autopopulated fields. We confirmed that the information appears on the local server when an edit page is displayed, but in the test it cannot detect those fields. There is still a lot to learn about testing and a lot of time was spend throughout the project determining how best to test different things (ex. check boxes, images, autopopulated forms).

## Questions for Reflection
We agreed when we began this project that our priority was learning, and if that meant we might not pass because we spent longer learning and implementing new concepts then so be it. Did we meet our personal learning goals? How might we have structured this project differently to meet learning goals and complete all required functionality?  


