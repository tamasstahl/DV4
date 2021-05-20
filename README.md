# DV4 

## Semester project - 120 years of Olympics

**I would like to go for the minimal project as I had no time to deploy it to Docker. However, I would like to add that I used htmlwidget.org (specifically plotly).**

This application was created as my semester project for Data Visualization 4 course at CEU in 2021. The Shiny App tries to ask some questions and answer them in connections with the Olympic Games from 1896 to 2014. This is a really simple and easy-to-use application.

I used the data from (originally: https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results). I have already used this data set for my Tableau semester project and Data Engineering semester project.

Data includes athlete name, gender, age, height, weight, team, NOC (country), games, year, season, city, sport, and medal. Data is missing in 1916, 1940 and 1944 because of World War I and World War II.

**There is no global.R as all the calculations were done in the server.R file.**

Instructions for the tabs:
1. Countries: Time series plot created with plotly. It shows which nations participated with the most athletes in that particular year, Olympic game.
2. Medals: This is an aggregate calculator for the medals won by each nation, divided by medal types.
3. Medals over time: A similar time series plot as the one at the tab called Countries. It shows the distribution of medals throughout the years by the countries.

4. Parameter: Under this tab you can give parameters. There is a slider to change the time period and years. There is also a numeric input which is set to showcase the given number of countries only (from 2 to 10). Finally, there are two checkboxes to filter down to gender or type of Olympic game (summer or winter).

Additionally, on all the tabs we can see a data table which showcases 5 athletes with all their information. You can search it by word, filter it to 5/10/15 findings per page. Not to mention that the filters are also working for this.

**Please find my working dashboard deployed to Shinyapps.io.
https://tamasstahl.shinyapps.io/semester_project_TS**
