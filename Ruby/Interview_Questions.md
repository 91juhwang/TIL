# Interview Questions & Concepts

## Concerns

Concerns encapsulate both data access and domain logic about a certain slice of responsibility. 

## Modules

Purpose is to maintain the separation of concerns and decouple dependencies.

  * Traits/Mixins - when there is a need to acquire a specific behavior that describes traits.(Readeable, Taggable, etc.) instead of `is-a` relationship. When there is a need for multiple traits, inheriatnace can only inherit once. Alternative to class inheritance.

  * Namespace - to avoid naming crashes

  * stateless helper methods - without needing a class, bag of multiple methods. 


## Questions

  * What is the difference between a lambda, a block and a proc? [I have gotten this one at every Ruby interview I've been in]

  * How do you sort an Array of objects by a particular attribute? What is a better way to do sorting with ActiveRecord?

  * What are some of your favorite gems? What are their alternatives?

  * In Ruby, which is generally the better option: a recursive function or an iterative one?

  * What are #method_missing and #send? Why are they useful?
  
  * What are the various Ruby runtimes, and how are they different?

  * Walk through the flow of a request through Rails.

  * Explain CSRF and how Rails combats it.

  * Why do some people say "Rails can't scale"?

  * What is Rack?

  * What is middleware? How does it compare to controller filters/actions?
  