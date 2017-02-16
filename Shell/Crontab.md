# Generate scheduled commands (Cron jobs)

## Instructions & Commands

- Edit the cronjob by running the below command (MacOS)
  * `sudo su -` - Become a root
  * `crontab -u username -e` - Open the crontab for the username
  * write commands and save the file
  * `crontab -u username -l` - Check the cronjob list for the username

- Syntax
  * [timing sequence] commandToRun
  * `The first asterisk is for specifying the minute of the run (0-59)`
  * `The second asterisk is for specifying the hour of the run (0-23)`
  * `The third asterisk is for specifying the day of the month for the run (1-31)`
  * `The fourth asterisk is for specifying the month of the run (1-12)`
  * `The fifth asterisk is for specifying the day of the week (where Sunday is equal to 0, up to Saturday is equal to 6)` 

- Example (tabs used, and not spaces between each asteriks)
  * `0  13  * * *` - everyday at 1:00pm
  * `30 * * * *` - everyday every 30 minutes
  * `*  *  *  * 3` - once a week on Wednessday

- List the cron jobs
  * `crontab -l`

- Mail the log
  * `MAILTO=hello.junsuk@gmail.com` - on top of the script 

- Setup RVM cron to run ruby scripts for RVM Environments

- Reference
  * [http://www.nncron.ru/help/EN/working/cron-format.html](http://www.nncron.ru/help/EN/working/cron-format.html)

