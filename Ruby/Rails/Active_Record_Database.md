# Database Query & Active Record

## Q & A

1. Q: How can I retrieve records using partial string?
  * A: `Movie.where("title like ?", "%Manhattan%")`
  > %Manhattan will get you: Love in Manhattan
  > Manhattan% will get:  Manhattan and Company
  > %Manhattan% will get you both: [Love in Manhattan, Manhattan and Company]