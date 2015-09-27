Greetings !  Welcome to my project.

The first thing that I did was to read in all of the data file.
I ran into a problem here - my computer didn't have enough memory to read in the large test & train files, so I had to read in only the mean & SD data that we need for step 4.  That is why I have the long list of widths in the read.fwf lines.

Once the files were read in, I set about putting them together.  People identifiers were added as the first column, and the activity code & description were added as the last 2 columns.  Column headings were applied.  Except for the column headings that I added myself, all headings were taken from the features.txt file.

Once the individual data sets had labeled columns, labeled rows, and complete user data, I merged the 2 data sets together.  Rather than a slow merge, I used a fast append function - I used the row bind to append one file to the other.

I then proceeded to create a new clean file that contained the averages and standard deviations of the 66 fields in the original file that refereced a mean or standard deviation.  This clean file was written out and uploaded to this site.

I commented my code, so I hope that you will have an easy time going through this projet.

Thank you for grading me !  Sincerely, Nick.
