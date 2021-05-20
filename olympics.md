---
title: "120 Years of Olympics"
output:
  word_document: default
  html_document: default
  font-family: Helvetica
---

This application was created as my semester project for Data
Visualization4 course at CEU in 2021. The Shiny App tries to ask some
question and answer them related data on the Olympic Games from 1896 to
2014. This is a really simple and easy-to-use application.

I used the data from (originally:
<a href="https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results" class="uri">https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results</a>).
I have already used this data set for my Tableau semester project and
Data Engineering semester project.

Data includes athlete name, gender, age, height, weight, team, NOC
(country), games, year, season, city, sport, and medal. Data is missing
in 1916, 1940 and 1944 because of World War I and World War II.

Instructions for the tabs: Countries: Time series plot created with
plotly. It shows which nations participated with the most athletes in
that particular year, Olympic game. Medals: This is an aggregate
calculator for the medals won by each nation, divided by medal types.
Medals over time: A similar time series plot as the one at the tab
called Countries. It shows the distribution of medals throughout the
years by the countries.

Parameter: Under this tab you can give parameters. There is a slider to
change the time period and years. There is also a numeric input which is
set to showcase the given number of countries only (from 2 to 10).
Finally, there are two checkboxes to filter down to gender or type of
Olympic game (summer or winter).

Additionally, on all the tabs we can see a data table which showcases 5
athletes with all their information. You can search it by word, filter
it to 5-10-15 findings per page. Not to mention that the filters are
also working for this.
