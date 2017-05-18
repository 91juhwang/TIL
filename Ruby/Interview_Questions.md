# Interview Questions & Concepts

## Polimorphism

 The ability for data to be represented in many different types. Or providing a single interface to entities of different types.


 * Inheritance

 * Modules

#### Duck Typing:

[Reference](http://rubylearning.com/satishtalim/duck_typing.html)

Rely less on the objects, but rely more on a behavior, the capabilities.

This means that Ruby concerns less with the class of an object, but more concerned with what methods can be called on it, and what operations can be done on it.

  * 

## Encapsulation

  Hiding pieces of functionality and making it unavailable to the rest of the code base. It is a form of data protection, so that data cannot be manipulated or changed without obvious intention.

  Ruby, like many other OO languages, accomplishes this task by creating objects, and exposing interfaces (i.e., methods) to interact with those objects.

## Concerns

Concerns encapsulate both data access and domain logic about a certain slice of responsibility. 

## Modules

Purpose is to maintain the separation of concerns and decouple dependencies.

  * Traits/Mixins - when there is a need to acquire a specific behavior that describes traits.(Readeable, Taggable, etc.) instead of `is-a` relationship. When there is a need for multiple traits, inheriatnace can only inherit once. Alternative to class inheritance.

  * Namespace - to avoid naming crashes

  * stateless helper methods - without needing a class, bag of multiple methods. 
  
  ```ruby
    # mixin
    module Speak
      def speak(sound)
        puts "#{sound}"
      end
    end

    class GoodDog
      include Speak
    end

    class HumanBeing
      include Speak
    end

    sparky = GoodDog.new
    sparky.speak("Arf!")        # => Arf!
    bob = HumanBeing.new
    bob.speak("Hello!")         # => Hello!
  ```
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

    * Cross-Site Request Forgery: protects from controller actions by checking the sesison based token.

    * We may want to disable CSRF protection for APIs since they are typically designed to be state-less. That is, the request API client will handle the session for you instead of Rails.

  * Why do some people say "Rails can't scale"?

    * Beause Rails comes with many bloated, pre-generated files to make it easy for the user and be efficient in productivity. 

    * Ruby in language itself is slower because it is a dynamic interpret language. In Webs it does not matter that much, but as it scales it could be a problem.

  * What is Rack?

    * Rack wraps HTTP requests and responses. It unifies the API for web servers, web frameworks, and software in between (called middleware) into a single method call.

  * What is middleware? How does it compare to controller filters/actions?

  * What is the purpose of the rakefile available in the demo directory in Ruby?

    * The purpose of this simple question is to make sure a developer is familiar with a test-driven development. A beginner may not have dealt with this file yet. The rakefile is similar to the makefile in Unix, and assists with packaging and testing Rails code. It’s used by the rake utility, which ships natively with the Ruby installation.

[Reference](http://www.skilledup.com/articles/ruby-on-rails-interview-questions-answers)

  