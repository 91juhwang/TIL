Why are you interested in a career in tech?
 
  First, I believe that technology is in the center of making our lives better. Hundreds, Thousands, even millions of people are benefitting from a one great product as well as inspiring the whole community to think and move forward. Pursuing a career in a tech is important to me because it will not only continuously drive me to learn new skills and grow, but also leverage my skills to contribute and help people live better by making prodcuts that are meaningful. I also believe that tech industry values the work and is abot the work more than any other industries. I would like to work at a place where the work is valued, the motivation continues and the work contirubtes to the world. Tech industry shares lot of values and traits that I care about, and this is the reason why I highly desire to pursue a career in the tech industry. 

# What makes you a good fit for the Spotify NYC Technology Fellowship Program?

  First, I believe in hard works, and I consider myself as a driven do'er. One reason that proves why I am a good fit is that I took a brave action to pursue something I love(programming) and achieved it with a top-notch performence. I've seen many people dropping out of the bootcamp, but also seen many more people stopping coding after the graduation. I have kept my motivation alive, even higher until today. I "pushed" myself to "push" commits almost everyday to continuosuly learn and be a better programmer. I enjoy programming. The secret to my motivation comes from the pure enjoyment of the development and its surrounding environment, where I get to work with smart, skilled people to learn and create something beatiful. 
  
  Second, I come from the business background, which allows me to understand the both sides about the business and the development. This ability will bring benefits to Spotify and helps me to quickly adapt and deliver business solutions along with the technical parts as well. I believe taht 

# You're working on a time-sensitive project with a team of four other people, and one of your teammates, who works remotely, has consistently missed your team's deadlines. Assume that you have to write an email to this teammate to address the issue. What would you say, and how would you say it? Please write a short sample email here.

  Hi John, 

  How are you? I hope all is well with you. 

  I’m writing this email to open up a discussion about our current work processes and some of the expectations that we have for each other. 
  We noticed that you have been missing deadlines for past few weeks, and I would like to know if there are any concerns or worries that we can address together. Perhaps, the work amount was too much, had unexpected personal issues, or any other things that might be keeping you from meeting the deadlines. 
  As you already know, deadlines are very important to us, and we would like for you to deliver in time. We would like to provide full supports in the areas where we can help, and we also expect you to do the same as well. 

  In terms of our current work flows, I thought about implementing Trello to share and set primary do lists, where we can efficiently manage it together, and having a daily stand-ups, where we can share the work progresses and the daily plans. This way, we can all have clear ideas on everyone's expectations, and address bottle necks by tracking the issues and assist each other when needed. 

  I would like to have this discussion opened for everybody, so please feel free to drop any feedbacks or comments. I look forward to hearing from you. 

  Thank you!

# Using your preferred language, please create an input string and then demonstrate how you would reverse it. For example: an input of "Programming is so much fun!" should return "!nuf hcum os si gnimmargorP". Do *not* use a built-in method, and be sure that your code is written clearly, in a way that enables others to easily understand your approach. 
  # .chars returns an array of each letters
  # and we use .sort_by, which map and return values using a following block,
  # which the block contains the value and the index from .with_index method.
  # and we sort_by the last index and returns the .join values
  puts a.chars.sort_by.with_index { |x, y| -y }.join

  # the initial memo value of x is s, and the enumerating value of y is t.
  # .reduce sets the new value for the memo value of x after the operation.
  # x now becomes `ts` from t + s, and the memo value of x becomes `ts`.
  # with the enumerating value of y, r, it sets the new memo value of x as r + ts.
  # then, x = rts, y = i, y + x = irts, which again becomes a new value for x
  # x = irts, y = n, y + x = nirts, which again become a new value for x
  "string".chars.reduce { |x, y| y + x }

# Using your preferred language, please create an input array and then write a function to return the second smallest element in that array. For example: an input of {42, 8, 13, 79, 5, 2, 18} should return 5. *
