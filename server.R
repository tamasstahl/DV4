
olympics <- read.csv(file = "olympics.csv", stringsAsFactors = FALSE)


server <- function(input, output){
    data <- reactive({               
        olympics %>%                  
            filter(Year >= input$years[1], 
                   Year <= input$years[2],
                   Season %in% input$season,
                   Gender %in% input$gender) 
    })
    
    filter_country <- reactive({      
        data() %>% 
            group_by(Country) %>%           
            summarise(nb_medals = n()) %>%  
            arrange(desc(nb_medals)) %>%    
            head(input$max_country)         
    }) 
    
    
    ranking <- reactive({
        data() %>%                                      
            group_by(Country, Medal, .drop = FALSE) %>% 
            summarise(Nb = n()) %>%                     
            spread(key = Medal, value = Nb) %>%         
            arrange(desc(Gold)) %>%       
            ungroup() %>%                               
            head(input$max_country)                     
    })
    
    
    output$medal <- renderPlot({
        gold_medal <- ranking() %>% arrange(Gold) 
        if(nrow(gold_medal)>0){
            gold_medal$Country <- ordered(gold_medal$Country, levels = gold_medal$Country)
            gold_medal %>% 
                gather(key = Medal, value = Nb, -Country) %>% 
                mutate(Medal = ordered(Medal, levels = c("Bronze","Silver", "Gold"))) %>% 
                ggplot(aes(x = Country, y = Nb, fill = Medal)) + 
                scale_fill_manual(values = c("Gold" = "yellow", "Silver" = "gray", "Bronze" = "red")) +
                geom_col() + coord_flip() 
        }
    }, height = 400)
    
    output$pt <- DT::renderDataTable({data()}, 
                                     options = list(   
                                         lengthMenu = list(c(5, 10, 15), c('5 lines', '10 rows', '15 items')),   
                                         pageLength = 5  
                                     ))
    
    output$dt <- DT::renderDataTable({data()}, 
                                     options = list(   
                                         lengthMenu = list(c(5, 10, 15), c('5 lines', '10 rows', '15 items')),   
                                         pageLength = 5  
                                     ))
    
    output$st <- DT::renderDataTable({data()}, 
                                     options = list(   
                                         lengthMenu = list(c(5, 10, 15), c('5 lines', '10 rows', '15 items')),   
                                         pageLength = 5  
                                     ))
    

    output$countries <- renderPlotly({
        olympics <- data() %>% filter(Country %in% filter_country()$Country)
        g <- olympics %>% ggplot(aes(x = Year, fill = Country)) + geom_bar(width = 1.5)
        ggplotly(g)
    })
    
    output$medals_time <- renderPlotly({
        olympics <- data() 
        f <- olympics %>% ggplot(aes(x = Year, fill = Medal)) + geom_bar(width = 1.5) +
            scale_fill_manual(values = c("Gold" = "yellow", "Silver" = "gray", "Bronze" = "red"))
        ggplotly(f)
    })
    
    output$box1 <- renderValueBox({
        olympics <- data()
        valueBox(
            value = format(sum(olympics$Medal=="Gold"), big.mark = ",", scientific = FALSE), 
            subtitle =  "Gold",
            icon = icon("medal", lib = "font-awesome"),
            color = "yellow",
            width = 4  # Width in Bootstrap mode: needs a column()!
        )
    })
    
    
    output$box2 <- renderValueBox({
        olympics <- data()
        valueBox(
            value = format(sum(olympics$Medal=="Silver"), big.mark = ",", scientific = FALSE), 
            subtitle =  "Silver",
            icon = icon("medal", lib = "font-awesome"),
            color = "navy",
            width = 4  # Width in Bootstrap mode: needs a column()!
        )
    })
    
    output$box3 <- renderValueBox({
        olympics <- data()
        valueBox(
            value = format(sum(olympics$Medal=="Bronze"), big.mark = ",", scientific = FALSE), 
            subtitle =  "Bronze",
            icon = icon("medal", lib = "font-awesome"),
            color = "red",
            width = 4  # Width in Bootstrap mode: needs a column()!
        )
    })
    
}
