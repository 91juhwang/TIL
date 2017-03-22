# Redux Fundamentals

Example app link: [github.com/91juhwang](http) This Redux note is from building this link. 

Designing a Redux app often begins by thinking about the application state data structure. This is what describes what's going on in your application at any given time.

Even though all frameworks and architectures have their own states, such as Models, Factories, Services, etc.. Redux is different as it only has one **Tree data structure.** 

It does not have methods and functions that forms the *behavior* of the application. Because of this reason, **it lets you think about the *state* for your application** by isolating these behaviors. Everything is pure data and it is tucked into one object. 

Because of this reason, it is important to think about the possible states before you actually start building the app. The purpose of the app is to vote and we call these categories entries. Entries will have multiple choices/selections. see below image:

![alt text](https://drive.google.com/uc?id=0B0SrQss4KDbOVzl1bGptb28tUG8)

Once the vote begins, there should be way to distinguish what is currently being voted on. There could be a vote data strucutre, which holds the pair of items that are currently being voted on. Items in the `entry` structure should be moved to the new `state`, to the `vote` structure as the new state now takes those items to be voted. **First two entries are compared** See the image:

![alt text](https://drive.google.com/uc?id=0B0SrQss4KDbOZi1hRVc4cmZxeTg)

After the votes, we should also record the current score, the tally of votes. Scores happen during the vote, so the state is stored inside the `vote` structure. 

![alt text](https://drive.google.com/uc?id=0B0SrQss4KDbOMjE1d3l4dUhaV3M)

Once the vote is done, the losing entry(item) will be thrown away and the winning entry goes back inside the `entry` structure as the **last** item. This way, we can later voted against something else as entries gets deleted and moves up the structure.

