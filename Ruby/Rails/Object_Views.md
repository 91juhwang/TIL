# Object views for Rails!!!

## Problem

I have been adding business logic inside the view, which I now know to get rid of a lot of them as I learned more. 
However, I still tend to add busines logics sometimes, and sometimes hitting the database in the view seems very necessary. 

## Solve

So I went and did the research, talked to senior developers to find out the best practices. 
Use Object Views.
IMPORTANT: Views should only display already computed values. **

## Instructions & Tips

- Use PORO
  * Plain Old Ruby Objects - Extract logics out of the view or presenter logics and create a new presenter. 
  
http://blog.steveklabnik.com/posts/2011-09-06-the-secret-to-rails-oo-design
