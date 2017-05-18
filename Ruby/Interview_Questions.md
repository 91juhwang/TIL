# Interview Questions & Concepts

## Concerns

Concerns encapsulate both data access and domain logic about a certain slice of responsibility. 

## Modules

Purpose is to maintain the separation of concerns and decouple dependencies.

  * Traits/Mixins - when there is a need to acquire a specific behavior that describes traits.(Readeable, Taggable, etc.) instead of `is-a` relationship. When there is a need for multiple traits, inheriatnace can only inherit once. Alternative to class inheritance.

  * Namespace - to avoid naming crashes

  * stateless helper methods - without needing a class, bag of multiple methods. 
  

## Questions

  * what is class?

    * First class instance

  * What is the difference between a lambda, a block and a proc? 

    * Proc is a reusable block that can be passed around. It acts very similar to Lambda, but lambda checks for the arguments and throws an error if invalid numbers of arguments are passed. Proc returns nil when the arguments are incorrect. Block is a way of grouping lines of codes, statements and logics.

  * What are some of your favorite gems? What are their alternatives?

    * pry, 

  * In Ruby, which is generally the better option: a recursive function or an iterative one?

  * What are #method_missing and #send? Why are they useful?
  
  * What are the various Ruby runtimes, and how are they different?

  * Walk through the flow of a request through Rails.

  * Explain CSRF and how Rails combats it.

  * Why do some people say "Rails can't scale"?

  * What is Rack?

  * What is middleware? How does it compare to controller filters/actions?

  * What is the purpose of the rakefile available in the demo directory in Ruby?

    * The purpose of this simple question is to make sure a developer is familiar with a test-driven development. A beginner may not have dealt with this file yet. The rakefile is similar to the makefile in Unix, and assists with packaging and testing Rails code. It’s used by the rake utility, which ships natively with the Ruby installation.

[Reference](http://www.skilledup.com/articles/ruby-on-rails-interview-questions-answers)

  