Flux
================

Flux is a personal repository for recent scientific journal articles. Flux scrapes newly published article abstracts and metadata and aggregates them in a unified searchable interface. New articles are automatically sought out daily and indexed.

![Flux Screenshot](/public/screenshot.png)


####Hosting
----------------

Flux is a Rails application, and designed to be run without interruption. I recommend hosting on a dedicated machine in your LAN and setting up port forwarding. 

Before starting the server you will need to create a new database.yml file, and enter credentials for a Postgres database. See 'database_example.yml' for an example YAML file. After doing so, you should run 'db:schema:load', followed by 'rake db:seed'.


####Adding new journals
----------------

Scrapers for each scientific journal reside in 'lib/scrapers/'. By convention, the filename of each scraper is the corresponding Journal object's whitespace-stripped and underscored name. To add a new journal, modify 'seeds.rb' to create a new Journal object, and create the appropriate scraper. See existing scrapers for examples.


####Legal Questions
----------------

Is web scraping illegal? This can be a difficult question to answer. In short, it depends on whether the gathered information is for personal or public consumption, and on the nature of the content itself. See this [Wikipedia entry](https://en.wikipedia.org/wiki/Web_scraping#Legal_issues) for an overview of recent court rulings.

Also of note, under U.S. copyright law websites do have the legal authority to deny off-site storage of digital copyrighted media, which includes textual content. Specific websites may have their own terms of service or EULA in which scraping may be banned. 

Notwithstanding the above, publishing code to scrape a website is legally permitted, which is the extent of what is hosted in this repository. It is your responsibility to use this tool in an appropriate manner. 


####License
----------------

Copyright (c) 2015 Max Gillett

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
