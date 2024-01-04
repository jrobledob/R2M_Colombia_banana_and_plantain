Analisis of individual Questions EKE Colombia - Banano and Plantain 2023
================
Jacobo Robledo
2024-01-03

## Libraries, Functions, and Global Variables

#### `tree_map_3` Function

**Description:**  
This function creates a treemap visualization based on a given dataset.
It first calculates the frequency of occurrences for specified grouping
variables and then plots a treemap using these frequencies.

**Parameters:**  

- `data`: A data frame containing the data to be visualized.

- `group`: The name of the column in ‘data’ to be used as the primary
  grouping variable.

- `subgroup_1`: The name of the column in ‘data’ to be used as the first
  level subgroup.

- `subgroup_2`: The name of the column in ‘data’ to be used as the
  second level subgroup.

- `color_column`: The name of the column in ‘data’ that determines the
  color of the treemap blocks.

- `title`: The title to be displayed on the treemap.

**Details:**  
The function groups the data by ‘group’, ‘subgroup_1’, ‘subgroup_2’, and
‘color_column’, then calculates the frequency of each group. It uses the
‘treemap’ package to create the treemap, where the size of each block is
determined by the calculated frequency. The color of the blocks is
determined by the ‘color_column’. The function allows customization of
label sizes, colors, and placement, as well as border colors and widths.

**Returns:**  
A treemap plot as specified by the input parameters.

**Example Usage:**  
`tree_map_3(my_data, "main_category", "sub_category1", "sub_category2", "color_var", "My Treemap Title")`

#### `Col_map_by_depto` Function

**Description:**  
This function creates a colored map visualization based on departmental
data. It utilizes the `colmap` function to map data to specific
geographical areas (departments) and applies a continuous color scale to
these areas.

**Function Structure:** - `colmap(departamentos, data, data_id, var)`:
Maps the `var` variable from the `data` data frame onto the
`departamentos` geographical layout. The `data_id` specifies the
matching column in `data` that corresponds to department IDs. -
`scale_fill_continuous(low, high, na.value)`: Applies a continuous color
scale to the map. The `low` and `high` parameters define the color range
for the lowest and highest values of `var`, respectively. The `na.value`
parameter defines the color for missing values. -
`labs(fill = legend_lab)`: Sets the label for the map legend.

**Parameters:**  
- `departamentos`: The geographical layout of departments. - `data`: The
data frame containing the data to be visualized. - `data_id`: The column
in `data` that corresponds to department IDs. - `var`: The variable in
`data` to be visualized on the map. - `low`: The color representing the
low end of the `var` variable’s range. - `high`: The color representing
the high end of the `var` variable’s range. - `na.value`: The color used
for missing values in `var`. - `legend_lab`: The label for the map’s
legend.

**Example Usage:**  
Suppose you have a data frame `my_data` with department IDs in
`depto_id` column and a variable `population` to visualize. You could
call:

`R Col_map_by_depto(departamentos = my_map_layout, data = my_data, data_id = "depto_id", var = "population", low = "blue", high = "red", na.value = "grey", legend_lab = "Population")`

#### `category_by_mean_by_question` Function

**Description:**  
This function retrieves the category corresponding to a given mean value
for a specific question. It reads a dataset from a specified URL
containing category information in both English and Spanish. The
function allows the user to specify the language for the category
description.

**Parameters:**  
- `question`: The question number for which the category needs to be
found. - `mean`: The mean value whose corresponding category is to be
retrieved. - `language`: A character vector specifying the language of
the category description. Default is `c("en", "es")`.

**Functionality:**  
- The function first rounds the mean value to the nearest whole
number. - It then reads a dataset from a given URL that contains
categories in both English and Spanish. - Depending on the selected
language, it filters the dataset to find the category corresponding to
the provided question number and rounded mean value. - If the language
is set to “en” (English), it retrieves the category from the
`trans_answer` column; if “es” (Spanish), it retrieves from the
`Category` column. - An error message is displayed if the specified
language is not found.

**Returns:**  
The category corresponding to the specified mean and question in the
chosen language.

**Example Usage:**  
Suppose you have a mean value of 3.6 for question number 5 and want the
category in English. You could call:

`R   category <- category_by_mean_by_question(question = 5, mean = 3.6, language = "en")`

#### `count_elements_by_group` Function

**Description:**  
This function is designed to count the frequency of elements within a
specified column that contains comma-separated values. It processes the
data to convert it into a long format and then performs a count of each
element within the specified groups.

**Parameters:**  
- `data`: The data frame containing the data to be analyzed. -
`value_column`: The name of the column in `data` that contains the
comma-separated values. - `group_columns`: A vector of column names in
`data` used to define groups for aggregation.

**Functionality:**  
- The function first uses `separate_rows` to split the comma-separated
values in `value_column` and convert the data into a long format. -
`group_by` is then applied to group the data by the columns specified in
`group_columns`. - `count` is used to count the occurrences of each
unique element within these groups. - The result is a long-format data
frame with the frequency count of each element in the specified groups.

**Returns:**  
A data frame in long format that contains the counts of each unique
element within the specified groups.

**Example Usage:**  
Suppose you have a data frame `df` with a column `categories` containing
comma-separated values and you want to count these values within groups
defined by `column1` and `column2`. You could call:
`R   result <- count_elements_by_group(df, "categories", c("column1", "column2"))`

#### `bar_plot_banana_plantain` Function

**Description:**  
This function creates a bar plot specifically designed for visualizing
data related to ‘Banana’ and ‘Plantain’ categories. It includes
customizable aesthetics such as background color for highlighting, bar
color coding, and an adjustable upper limit for the y-axis to enhance
the proportional representation of data.

**Parameters:**  
- `data_set`: The data frame containing the data to be plotted. -
`x_lab`: Label for the x-axis. - `y_lab`: Label for the y-axis. -
`title`: The title of the plot. - `x`: The name of the column in
`data_set` to be used as the x-axis variable. - `y`: The name of the
column in `data_set` to be used as the y-axis variable. - `facet`: The
name of the column in `data_set` to create facets for different panels
in the plot. - `alpha`: The transparency level for the background color
of the geom_rect. - `background_color`: The name of the column in
`data_set` that contains the background colors for the rectangles. -
`bar_color`: The name of the column in `data_set` that contains the
colors for the bars. - `proportional_limit`: A numeric value to set the
upper limit of the y-axis as a proportion of the maximum value of the y
variable.

**Functionality:**  
- The function starts by converting provided column names into symbols
for `ggplot2` aesthetics. - It calculates the new y-axis upper limit
based on the provided `proportional_limit`. - A ggplot object is
initialized, and layers are added for rectangles, text, and bars, with
aesthetics mapped accordingly. - The plot’s appearance is customized,
including colors for text and lines, and removing the grid lines for a
cleaner look. - The y-axis is scaled with the calculated limit, and
facet panels are created as per the `facet` column.

**Returns:**  
A ggplot object representing the bar plot with customized aesthetics and
scales, ready for rendering or further modification.

**Example Usage:**  
To create a plot for a data frame `df` with background colors specified
in `bg_colors` and bar colors in `bar_colors`, where we want to facet by
the ‘type’ column and set the y-axis upper limit to be 20% higher than
the max ‘value’ in `df`:

`R result_plot <- bar_plot_banana_plantain(   data_set = df,   x_lab = "Type of Crop",   y_lab = "Value in Percentage",   title = "Crop Value Comparison",   x = "type",   y = "value",   facet = "category",   alpha = 0.3,   background_color = "bg_colors",   bar_color = "bar_colors",   proportional_limit = 1.2 ) # Print the result print(result_plot)`

#### `assign_group_color` Function

**Description:**  
This function dynamically assigns color codes to data points based on
their categorical responses within specific groups (crops). It is
designed to work with variable-length categories and color mappings for
different groups. It’s especially useful for visualizing data where the
color representation depends on both the group (crop) and the category
of response.

**Parameters:**  
- `data`: The data frame containing the data to be processed. -
`levels_by_crop`: A named list where each element is a vector of
categorical levels for a specific crop. - `colors_by_crop`: A named list
where each element is a vector of colors corresponding to each
categorical level for each crop.

**Functionality:**  
- The function iterates through each row of the data frame. - For each
row, it matches the crop and its corresponding answer to its categorical
level. - It then assigns the color based on the matched level from the
provided color vectors. - The function handles varying lengths of
categories and color mappings, making it versatile for different
datasets.

**Returns:**  
The modified data frame with an additional column `group_color` that
contains the assigned color codes based on the crop and answer
categories.

**Example Usage:**  
To assign colors to a dataset `df` with crops ‘Banana’ and ‘Plantain’
and their respective levels and colors:

``` r
#libraries----
  library(treemap)
```

    ## Warning: package 'treemap' was built under R version 4.3.2

``` r
  library(tidyverse)
```

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.3     ✔ readr     2.1.4
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.0
    ## ✔ ggplot2   3.4.4     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.3     ✔ tidyr     1.3.0
    ## ✔ purrr     1.0.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
  library(RColorBrewer)
  library("colmaps")
```

    ## The legacy packages maptools, rgdal, and rgeos, underpinning the sp package,
    ## which was just loaded, were retired in October 2023.
    ## Please refer to R-spatial evolution reports for details, especially
    ## https://r-spatial.org/r/2023/05/15/evolution4.html.
    ## It may be desirable to make the sf package available;
    ## package maintainers should consider adding sf to Suggests:.

``` r
  library("homicidios")
  library(voronoiTreemap)
```

    ## Warning: package 'voronoiTreemap' was built under R version 4.3.2

``` r
  library(webshot)
```

    ## Warning: package 'webshot' was built under R version 4.3.2

``` r
  library(webshot2)
```

    ## Warning: package 'webshot2' was built under R version 4.3.2

    ## Registered S3 method overwritten by 'webshot2':
    ##   method        from   
    ##   print.webshot webshot
    ## 
    ## Attaching package: 'webshot2'
    ## 
    ## The following objects are masked from 'package:webshot':
    ## 
    ##     appshot, resize, rmdshot, shrink, webshot

``` r
  library(purrr)
  library(rlang)
```

    ## 
    ## Attaching package: 'rlang'
    ## 
    ## The following objects are masked from 'package:purrr':
    ## 
    ##     %@%, flatten, flatten_chr, flatten_dbl, flatten_int, flatten_lgl,
    ##     flatten_raw, invoke, splice

``` r
#Global variables
  #set the color palette for bananas and plantains
  palette_banana <- colorRampPalette(c("#FFDA00","#FFF2CC" ))
  palette_plantain <- colorRampPalette(c("#28B463","#BEF4BE"))
  palette_soil<- colorRampPalette(c( "#654321","#d8c298"))
  #data set: individual questions:
  #read individual surveys from GitHub
  num_cols <- length(read.csv("https://raw.githubusercontent.com/jrobledob/R2M_Colombia_banana_and_plantain/main/Data/DATA_Individual_surveys_Banana_and_Plantain_Colombia_Clean_surveys_2023-12-28.csv", nrows = 1, header = TRUE))
  # Create a colClasses vector with "character" for each column
  col_classes <- rep("character", num_cols)
  individual_surveys<- read.csv("https://raw.githubusercontent.com/jrobledob/R2M_Colombia_banana_and_plantain/main/Data/DATA_Individual_surveys_Banana_and_Plantain_Colombia_Clean_surveys_2023-12-28.csv", colClasses = col_classes)
  #reformat columns
  individual_surveys$question_number<- as.integer(individual_surveys$question_number)
  #Getting the experience of each expert by department by crop
  experience_of_each_expert<- individual_surveys %>%
    filter(question_number==1) %>%
    select(crop, expert_ID, expert_in, numeric_answer) %>%
    mutate(numeric_answer= as.numeric(numeric_answer))
  colnames(experience_of_each_expert)[which(colnames(experience_of_each_expert)=="numeric_answer")]<- "weights"
  #correct the missing answer which is "Antioquia"
  experience_of_each_expert$expert_in[which(is.na(experience_of_each_expert$expert_in))]<- "Antioquia"
    
#function tree_map_3 
  tree_map_3<- function(data,group, subgroup_1, subgroup_2, color_column, title){
    #Calculate the frequencies
    frequency_personalized_question<- data %>%
      group_by(!!rlang::sym(group), !!rlang::sym(subgroup_1), !!rlang::sym(subgroup_2), !!rlang::sym(color_column)) %>%
      summarise(frequency=n())
    #Plot the tree map 
    figure<- treemap(frequency_personalized_question,
            index=c(group,subgroup_1, subgroup_2), 
            vSize="frequency",
            vColor=color_column,
            type="color",
            fontsize.labels=c(0,7,4),                # size of labels. Give the size per level of aggregation: size for group, size for subgroup, sub-subgroups...
            fontcolor.labels=c("transparent","#654321", "#A58F65"),    # Color of labels
            fontface.labels=c(2,1,1),                  # Font of labels: 1,2,3,4 for normal, bold, italic, bold-italic...
            bg.labels=c("transparent"),              # Background color of labels
            align.labels=list(
              c("center", "top"), 
              c("right", "bottom"), 
              c("left", "top")
            ),                                   # Where to place labels in the rectangle?
            overlap.labels=0.5,                      # number between 0 and 1 that determines the tolerance of the overlap between labels. 0 means that labels of lower levels are not printed if higher level labels overlap, 1  means that labels are always printed. In-between values, for instance the default value .5, means that lower level labels are printed if other labels do not overlap with more than .5  times their area size.
            inflate.labels=T,                        # If true, labels are bigger when rectangle is bigger.
            border.col=c("white","#654321","#A58F65"),             # Color of borders of groups, of subgroups, of subsubgroups ....
            border.lwds=c(3,2, 0.5),                         # Width of colors
            title=title,                      # Customize your title
            #fontsize.title=12                       # Size of the title
    )
    return(figure)
  }

#function Col_map_by_depto
  Col_map_by_depto<- function(data, data_id, var, low, high, na.values, legend_lab){
    
    figure<- colmap(departamentos, data = data, data_id = data_id, var = var)+
      scale_fill_continuous(low = low , high = high, na.value = na.values)
    labs(fill= legend_lab)
    return(figure)
  }
  
#function category_by_mean_by_question
category_by_mean_by_question<- function(question, mean, language=c("en","es")){
  mean<-round(mean, 0)
  data<- read.csv("https://raw.githubusercontent.com/jrobledob/R2M_Colombia_banana_and_plantain/main/Data/SUP_DATA_Categories_that_can_be_chosen_in_every_question_of_the_individual_survey_English_and_Spanish.csv")
  if (language=="en") {
    category<- filter(data, number==question & number_to_category==mean)$trans_answer
  }else{
    if (language=="es") {
      category<- filter(data, number==question & number_to_category==mean)$Category
    }
    cat("ERROR: Language not found")
  }
  return(category)
}

#Function count_elements_by_group
count_elements_by_group <- function(data, value_column, group_columns) {
  # Split the comma-separated values and convert to long format
  data_long <- data %>%
    separate_rows(!!sym(value_column), sep = ",\\s*") %>%
    group_by(across(all_of(group_columns))) %>%
    count(!!sym(value_column))
  return(data_long)
}
  
#function bar_plot_banana_plantain
bar_plot_banana_plantain <- function(data_set, x_lab, y_lab, title, x, y, alpha, background_color, bar_color, proportional_limit, facet = NULL) {
  # Calculate new y-axis upper limit, 20% above the max value
  ymax_limit <- max(data_set[[y]], na.rm = TRUE) * proportional_limit
  
  # Convert strings to symbols
  x_sym <- rlang::sym(x)
  y_sym <- rlang::sym(y)
  background_color_sym <- rlang::sym(background_color)
  bar_color_sym <- rlang::sym(bar_color)
  
  # Start the plot
  p <- ggplot(data_set, aes(x = !!x_sym, y = !!y_sym)) +
    geom_rect(aes(fill = !!background_color_sym), xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf, alpha = alpha) +
    geom_text(aes(label = !!y_sym), vjust = -0.5, color = "#654321") +
    geom_bar(aes(fill = !!bar_color_sym), color = "#654321",stat = 'identity', position = position_dodge()) +
    scale_fill_identity() +
    labs(x = x_lab, y = y_lab, title = title) +
    theme(
      text = element_text(color = "#654321"),
      axis.title = element_text(color = "#654321"),
      axis.text = element_text(color = "#654321"),
      axis.line = element_line(color = "#654321"),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.border = element_rect(color = "#654321", fill = NA),
      strip.text = element_text(color = "#654321"),
      strip.background = element_rect(fill = "#A58F65", colour = NA),
      legend.position = "none"
    ) +
    ylim(0, ymax_limit)
  
  # Conditionally add facet grid if facet is provided
  if (!is.null(facet) && facet != "") {
    facet_sym <- rlang::sym(facet)
    facet_formula <- as.formula(paste(". ~", facet))
    p <- p + facet_grid(facet_formula)
  }
  
  # Return the plot
  return(p)
}

#function assign_group_color 
assign_group_color <- function(data, answer_col, levels_by_crop, colors_by_crop) {
  # Ensure that answer_col is a string representing the column name
  # levels_by_crop is a named list of vectors containing the knowledge levels for each crop
  # colors_by_crop is a named list of vectors containing the colors corresponding to each knowledge level for each crop
  
  answer_col_sym <- rlang::sym(answer_col)  # Convert the string to a symbol
  
  data <- data %>%
    mutate(group_color = purrr::map2_chr(crop, !!answer_col_sym, function(crop_name, answer) {
      # Find the index of the answer within the levels for the given crop
      level_index <- match(answer, levels_by_crop[[crop_name]])
      # Use the index to get the corresponding color
      if (!is.na(level_index)) {
        colors_by_crop[[crop_name]][level_index]
      } else {
        NA_character_  # If there's no match, return NA
      }
    }))
  
  return(data)
}
```

## Question 1: How many years of experience do you have in each department?

``` r
#selecting only question 1----
  question_1<- filter(individual_surveys, question_number==1)
  #organizing the order of the levels
  question_1$answer_in_english<- factor(question_1$answer_in_english,levels = c("1 to 2", "3 to 5","5 to 9","10 to 15","More than 15"))
  #finding the number of levels per crop (banana and plantain)
  levels_per_crop_Q1<- tapply(question_1$answer_in_english, question_1$crop, function(x){length(unique(x))})
  #generating a ramp palette according to the number of levels per crop
  colors_banana_question1<- palette_banana(levels_per_crop_Q1["Banana"])
  colors_plantain_question1<- palette_plantain(levels_per_crop_Q1["Plantain"])
  #Assigning the colors by crop and answer
  question_1<- question_1 %>%
    mutate(group_color= case_when(
      crop=="Banana" & answer_in_english == "1 to 2" ~ colors_banana_question1[5],
      crop=="Banana" & answer_in_english == "3 to 5" ~ colors_banana_question1[4],
      crop=="Banana" & answer_in_english == "5 to 9" ~ colors_banana_question1[3],
      crop=="Banana" & answer_in_english == "10 to 15" ~ colors_banana_question1[2],
      crop=="Banana" & answer_in_english == "More than 15" ~ colors_banana_question1[1],
      crop=="Plantain" & answer_in_english == "1 to 2" ~ colors_plantain_question1[5],
      crop=="Plantain" & answer_in_english == "3 to 5" ~ colors_plantain_question1[4],
      crop=="Plantain" & answer_in_english == "5 to 9" ~ colors_plantain_question1[3],
      crop=="Plantain" & answer_in_english == "10 to 15" ~ colors_plantain_question1[2],
      crop=="Plantain" & answer_in_english == "More than 15" ~ colors_plantain_question1[1],
    ))
#tree map
tree_map_3(data = question_1, "crop", "expert_in", "answer_in_english", "group_color", title="Experience of Experts by Department")
```

    ## `summarise()` has grouped output by 'crop', 'expert_in', 'answer_in_english'.
    ## You can override using the `.groups` argument.

![](README_files/figure-gfm/question_1-1.png)<!-- -->

    ## $tm
    ##        crop          expert_in answer_in_english vSize  vColor stdErr
    ## 1    Banana          Antioquia            1 to 2     1 #FFF2CC      1
    ## 2    Banana          Antioquia          10 to 15     2 #FFE033      2
    ## 3    Banana          Antioquia            3 to 5     3 #FFEB99      3
    ## 4    Banana          Antioquia      More than 15     5 #FFDA00      5
    ## 5    Banana          Antioquia              <NA>    11 #FFDA00     11
    ## 6    Banana            Bolívar            1 to 2     1 #FFF2CC      1
    ## 7    Banana            Bolívar              <NA>     1 #FFF2CC      1
    ## 8    Banana             Caldas            5 to 9     1 #FFE566      1
    ## 9    Banana             Caldas              <NA>     1 #FFE566      1
    ## 10   Banana              Cesar            1 to 2     1 #FFF2CC      1
    ## 11   Banana              Cesar            3 to 5     2 #FFEB99      2
    ## 12   Banana              Cesar              <NA>     3 #FFEB99      3
    ## 13   Banana              Chocó            1 to 2     1 #FFF2CC      1
    ## 14   Banana              Chocó            3 to 5     1 #FFEB99      1
    ## 15   Banana              Chocó              <NA>     2 #FFEB99      2
    ## 16   Banana            Córdoba            1 to 2     3 #FFF2CC      3
    ## 17   Banana            Córdoba              <NA>     3 #FFF2CC      3
    ## 18   Banana              Huila            5 to 9     1 #FFE566      1
    ## 19   Banana              Huila              <NA>     1 #FFE566      1
    ## 20   Banana         La Guajira            1 to 2     1 #FFF2CC      1
    ## 21   Banana         La Guajira          10 to 15     1 #FFE033      1
    ## 22   Banana         La Guajira            3 to 5     4 #FFEB99      4
    ## 23   Banana         La Guajira            5 to 9     3 #FFE566      3
    ## 24   Banana         La Guajira      More than 15     1 #FFDA00      1
    ## 25   Banana         La Guajira              <NA>    10 #FFDA00     10
    ## 26   Banana          Magdalena            1 to 2     4 #FFF2CC      4
    ## 27   Banana          Magdalena          10 to 15     2 #FFE033      2
    ## 28   Banana          Magdalena            3 to 5     4 #FFEB99      4
    ## 29   Banana          Magdalena            5 to 9     2 #FFE566      2
    ## 30   Banana          Magdalena      More than 15     1 #FFDA00      1
    ## 31   Banana          Magdalena              <NA>    13 #FFDA00     13
    ## 32   Banana               <NA>            1 to 2     1 #FFF2CC      1
    ## 33   Banana               <NA>              <NA>    48 #FFF2CC     48
    ## 34   Banana               <NA>              <NA>     1 #FFF2CC      1
    ## 35   Banana            Quindío            5 to 9     1 #FFE566      1
    ## 36   Banana            Quindío              <NA>     1 #FFE566      1
    ## 37   Banana          Risaralda            5 to 9     1 #FFE566      1
    ## 38   Banana          Risaralda              <NA>     1 #FFE566      1
    ## 39 Plantain          Antioquia            1 to 2     1 #BEF4BE      1
    ## 40 Plantain          Antioquia            5 to 9     1 #73D490      1
    ## 41 Plantain          Antioquia      More than 15     1 #28B463      1
    ## 42 Plantain          Antioquia              <NA>     3 #28B463      3
    ## 43 Plantain             Arauca            1 to 2     1 #BEF4BE      1
    ## 44 Plantain             Arauca            5 to 9     1 #73D490      1
    ## 45 Plantain             Arauca      More than 15     1 #28B463      1
    ## 46 Plantain             Arauca              <NA>     3 #28B463      3
    ## 47 Plantain          Atlántico            5 to 9     1 #73D490      1
    ## 48 Plantain          Atlántico              <NA>     1 #73D490      1
    ## 49 Plantain            Bolívar            5 to 9     1 #73D490      1
    ## 50 Plantain            Bolívar              <NA>     1 #73D490      1
    ## 51 Plantain             Caldas            1 to 2     1 #BEF4BE      1
    ## 52 Plantain             Caldas          10 to 15     1 #4DC479      1
    ## 53 Plantain             Caldas            5 to 9     2 #73D490      2
    ## 54 Plantain             Caldas      More than 15     3 #28B463      3
    ## 55 Plantain             Caldas              <NA>     7 #28B463      7
    ## 56 Plantain           Casanare            1 to 2     1 #BEF4BE      1
    ## 57 Plantain           Casanare            5 to 9     1 #73D490      1
    ## 58 Plantain           Casanare      More than 15     1 #28B463      1
    ## 59 Plantain           Casanare              <NA>     3 #28B463      3
    ## 60 Plantain              Chocó            1 to 2     1 #BEF4BE      1
    ## 61 Plantain              Chocó              <NA>     1 #BEF4BE      1
    ## 62 Plantain            Córdoba            5 to 9     1 #73D490      1
    ## 63 Plantain            Córdoba              <NA>     1 #73D490      1
    ## 64 Plantain              Huila            5 to 9     1 #73D490      1
    ## 65 Plantain              Huila              <NA>     1 #73D490      1
    ## 66 Plantain         La Guajira            1 to 2     1 #BEF4BE      1
    ## 67 Plantain         La Guajira            3 to 5     2 #98E4A7      2
    ## 68 Plantain         La Guajira            5 to 9     1 #73D490      1
    ## 69 Plantain         La Guajira              <NA>     4 #73D490      4
    ## 70 Plantain          Magdalena            3 to 5     2 #98E4A7      2
    ## 71 Plantain          Magdalena            5 to 9     1 #73D490      1
    ## 72 Plantain          Magdalena              <NA>     3 #73D490      3
    ## 73 Plantain               Meta            3 to 5     2 #98E4A7      2
    ## 74 Plantain               Meta            5 to 9     3 #73D490      3
    ## 75 Plantain               Meta      More than 15     5 #28B463      5
    ## 76 Plantain               Meta              <NA>    10 #28B463     10
    ## 77 Plantain               <NA>              <NA>    58 #73D490     58
    ## 78 Plantain Norte De Santander            5 to 9     1 #73D490      1
    ## 79 Plantain Norte De Santander              <NA>     1 #73D490      1
    ## 80 Plantain            Quindío            1 to 2     1 #BEF4BE      1
    ## 81 Plantain            Quindío          10 to 15     1 #4DC479      1
    ## 82 Plantain            Quindío            5 to 9     2 #73D490      2
    ## 83 Plantain            Quindío      More than 15     2 #28B463      2
    ## 84 Plantain            Quindío              <NA>     6 #28B463      6
    ## 85 Plantain          Risaralda            1 to 2     4 #BEF4BE      4
    ## 86 Plantain          Risaralda            3 to 5     2 #98E4A7      2
    ## 87 Plantain          Risaralda            5 to 9     1 #73D490      1
    ## 88 Plantain          Risaralda      More than 15     3 #28B463      3
    ## 89 Plantain          Risaralda              <NA>    10 #28B463     10
    ## 90 Plantain          Santander            5 to 9     1 #73D490      1
    ## 91 Plantain          Santander              <NA>     1 #73D490      1
    ## 92 Plantain              Sucre            5 to 9     1 #73D490      1
    ## 93 Plantain              Sucre              <NA>     1 #73D490      1
    ## 94 Plantain             Tolima            5 to 9     1 #73D490      1
    ## 95 Plantain             Tolima              <NA>     1 #73D490      1
    ##    vColorValue level         x0        y0          w          h   color
    ## 1           NA     3 0.96540881 0.5000000 0.03459119 0.27272727 #FFF2CC
    ## 2           NA     3 0.79245283 0.5000000 0.17295597 0.10909091 #FFE033
    ## 3           NA     3 0.79245283 0.6090909 0.17295597 0.16363636 #FFEB99
    ## 4           NA     3 0.79245283 0.7727273 0.20754717 0.22727273 #FFDA00
    ## 5           NA     2 0.79245283 0.5000000 0.20754717 0.50000000 #FFDA00
    ## 6           NA     3 0.79245283 0.1363636 0.06918239 0.13636364 #FFF2CC
    ## 7           NA     2 0.79245283 0.1363636 0.06918239 0.13636364 #FFF2CC
    ## 8           NA     3 0.79245283 0.0000000 0.06918239 0.13636364 #FFE566
    ## 9           NA     2 0.79245283 0.0000000 0.06918239 0.13636364 #FFE566
    ## 10          NA     3 0.71069182 0.0000000 0.08176101 0.11538462 #FFF2CC
    ## 11          NA     3 0.54716981 0.0000000 0.16352201 0.11538462 #FFEB99
    ## 12          NA     2 0.54716981 0.0000000 0.24528302 0.11538462 #FFEB99
    ## 13          NA     3 0.91698113 0.3863636 0.08301887 0.11363636 #FFF2CC
    ## 14          NA     3 0.91698113 0.2727273 0.08301887 0.11363636 #FFEB99
    ## 15          NA     2 0.91698113 0.2727273 0.08301887 0.22727273 #FFEB99
    ## 16          NA     3 0.79245283 0.2727273 0.12452830 0.22727273 #FFF2CC
    ## 17          NA     2 0.79245283 0.2727273 0.12452830 0.22727273 #FFF2CC
    ## 18          NA     3 0.86163522 0.1363636 0.06918239 0.13636364 #FFE566
    ## 19          NA     2 0.86163522 0.1363636 0.06918239 0.13636364 #FFE566
    ## 20          NA     3 0.54716981 0.1153846 0.08176101 0.11538462 #FFF2CC
    ## 21          NA     3 0.62893082 0.1153846 0.08176101 0.11538462 #FFE033
    ## 22          NA     3 0.54716981 0.2307692 0.14016173 0.26923077 #FFEB99
    ## 23          NA     3 0.68733154 0.2307692 0.10512129 0.26923077 #FFE566
    ## 24          NA     3 0.71069182 0.1153846 0.08176101 0.11538462 #FFDA00
    ## 25          NA     2 0.54716981 0.1153846 0.24528302 0.38461538 #FFDA00
    ## 26          NA     3 0.54716981 0.6923077 0.12264151 0.30769231 #FFF2CC
    ## 27          NA     3 0.54716981 0.5000000 0.09811321 0.19230769 #FFE033
    ## 28          NA     3 0.66981132 0.6923077 0.12264151 0.30769231 #FFEB99
    ## 29          NA     3 0.64528302 0.5000000 0.09811321 0.19230769 #FFE566
    ## 30          NA     3 0.74339623 0.5000000 0.04905660 0.19230769 #FFDA00
    ## 31          NA     2 0.54716981 0.5000000 0.24528302 0.50000000 #FFDA00
    ## 32          NA     3 0.93081761 0.1363636 0.06918239 0.13636364 #FFF2CC
    ## 33          NA     1 0.54716981 0.0000000 0.45283019 1.00000000 #FFF2CC
    ## 34          NA     2 0.93081761 0.1363636 0.06918239 0.13636364 #FFF2CC
    ## 35          NA     3 0.86163522 0.0000000 0.06918239 0.13636364 #FFE566
    ## 36          NA     2 0.86163522 0.0000000 0.06918239 0.13636364 #FFE566
    ## 37          NA     3 0.93081761 0.0000000 0.06918239 0.13636364 #FFE566
    ## 38          NA     2 0.93081761 0.0000000 0.06918239 0.13636364 #FFE566
    ## 39          NA     3 0.33118173 0.5678161 0.10799404 0.08735632 #BEF4BE
    ## 40          NA     3 0.33118173 0.4804598 0.10799404 0.08735632 #73D490
    ## 41          NA     3 0.33118173 0.3931034 0.10799404 0.08735632 #28B463
    ## 42          NA     2 0.33118173 0.3931034 0.10799404 0.26206897 #28B463
    ## 43          NA     3 0.43917577 0.5678161 0.10799404 0.08735632 #BEF4BE
    ## 44          NA     3 0.43917577 0.4804598 0.10799404 0.08735632 #73D490
    ## 45          NA     3 0.43917577 0.3931034 0.10799404 0.08735632 #28B463
    ## 46          NA     2 0.43917577 0.3931034 0.10799404 0.26206897 #28B463
    ## 47          NA     3 0.33118173 0.2620690 0.07199603 0.13103448 #73D490
    ## 48          NA     2 0.33118173 0.2620690 0.07199603 0.13103448 #73D490
    ## 49          NA     3 0.40317776 0.2620690 0.07199603 0.13103448 #73D490
    ## 50          NA     2 0.40317776 0.2620690 0.07199603 0.13103448 #73D490
    ## 51          NA     3 0.00000000 0.3023873 0.09359484 0.10079576 #BEF4BE
    ## 52          NA     3 0.09359484 0.3023873 0.09359484 0.10079576 #4DC479
    ## 53          NA     3 0.11231380 0.4031830 0.07487587 0.25198939 #73D490
    ## 54          NA     3 0.00000000 0.4031830 0.11231380 0.25198939 #28B463
    ## 55          NA     2 0.00000000 0.3023873 0.18718967 0.35278515 #28B463
    ## 56          NA     3 0.18718967 0.2948276 0.09599470 0.09827586 #BEF4BE
    ## 57          NA     3 0.18718967 0.1965517 0.09599470 0.09827586 #73D490
    ## 58          NA     3 0.28318438 0.1965517 0.04799735 0.19655172 #28B463
    ## 59          NA     2 0.18718967 0.1965517 0.14399206 0.19655172 #28B463
    ## 60          NA     3 0.47517378 0.2620690 0.07199603 0.13103448 #BEF4BE
    ## 61          NA     2 0.47517378 0.2620690 0.07199603 0.13103448 #BEF4BE
    ## 62          NA     3 0.33118173 0.1310345 0.07199603 0.13103448 #73D490
    ## 63          NA     2 0.33118173 0.1310345 0.07199603 0.13103448 #73D490
    ## 64          NA     3 0.33118173 0.0000000 0.07199603 0.13103448 #73D490
    ## 65          NA     2 0.33118173 0.0000000 0.07199603 0.13103448 #73D490
    ## 66          NA     3 0.28318438 0.4586207 0.04799735 0.19655172 #BEF4BE
    ## 67          NA     3 0.18718967 0.4586207 0.09599470 0.19655172 #98E4A7
    ## 68          NA     3 0.18718967 0.3931034 0.14399206 0.06551724 #73D490
    ## 69          NA     2 0.18718967 0.3931034 0.14399206 0.26206897 #73D490
    ## 70          NA     3 0.18718967 0.0000000 0.09599470 0.19655172 #98E4A7
    ## 71          NA     3 0.28318438 0.0000000 0.04799735 0.19655172 #73D490
    ## 72          NA     2 0.18718967 0.0000000 0.14399206 0.19655172 #73D490
    ## 73          NA     3 0.21886792 0.6551724 0.05471698 0.34482759 #98E4A7
    ## 74          NA     3 0.00000000 0.6551724 0.21886792 0.12931034 #73D490
    ## 75          NA     3 0.00000000 0.7844828 0.21886792 0.21551724 #28B463
    ## 76          NA     2 0.00000000 0.6551724 0.27358491 0.34482759 #28B463
    ## 77          NA     1 0.00000000 0.0000000 0.54716981 1.00000000 #73D490
    ## 78          NA     3 0.40317776 0.1310345 0.07199603 0.13103448 #73D490
    ## 79          NA     2 0.40317776 0.1310345 0.07199603 0.13103448 #73D490
    ## 80          NA     3 0.00000000 0.0000000 0.09359484 0.10079576 #BEF4BE
    ## 81          NA     3 0.09359484 0.0000000 0.09359484 0.10079576 #4DC479
    ## 82          NA     3 0.00000000 0.1007958 0.09359484 0.20159151 #73D490
    ## 83          NA     3 0.09359484 0.1007958 0.09359484 0.20159151 #28B463
    ## 84          NA     2 0.00000000 0.0000000 0.18718967 0.30238727 #28B463
    ## 85          NA     3 0.27358491 0.8029557 0.19150943 0.19704433 #BEF4BE
    ## 86          NA     3 0.46509434 0.7701149 0.08207547 0.22988506 #98E4A7
    ## 87          NA     3 0.46509434 0.6551724 0.08207547 0.11494253 #73D490
    ## 88          NA     3 0.27358491 0.6551724 0.19150943 0.14778325 #28B463
    ## 89          NA     2 0.27358491 0.6551724 0.27358491 0.34482759 #28B463
    ## 90          NA     3 0.47517378 0.1310345 0.07199603 0.13103448 #73D490
    ## 91          NA     2 0.47517378 0.1310345 0.07199603 0.13103448 #73D490
    ## 92          NA     3 0.40317776 0.0000000 0.07199603 0.13103448 #73D490
    ## 93          NA     2 0.40317776 0.0000000 0.07199603 0.13103448 #73D490
    ## 94          NA     3 0.47517378 0.0000000 0.07199603 0.13103448 #73D490
    ## 95          NA     2 0.47517378 0.0000000 0.07199603 0.13103448 #73D490
    ## 
    ## $type
    ## [1] "color"
    ## 
    ## $vSize
    ## [1] "frequency"
    ## 
    ## $vColor
    ## [1] "group_color"
    ## 
    ## $stdErr
    ## [1] "frequency"
    ## 
    ## $algorithm
    ## [1] "pivotSize"
    ## 
    ## $vpCoorX
    ## [1] 0.02812148 0.97187852
    ## 
    ## $vpCoorY
    ## [1] 0.01968504 0.91031496
    ## 
    ## $aspRatio
    ## [1] 1.483512
    ## 
    ## $range
    ## [1] NA NA
    ## 
    ## $mapping
    ## [1] NA NA NA
    ## 
    ## $draw
    ## [1] TRUE

``` r
#summarise to have the number of experts by departments
data<- question_1 %>%
  group_by(expert_in, id_depto) %>%
  summarise(Number_of_Experts= n())
```

    ## `summarise()` has grouped output by 'expert_in'. You can override using the
    ## `.groups` argument.

``` r
codes_department<- unique(data.frame(EKE.expert.in=homicidios$depto, id_depto=homicidios$id_depto))
data<- full_join(codes_department, data)
```

    ## Joining with `by = join_by(id_depto)`

``` r
#Map of Colombia
Col_map_by_depto(data = data, data_id = "id_depto", var = "Number_of_Experts", low = "#A58F65", high = "#654321", na.values = "#eeeeee", legend_lab = "Number \n of experts")
```

    ## Warning: `fortify(<SpatialPolygonsDataFrame>)` was deprecated in ggplot2 3.4.4.
    ## ℹ Please migrate to sf.
    ## ℹ The deprecated feature was likely used in the colmaps package.
    ##   Please report the issue to the authors.
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
    ## generated.

    ## Scale for fill is already present.
    ## Adding another scale for fill, which will replace the existing scale.

![](README_files/figure-gfm/question_1-2.png)<!-- -->

``` r
#Total number of experts:
total_experts_Q1<- length(unique(question_1$expert_ID))
mode_Q1<- sort(table(question_1$answer_in_english), decreasing = T)
question_1$numeric_answer<- as.numeric(question_1$numeric_answer)
mean_q1<- mean(question_1$numeric_answer)
mean_q1<- category_by_mean_by_question(1, mean_q1, language = "en")
mean_q1_by_crops<- question_1 %>%
  group_by(crop) %>%
  summarise(mean_cat= mean(numeric_answer),
            surveys_by_crop= length(unique(expert_ID)),
            mode= names(sort(table(answer_in_english), decreasing = T))[1])
mean_q1_by_crops$cat_english<- tapply(mean_q1_by_crops$mean_cat, mean_q1_by_crops$crop, function(x){
  category_by_mean_by_question(1, mean = x, language = "en")}) 
```

#### Descriptive statistics:

Total number of experts that answer this question= 46

Mode in all the surveys= 5 to 9

Mean in all the surveys=5 to 9

Descriptive statistics by crop=

| crop     | mean_cat | surveys_by_crop | mode   | cat_english |
|:---------|---------:|----------------:|:-------|:------------|
| Banana   | 3.555556 |              23 | 3 to 5 | 5 to 9      |
| Plantain | 4.066092 |              25 | 5 to 9 | 5 to 9      |

## Question 2: Which category or categories best describe your experience? Please check all that apply.

``` r
question_2<- filter(individual_surveys,question_number==2)
question_2_frequencies <- count_elements_by_group(question_2, "answer_in_english", c("crop"))
question_2_frequencies$answer_in_english<- as.factor(question_2_frequencies$answer_in_english)
#finding the number of levels per crop (banana and plantain)
levels_per_crop_Q2<- tapply(question_2_frequencies$answer_in_english, question_2_frequencies$crop, function(x){length(unique(x))})
#generating a ramp palette according to the number of levels per crop
colors_banana_question2<- palette_banana(levels_per_crop_Q2["Banana"])
colors_plantain_question2<- palette_plantain(levels_per_crop_Q2["Plantain"])
#Assignig a color per factor by crop
question_2_frequencies <- question_2_frequencies %>%
  mutate(group_color = case_when(
    crop == "Banana" ~ colors_banana_question2[match(answer_in_english, c("Agricultural Extension", 
                                                                          "Agricultural Operations Management/Crop Consultants", 
                                                                          "Agronomy", "Economics", 
                                                                          "Entomology", "Horticulture", 
                                                                          "IPM (Integrated Pest Management)", 
                                                                          "Others", "Plant Pathology", 
                                                                          "Producer", "Research", 
                                                                          "Seed Systems", "Social Sciences"))],
    crop == "Plantain" ~ colors_plantain_question2[match(answer_in_english, c("Agricultural Extension", 
                                                                              "Agricultural Operations Management/Crop Consultants", 
                                                                              "Agronomy", "Economics", 
                                                                              "Entomology", "Horticulture", 
                                                                              "IPM (Integrated Pest Management)", 
                                                                              "Others", "Plant Pathology", 
                                                                              "Producer", "Research", 
                                                                              "Seed Systems", "Social Sciences"))]
  ))
#Creating avreviations for the the plot 
question_2_frequencies <- question_2_frequencies %>%
  mutate(cat_abbreviations = case_when(
    answer_in_english == "Agricultural Extension" ~ "AE",
    answer_in_english == "Agricultural Operations Management/Crop Consultants" ~ "AOM/CC",
    answer_in_english == "Agronomy" ~ "Agro",
    answer_in_english == "Economics" ~ "Econ",
    answer_in_english == "Entomology" ~ "Ento",
    answer_in_english == "Horticulture" ~ "Hort",
    answer_in_english == "IPM (Integrated Pest Management)" ~ "IPM",
    answer_in_english == "Others" ~ "Oth",
    answer_in_english == "Plant Pathology" ~ "PlPath",
    answer_in_english == "Producer" ~ "Prod",
    answer_in_english == "Research" ~ "Res",
    answer_in_english == "Seed Systems" ~ "SS",
    answer_in_english == "Social Sciences" ~ "SocSci",
    TRUE ~ NA_character_  # Default case if none of the above conditions are met
  ))
#formating the data set to make the visualization, voronoiTreemap was quite picky...  
colnames(question_2_frequencies)<- c('h2', "h3", "weight","color", "codes")
question_2_frequencies$h1<- "Total"
question_2_frequencies <- question_2_frequencies %>%
  select(h1, h2, h3, color, weight, codes)
question_2_frequencies$weight<- (question_2_frequencies$weight/sum(question_2_frequencies$weight))*100
question_2_frequencies$h1<- as.factor(question_2_frequencies$h1)
question_2_frequencies$h2<- as.factor(question_2_frequencies$h2)
question_2_frequencies<- data.frame(h1= question_2_frequencies$h1,
                                    h2= question_2_frequencies$h2,
                                    h3= question_2_frequencies$h3,
                                    color= question_2_frequencies$color,
                                    weight= question_2_frequencies$weight,
                                    codes= question_2_frequencies$codes)
gdp_json <- vt_export_json(vt_input_from_df(question_2_frequencies))
vt_d3(gdp_json, color_border = "#654321", size_border = "1.5px", label = T, color_label = "#654321", seed = 3)
```

    ## PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.

![](README_files/figure-gfm/question_2-1.png)<!-- -->

``` r
vt_d3(gdp_json, color_border = "#654321", size_border = "1.5px", label = F, color_label = "#654321", seed = 3)
```

![](README_files/figure-gfm/question_2-2.png)<!-- -->

``` r
kable(question_2_frequencies)
```

| h1    | h2       | h3                                                  | color    |    weight | codes  |
|:------|:---------|:----------------------------------------------------|:---------|----------:|:-------|
| Total | Banana   | Agricultural Extension                              | \#FFDA00 | 4.9450549 | AE     |
| Total | Banana   | Agricultural Operations Management/Crop Consultants | \#FFDB11 | 1.6483516 | AOM/CC |
| Total | Banana   | Agronomy                                            | \#FFDE22 | 6.0439560 | Agro   |
| Total | Banana   | Economics                                           | \#FFE033 | 1.0989011 | Econ   |
| Total | Banana   | Entomology                                          | \#FFE244 | 2.1978022 | Ento   |
| Total | Banana   | Horticulture                                        | \#FFE355 | 3.2967033 | Hort   |
| Total | Banana   | IPM (Integrated Pest Management)                    | \#FFE566 | 6.0439560 | IPM    |
| Total | Banana   | Others                                              | \#FFE876 | 1.0989011 | Oth    |
| Total | Banana   | Plant Pathology                                     | \#FFEA88 | 4.3956044 | PlPath |
| Total | Banana   | Producer                                            | \#FFEB99 | 2.7472527 | Prod   |
| Total | Banana   | Research                                            | \#FFEDAA | 3.2967033 | Res    |
| Total | Banana   | Seed Systems                                        | \#FFF0BB | 4.3956044 | SS     |
| Total | Banana   | Social Sciences                                     | \#FFF2CC | 0.5494505 | SocSci |
| Total | Plantain | Agricultural Extension                              | \#28B463 | 7.1428571 | AE     |
| Total | Plantain | Agricultural Operations Management/Crop Consultants | \#34B96A | 1.6483516 | AOM/CC |
| Total | Plantain | Agronomy                                            | \#41BE72 | 8.7912088 | Agro   |
| Total | Plantain | Economics                                           | \#4DC479 | 1.0989011 | Econ   |
| Total | Plantain | Entomology                                          | \#59C981 | 5.4945055 | Ento   |
| Total | Plantain | Horticulture                                        | \#66CE88 | 2.1978022 | Hort   |
| Total | Plantain | IPM (Integrated Pest Management)                    | \#73D490 | 6.5934066 | IPM    |
| Total | Plantain | Others                                              | \#7FD998 | 0.5494505 | Oth    |
| Total | Plantain | Plant Pathology                                     | \#8CDE9F | 7.1428571 | PlPath |
| Total | Plantain | Producer                                            | \#98E4A7 | 4.3956044 | Prod   |
| Total | Plantain | Research                                            | \#A4E9AE | 5.4945055 | Res    |
| Total | Plantain | Seed Systems                                        | \#B1EEB6 | 7.1428571 | SS     |
| Total | Plantain | Social Sciences                                     | \#BEF4BE | 0.5494505 | SocSci |

## Question 3: Do you work in a public or private institution/company?

``` r
#selecting only question 3----
  question_3<- filter(individual_surveys, question_number==3)
#Counts by crop
  question_3_frequencies <- count_elements_by_group(question_3, "answer_in_english", c("crop"))
  #calculate the percentages by crop and question 
  question_3_frequencies <- question_3_frequencies %>%
  group_by(crop) %>%
  mutate(total = sum(n),          # Calculate total for each crop group
         percentage = (n / total) * 100) %>%
  ungroup()
  #Plot
  #Add colors to each 
  question_3_frequencies<- question_3_frequencies %>%
  mutate(background_color= case_when(crop=="Banana" ~ "#FFF2CC",
                     crop=="Plantain" ~ "#BEF4BE"))
  #bars colors
question_3_frequencies<- question_3_frequencies %>%
  mutate(bar_color= case_when(crop=="Banana" & answer_in_english=="Public" ~ "#FFDA00",
                              crop=="Banana" & answer_in_english=="Private" ~ "#FFEDA3",
                              crop=="Plantain" & answer_in_english=="Public" ~ "#28B463",
                              crop=="Plantain" & answer_in_english=="Private" ~ "#82DA99"))
question_3_frequencies$percentage<- round(question_3_frequencies$percentage,0)
#custom function
question_3_plot<- bar_plot_banana_plantain(
  data_set = question_3_frequencies,
  x_lab = "Sector Affiliation of Experts",
  y_lab = "Percent (%)",
  title = "Expert Affiliation by Crop",
  x = "answer_in_english",
  y = "percentage",
  facet = "crop",
  alpha = 0.3,
  background_color = "background_color",
  bar_color = "bar_color",
  proportional_limit= 1.05
)
question_3_plot
```

![](README_files/figure-gfm/queestion_3-1.png)<!-- -->

``` r
#Counts national
  question_3_frequencies_nal <- count_elements_by_group(question_3, "answer_in_english", c("answer_in_english"))
  #calculate the percentages by crop and question 
  question_3_frequencies_nal <- question_3_frequencies_nal %>%
     ungroup() %>%
    mutate(total = sum(n),          # Calculate total for each crop group
         percentage = (n / total) * 100) 
  #Plot
  #Add colors to each 
  question_3_frequencies_nal<- question_3_frequencies_nal %>%
  mutate(background_color= case_when(answer_in_english=="Public" ~ "transparent",
                     answer_in_english=="Private" ~ "transparent"))
  #Add color to the bars
 question_3_frequencies_nal<-  question_3_frequencies_nal %>%
  mutate(bar_color= case_when(answer_in_english=="Public"~ "#654321",
                              answer_in_english=="Private"~ "#d8c298"))
question_3_frequencies_nal$percentage<- round(question_3_frequencies_nal$percentage,0)
  #custom plot 
question_3_plot_nal<- bar_plot_banana_plantain(
  data_set = question_3_frequencies_nal,
  x_lab = "Sector Affiliation of Experts",
  y_lab = "Percent (%)",
  title = "Expert Affiliation",
  x = "answer_in_english",
  y = "percentage",
  alpha = 1,
  background_color = "background_color",
  bar_color = "bar_color",
  proportional_limit= 1.05
)
question_3_plot_nal
```

![](README_files/figure-gfm/queestion_3-2.png)<!-- -->

## Question 4: What is your level of education?

``` r
#selecting only question 4----
  question_4<- filter(individual_surveys, question_number==4)
#Counts by crop
  question_4_frequencies <- count_elements_by_group(question_4, "answer_in_english", c("crop"))
  #calculate the percentages by crop and question 
  question_4_frequencies <- question_4_frequencies %>%
  group_by(crop) %>%
  mutate(total = sum(n),          # Calculate total for each crop group
         percentage = (n / total) * 100) %>%
  ungroup()
  question_4_frequencies$answer_in_english <- factor(
  question_4_frequencies$answer_in_english, 
  levels = c("No Formal Education", "Secondary Education", "Bachelor's Degree", "Master's Degree", "Doctorate"),
  labels = c("No Ed.", "Sec.", "Bac.", "Ms.C", "Ph.D")
)
  #Plot
  #Add colors to each backgorund 
  question_4_frequencies<- question_4_frequencies %>%
  mutate(background_color= case_when(crop=="Banana" ~ "#FFF2CC",
                     crop=="Plantain" ~ "#BEF4BE"))
  #Colors of the bars
  # Identify the levels by crop
  levels_Q_4_banana<- question_4_frequencies$answer_in_english[which( question_4_frequencies$crop=="Banana")]
  levels_Q_4_plantain<- question_4_frequencies$answer_in_english[which( question_4_frequencies$crop=="Plantain")]
  #set the color. The +1 is to make a different color that background wich will be the last element in the vector
  q_4_colors_banana<- palette_banana(length(levels_Q_4_banana)+1)
  q_4_colors_plantain<- palette_plantain(length(levels_Q_4_plantain)+1)
  names(q_4_colors_banana)<- levels_Q_4_banana
  names(q_4_colors_plantain)<- levels_Q_4_plantain
    # Modify the data_set to include the bar_color
question_4_frequencies <- question_4_frequencies %>%
  mutate(bar_color = case_when(
    crop == "Banana" ~ q_4_colors_banana[answer_in_english],
    crop == "Plantain" ~ q_4_colors_plantain[answer_in_english]
  ))
question_4_frequencies$percentage<- round(question_4_frequencies$percentage, 0)
dput(unique(question_4_frequencies$answer_in_english))
```

    ## structure(c(3L, 5L, 4L, 1L, 2L), levels = c("No Ed.", "Sec.", 
    ## "Bac.", "Ms.C", "Ph.D"), class = "factor")

``` r
#custom function
question_4_plot<- bar_plot_banana_plantain(
  data_set = question_4_frequencies,
  x_lab = "Education Level of the Experts",
  y_lab = "Percent (%)",
  title = "Eucation Level of the Experts by Crop",
  x = "answer_in_english",
  y = "percentage",
  facet = "crop",
  alpha = 0.3,
  background_color = "background_color",
  bar_color = "bar_color",
  proportional_limit= 1.05
)
question_4_plot
```

![](README_files/figure-gfm/question_4-1.png)<!-- -->

``` r
#Counts national
  question_4_frequencies_nal <- count_elements_by_group(question_4, "answer_in_english", c("answer_in_english"))
  #calculate the percentages by crop and question 
  question_4_frequencies_nal <- question_4_frequencies_nal %>%
     ungroup() %>%
    mutate(total = sum(n),          # Calculate total for each crop group
         percentage = (n / total) * 100) 
  #Plot
  #Add colors to each background
   question_4_frequencies_nal$answer_in_english <- factor(
  question_4_frequencies_nal$answer_in_english, 
  levels = c("No Formal Education", "Secondary Education", "Bachelor's Degree", "Master's Degree", "Doctorate"),
  labels = c("No Ed.", "Sec.", "Bac.", "Ms.C", "Ph.D")
)
  question_4_frequencies_nal$background_color<-"transparent"
   q_4_colors_soil_nal<- palette_soil(length(levels(question_4_frequencies_nal$answer_in_english)))
    names(q_4_colors_soil_nal)<- levels(question_4_frequencies_nal)
 # Modify the data_set to include the bar_color
question_4_frequencies_nal <- question_4_frequencies_nal %>%
  mutate(bar_color = q_4_colors_soil_nal[answer_in_english])
question_4_frequencies_nal$percentage<- round(question_4_frequencies_nal$percentage, 0)
  #custom plot 
question_4_plot_nal<- bar_plot_banana_plantain(
  data_set = question_4_frequencies_nal,
  x_lab = "Education Level of the Experts",
  y_lab = "Percent (%)",
  title = "Education Level of the Experts",
  x = "answer_in_english",
  y = "percentage",
  alpha = 1,
  background_color = "background_color",
  bar_color = "bar_color",
  proportional_limit= 1.05
)
question_4_plot_nal
```

![](README_files/figure-gfm/question_4-2.png)<!-- -->

## Question 5: What are the most prevalent pests and diseases of bananas in the regions where you have experience? Please check all that apply.

``` r
question_5<- filter(individual_surveys,question_number==5)
question_5_frequencies <- count_elements_by_group(question_5, "answer_in_english", c("crop"))
question_5_frequencies$answer_in_english<- as.factor(question_5_frequencies$answer_in_english)
#finding the number of levels per crop (banana and plantain)
levels_per_crop_Q5<- tapply(question_5_frequencies$answer_in_english, question_5_frequencies$crop, function(x){length(unique(x))})
#generating a ramp palette according to the number of levels per crop
colors_banana_question5<- palette_banana(levels_per_crop_Q5["Banana"])
colors_plantain_question5<- palette_plantain(levels_per_crop_Q5["Plantain"])
#Assignig a color per factor by crop
question_5_frequencies <- question_5_frequencies %>%
  mutate(group_color = case_when(
    crop == "Banana" ~ colors_banana_question5[match(answer_in_english, c("Banana Mosaic Disease", "Black Sigatoka", 
"Black Weevil", "Elephantiasis", "Fusarium", "Moko or Madurabiche", 
"Nematodes", "Red Spider Mite", "Scale Insect", "Scarab Beetle", 
"Whiteflies", "Yellow Sigatoka"))],
    crop == "Plantain" ~ colors_plantain_question5[match(answer_in_english, c("Banana Mosaic Disease", "Black Sigatoka", 
"Black Weevil", "Elephantiasis", "Fusarium", "Moko or Madurabiche", 
"Nematodes", "Red Spider Mite", "Scale Insect", "Scarab Beetle", 
"Whiteflies", "Yellow Sigatoka"))]
  ))
#Make the abbreviations
question_5_frequencies <- question_5_frequencies %>%
  mutate(cat_abbreviations = case_when(
    answer_in_english == "Banana Mosaic Disease" ~ "BMD",
    answer_in_english == "Black Sigatoka" ~ "BS",
    answer_in_english == "Black Weevil" ~ "BW",
    answer_in_english == "Elephantiasis" ~ "ELE",
    answer_in_english == "Fusarium" ~ "FUS",
    answer_in_english == "Moko or Madurabiche" ~ "MOKO",
    answer_in_english == "Nematodes" ~ "NEM",
    answer_in_english == "Red Spider Mite" ~ "RSM",
    answer_in_english == "Scale Insect" ~ "SI",
    answer_in_english == "Scarab Beetle" ~ "SB",
    answer_in_english == "Whiteflies" ~ "WF",
    answer_in_english == "Yellow Sigatoka" ~ "YS",
    TRUE ~ NA_character_  # Default case if none of the above conditions are met
  ))

#formating the data set to make the visualization, voronoiTreemap was quite picky...  
colnames(question_5_frequencies)<- c('h2', "h3", "weight","color", "codes")
question_5_frequencies$h1<- "Total"
question_5_frequencies <- question_5_frequencies %>%
  select(h1, h2, h3, color, weight, codes)
question_5_frequencies$weight<- (question_5_frequencies$weight/sum(question_5_frequencies$weight))*100
question_5_frequencies$h1<- as.factor(question_5_frequencies$h1)
question_5_frequencies$h2<- as.factor(question_5_frequencies$h2)
question_5_frequencies<- data.frame(h1= question_5_frequencies$h1,
                                    h2= question_5_frequencies$h2,
                                    h3= question_5_frequencies$h3,
                                    color= question_5_frequencies$color,
                                    weight= question_5_frequencies$weight,
                                    codes= question_5_frequencies$codes)
gdp_json <- vt_export_json(vt_input_from_df(question_5_frequencies))
vt_d3(gdp_json, color_border = "#654321", size_border = "1.5px", label = T, color_label = "#654321", seed = 3)
```

![](README_files/figure-gfm/question_5-1.png)<!-- -->

``` r
vt_d3(gdp_json, color_border = "#654321", size_border = "1.5px", label = F, color_label = "#654321", seed = 3)
```

![](README_files/figure-gfm/question_5-2.png)<!-- -->

``` r
kable(question_5_frequencies)
```

| h1    | h2       | h3                    | color    |     weight | codes |
|:------|:---------|:----------------------|:---------|-----------:|:------|
| Total | Banana   | Banana Mosaic Disease | \#FFDA00 |  0.4376368 | BMD   |
| Total | Banana   | Black Sigatoka        | \#FFDC12 |  8.5339168 | BS    |
| Total | Banana   | Black Weevil          | \#FFDE25 |  6.3457330 | BW    |
| Total | Banana   | Elephantiasis         | \#FFE037 |  1.7505470 | ELE   |
| Total | Banana   | Fusarium              | \#FFE24A |  4.3763676 | FUS   |
| Total | Banana   | Moko or Madurabiche   | \#FFE45C |  7.8774617 | MOKO  |
| Total | Banana   | Nematodes             | \#FFE76F |  2.1881838 | NEM   |
| Total | Banana   | Red Spider Mite       | \#FFE981 |  2.4070022 | RSM   |
| Total | Banana   | Scale Insect          | \#FFEB94 |  3.9387309 | SI    |
| Total | Banana   | Scarab Beetle         | \#FFEDA6 |  1.3129103 | SB    |
| Total | Banana   | Whiteflies            | \#FFEFB9 |  0.4376368 | WF    |
| Total | Banana   | Yellow Sigatoka       | \#FFF2CC |  0.8752735 | YS    |
| Total | Plantain | Banana Mosaic Disease | \#28B463 |  2.1881838 | BMD   |
| Total | Plantain | Black Sigatoka        | \#35B96B |  9.4091904 | BS    |
| Total | Plantain | Black Weevil          | \#43BF73 |  7.8774617 | BW    |
| Total | Plantain | Elephantiasis         | \#50C57B |  5.2516411 | ELE   |
| Total | Plantain | Fusarium              | \#5ECB84 |  3.9387309 | FUS   |
| Total | Plantain | Moko or Madurabiche   | \#6CD18C | 10.2844639 | MOKO  |
| Total | Plantain | Nematodes             | \#79D694 |  7.6586433 | NEM   |
| Total | Plantain | Red Spider Mite       | \#87DC9C |  1.0940919 | RSM   |
| Total | Plantain | Scale Insect          | \#95E2A5 |  4.5951860 | SI    |
| Total | Plantain | Scarab Beetle         | \#A2E8AD |  0.2188184 | SB    |
| Total | Plantain | Whiteflies            | \#B0EEB5 |  1.7505470 | WF    |
| Total | Plantain | Yellow Sigatoka       | \#BEF4BE |  5.2516411 | YS    |

``` r
#select top 5
question_5_frequencies <- question_5_frequencies %>%
  group_by(h2) %>%
  slice_max(order_by = weight, n = 5) 
kable(question_5_frequencies, label = "TOP 5 pest and Diseases by Crop (banana and plantain")
```

| h1    | h2       | h3                  | color    |    weight | codes |
|:------|:---------|:--------------------|:---------|----------:|:------|
| Total | Banana   | Black Sigatoka      | \#FFDC12 |  8.533917 | BS    |
| Total | Banana   | Moko or Madurabiche | \#FFE45C |  7.877462 | MOKO  |
| Total | Banana   | Black Weevil        | \#FFDE25 |  6.345733 | BW    |
| Total | Banana   | Fusarium            | \#FFE24A |  4.376368 | FUS   |
| Total | Banana   | Scale Insect        | \#FFEB94 |  3.938731 | SI    |
| Total | Plantain | Moko or Madurabiche | \#6CD18C | 10.284464 | MOKO  |
| Total | Plantain | Black Sigatoka      | \#35B96B |  9.409190 | BS    |
| Total | Plantain | Black Weevil        | \#43BF73 |  7.877462 | BW    |
| Total | Plantain | Nematodes           | \#79D694 |  7.658643 | NEM   |
| Total | Plantain | Elephantiasis       | \#50C57B |  5.251641 | ELE   |
| Total | Plantain | Yellow Sigatoka     | \#BEF4BE |  5.251641 | YS    |

``` r
#Frequencies by department
question_5_frequencies_by_depto <- count_elements_by_group(question_5, "answer_in_english", c("crop", "expert_in"))
#colors by disease
question_5_frequencies_by_depto <- question_5_frequencies_by_depto %>%
  mutate(group_color = case_when(
    crop == "Banana" ~ colors_banana_question5[match(answer_in_english, c("Banana Mosaic Disease", "Black Sigatoka", 
"Black Weevil", "Elephantiasis", "Fusarium", "Moko or Madurabiche", 
"Nematodes", "Red Spider Mite", "Scale Insect", "Scarab Beetle", 
"Whiteflies", "Yellow Sigatoka"))],
    crop == "Plantain" ~ colors_plantain_question5[match(answer_in_english, c("Banana Mosaic Disease", "Black Sigatoka", 
"Black Weevil", "Elephantiasis", "Fusarium", "Moko or Madurabiche", 
"Nematodes", "Red Spider Mite", "Scale Insect", "Scarab Beetle", 
"Whiteflies", "Yellow Sigatoka"))]
  ))
#Make the abbreviations
question_5_frequencies_by_depto <- question_5_frequencies_by_depto %>%
  mutate(cat_abbreviations = case_when(
    answer_in_english == "Banana Mosaic Disease" ~ "BMD",
    answer_in_english == "Black Sigatoka" ~ "BS",
    answer_in_english == "Black Weevil" ~ "BW",
    answer_in_english == "Elephantiasis" ~ "ELE",
    answer_in_english == "Fusarium" ~ "FUS",
    answer_in_english == "Moko or Madurabiche" ~ "MOKO",
    answer_in_english == "Nematodes" ~ "NEM",
    answer_in_english == "Red Spider Mite" ~ "RSM",
    answer_in_english == "Scale Insect" ~ "SI",
    answer_in_english == "Scarab Beetle" ~ "SB",
    answer_in_english == "Whiteflies" ~ "WF",
    answer_in_english == "Yellow Sigatoka" ~ "YS",
    TRUE ~ NA_character_  # Default case if none of the above conditions are met
  ))
#tree map
question_5_frequencies_by_depto<- select(question_5_frequencies_by_depto,!answer_in_english)
question_5_frequencies_by_depto<- question_5_frequencies_by_depto %>%
  group_by(crop,expert_in) %>%
  mutate(total= sum(n),
         mean= round((n/total)*100,0))
question_5_frequencies_by_depto<- select(question_5_frequencies_by_depto,!n & !total)
#put it in long format
question_5_frequencies_by_depto <- question_5_frequencies_by_depto %>% 
  uncount(weights = mean, .id = "id")
#only select top 5 for the tree map
  #for banana
  question_5_frequencies_by_depto_banana<- filter(question_5_frequencies_by_depto, cat_abbreviations %in% question_5_frequencies$codes[which(question_5_frequencies$h2=="Banana")], crop=="Banana")
  #for plantain
  question_5_frequencies_by_depto_plantain<- filter(question_5_frequencies_by_depto, cat_abbreviations %in% question_5_frequencies$codes[which(question_5_frequencies$h2=="Plantain")], crop=="Plantain")
#merge both data set
question_5_frequencies_by_depto<- rbind(question_5_frequencies_by_depto_banana, question_5_frequencies_by_depto_plantain)
#tree map only plantain
tree_map_3(data = filter(question_5_frequencies_by_depto, crop=="Plantain"), "crop", "expert_in", "cat_abbreviations", "group_color", title="Top 5 Most Limiting Pests and Diseases in Plantains by Department")
```

    ## `summarise()` has grouped output by 'crop', 'expert_in', 'cat_abbreviations'.
    ## You can override using the `.groups` argument.

![](README_files/figure-gfm/question_5-3.png)<!-- -->

    ## $tm
    ##         crop          expert_in cat_abbreviations vSize  vColor stdErr
    ## 1   Plantain          Antioquia                BS    12 #35B96B     12
    ## 2   Plantain          Antioquia                BW     6 #43BF73      6
    ## 3   Plantain          Antioquia              MOKO    12 #6CD18C     12
    ## 4   Plantain          Antioquia              <NA>    54 #35B96B     54
    ## 5   Plantain          Antioquia               NEM    12 #79D694     12
    ## 6   Plantain          Antioquia                YS    12 #BEF4BE     12
    ## 7   Plantain             Arauca                BS    15 #35B96B     15
    ## 8   Plantain             Arauca                BW    15 #43BF73     15
    ## 9   Plantain             Arauca              MOKO    15 #6CD18C     15
    ## 10  Plantain             Arauca              <NA>    60 #35B96B     60
    ## 11  Plantain             Arauca               NEM    15 #79D694     15
    ## 12  Plantain          Atlántico                BS    25 #35B96B     25
    ## 13  Plantain          Atlántico               ELE    25 #50C57B     25
    ## 14  Plantain          Atlántico              MOKO    25 #6CD18C     25
    ## 15  Plantain          Atlántico              <NA>   100 #35B96B    100
    ## 16  Plantain          Atlántico                YS    25 #BEF4BE     25
    ## 17  Plantain            Bolívar                BS    25 #35B96B     25
    ## 18  Plantain            Bolívar               ELE    25 #50C57B     25
    ## 19  Plantain            Bolívar              MOKO    25 #6CD18C     25
    ## 20  Plantain            Bolívar              <NA>   100 #35B96B    100
    ## 21  Plantain            Bolívar                YS    25 #BEF4BE     25
    ## 22  Plantain             Caldas                BS    12 #35B96B     12
    ## 23  Plantain             Caldas                BW    21 #43BF73     21
    ## 24  Plantain             Caldas               ELE    18 #50C57B     18
    ## 25  Plantain             Caldas              MOKO    12 #6CD18C     12
    ## 26  Plantain             Caldas              <NA>    90 #35B96B     90
    ## 27  Plantain             Caldas               NEM    15 #79D694     15
    ## 28  Plantain             Caldas                YS    12 #BEF4BE     12
    ## 29  Plantain           Casanare                BS    17 #35B96B     17
    ## 30  Plantain           Casanare                BW    17 #43BF73     17
    ## 31  Plantain           Casanare              MOKO    17 #6CD18C     17
    ## 32  Plantain           Casanare              <NA>    68 #35B96B     68
    ## 33  Plantain           Casanare               NEM    17 #79D694     17
    ## 34  Plantain              Chocó                BS    33 #35B96B     33
    ## 35  Plantain              Chocó              MOKO    33 #6CD18C     33
    ## 36  Plantain              Chocó              <NA>    99 #35B96B     99
    ## 37  Plantain              Chocó               NEM    33 #79D694     33
    ## 38  Plantain            Córdoba                BS    17 #35B96B     17
    ## 39  Plantain            Córdoba                BW    17 #43BF73     17
    ## 40  Plantain            Córdoba               ELE    17 #50C57B     17
    ## 41  Plantain            Córdoba              MOKO    17 #6CD18C     17
    ## 42  Plantain            Córdoba              <NA>    85 #35B96B     85
    ## 43  Plantain            Córdoba                YS    17 #BEF4BE     17
    ## 44  Plantain              Huila                BS    14 #35B96B     14
    ## 45  Plantain              Huila                BW    14 #43BF73     14
    ## 46  Plantain              Huila               ELE    14 #50C57B     14
    ## 47  Plantain              Huila              MOKO    14 #6CD18C     14
    ## 48  Plantain              Huila              <NA>    70 #35B96B     70
    ## 49  Plantain              Huila               NEM    14 #79D694     14
    ## 50  Plantain         La Guajira                BS    17 #35B96B     17
    ## 51  Plantain         La Guajira                BW    11 #43BF73     11
    ## 52  Plantain         La Guajira              MOKO    22 #6CD18C     22
    ## 53  Plantain         La Guajira              <NA>    67 #35B96B     67
    ## 54  Plantain         La Guajira               NEM    11 #79D694     11
    ## 55  Plantain         La Guajira                YS     6 #BEF4BE      6
    ## 56  Plantain          Magdalena                BS    20 #35B96B     20
    ## 57  Plantain          Magdalena                BW    10 #43BF73     10
    ## 58  Plantain          Magdalena              MOKO    30 #6CD18C     30
    ## 59  Plantain          Magdalena              <NA>    80 #35B96B     80
    ## 60  Plantain          Magdalena               NEM    10 #79D694     10
    ## 61  Plantain          Magdalena                YS    10 #BEF4BE     10
    ## 62  Plantain               Meta                BS    16 #35B96B     16
    ## 63  Plantain               Meta                BW    14 #43BF73     14
    ## 64  Plantain               Meta               ELE     2 #50C57B      2
    ## 65  Plantain               Meta              MOKO    16 #6CD18C     16
    ## 66  Plantain               Meta              <NA>    68 #35B96B     68
    ## 67  Plantain               Meta               NEM    14 #79D694     14
    ## 68  Plantain               Meta                YS     6 #BEF4BE      6
    ## 69  Plantain               <NA>              <NA>  1478 #35B96B   1478
    ## 70  Plantain Norte De Santander                BS    14 #35B96B     14
    ## 71  Plantain Norte De Santander                BW    14 #43BF73     14
    ## 72  Plantain Norte De Santander               ELE    14 #50C57B     14
    ## 73  Plantain Norte De Santander              MOKO    14 #6CD18C     14
    ## 74  Plantain Norte De Santander              <NA>    70 #35B96B     70
    ## 75  Plantain Norte De Santander               NEM    14 #79D694     14
    ## 76  Plantain            Quindío                BS    15 #35B96B     15
    ## 77  Plantain            Quindío                BW    15 #43BF73     15
    ## 78  Plantain            Quindío               ELE    15 #50C57B     15
    ## 79  Plantain            Quindío              MOKO    15 #6CD18C     15
    ## 80  Plantain            Quindío              <NA>    78 #35B96B     78
    ## 81  Plantain            Quindío               NEM    11 #79D694     11
    ## 82  Plantain            Quindío                YS     7 #BEF4BE      7
    ## 83  Plantain          Risaralda                BS    13 #35B96B     13
    ## 84  Plantain          Risaralda                BW    10 #43BF73     10
    ## 85  Plantain          Risaralda               ELE    18 #50C57B     18
    ## 86  Plantain          Risaralda              MOKO    21 #6CD18C     21
    ## 87  Plantain          Risaralda              <NA>    90 #35B96B     90
    ## 88  Plantain          Risaralda               NEM    15 #79D694     15
    ## 89  Plantain          Risaralda                YS    13 #BEF4BE     13
    ## 90  Plantain          Santander                BS    33 #35B96B     33
    ## 91  Plantain          Santander                BW    33 #43BF73     33
    ## 92  Plantain          Santander              MOKO    33 #6CD18C     33
    ## 93  Plantain          Santander              <NA>    99 #35B96B     99
    ## 94  Plantain              Sucre                BS    50 #35B96B     50
    ## 95  Plantain              Sucre              <NA>   100 #35B96B    100
    ## 96  Plantain              Sucre                YS    50 #BEF4BE     50
    ## 97  Plantain             Tolima                BS    25 #35B96B     25
    ## 98  Plantain             Tolima               ELE    25 #50C57B     25
    ## 99  Plantain             Tolima              MOKO    25 #6CD18C     25
    ## 100 Plantain             Tolima              <NA>   100 #35B96B    100
    ## 101 Plantain             Tolima                YS    25 #BEF4BE     25
    ##     vColorValue level        x0         y0          w          h   color
    ## 1            NA     3 0.8284662 0.10649758 0.07623722 0.10649758 #35B96B
    ## 2            NA     3 0.9682345 0.00000000 0.03176551 0.12779710 #43BF73
    ## 3            NA     3 0.8284662 0.00000000 0.07623722 0.10649758 #6CD18C
    ## 4            NA     2 0.8284662 0.00000000 0.17153375 0.21299516 #35B96B
    ## 5            NA     3 0.9047035 0.12779710 0.09529653 0.08519806 #79D694
    ## 6            NA     3 0.9047035 0.00000000 0.06353102 0.12779710 #BEF4BE
    ## 7            NA     3 0.8284662 0.33132580 0.08576688 0.11833064 #35B96B
    ## 8            NA     3 0.8284662 0.21299516 0.08576688 0.11833064 #43BF73
    ## 9            NA     3 0.9142331 0.33132580 0.08576688 0.11833064 #6CD18C
    ## 10           NA     2 0.8284662 0.21299516 0.17153375 0.23666129 #35B96B
    ## 11           NA     3 0.9142331 0.21299516 0.08576688 0.11833064 #79D694
    ## 12           NA     3 0.0000000 0.83333333 0.10148850 0.16666667 #35B96B
    ## 13           NA     3 0.1014885 0.83333333 0.10148850 0.16666667 #50C57B
    ## 14           NA     3 0.0000000 0.66666667 0.10148850 0.16666667 #6CD18C
    ## 15           NA     2 0.0000000 0.66666667 0.20297700 0.33333333 #35B96B
    ## 16           NA     3 0.1014885 0.66666667 0.10148850 0.16666667 #BEF4BE
    ## 17           NA     3 0.0000000 0.50000000 0.10148850 0.16666667 #35B96B
    ## 18           NA     3 0.1014885 0.50000000 0.10148850 0.16666667 #50C57B
    ## 19           NA     3 0.0000000 0.33333333 0.10148850 0.16666667 #6CD18C
    ## 20           NA     2 0.0000000 0.33333333 0.20297700 0.33333333 #35B96B
    ## 21           NA     3 0.1014885 0.33333333 0.10148850 0.16666667 #BEF4BE
    ## 22           NA     3 0.4046008 0.69886364 0.10705291 0.07584175 #35B96B
    ## 23           NA     3 0.4046008 0.86950758 0.10888287 0.13049242 #43BF73
    ## 24           NA     3 0.5134837 0.86950758 0.09332817 0.13049242 #50C57B
    ## 25           NA     3 0.5116537 0.78418561 0.09515814 0.08532197 #6CD18C
    ## 26           NA     2 0.4046008 0.69886364 0.20221105 0.30113636 #35B96B
    ## 27           NA     3 0.4046008 0.77470539 0.10705291 0.09480219 #79D694
    ## 28           NA     3 0.5116537 0.69886364 0.09515814 0.08532197 #BEF4BE
    ## 29           NA     3 0.8153821 0.57426004 0.09230897 0.12460359 #35B96B
    ## 30           NA     3 0.8153821 0.44965645 0.09230897 0.12460359 #43BF73
    ## 31           NA     3 0.9076910 0.57426004 0.09230897 0.12460359 #6CD18C
    ## 32           NA     2 0.8153821 0.44965645 0.18461795 0.24920719 #35B96B
    ## 33           NA     3 0.9076910 0.44965645 0.09230897 0.12460359 #79D694
    ## 34           NA     3 0.2029770 0.44295302 0.10081191 0.22147651 #35B96B
    ## 35           NA     3 0.3037889 0.44295302 0.10081191 0.22147651 #6CD18C
    ## 36           NA     2 0.2029770 0.33221477 0.20162382 0.33221477 #35B96B
    ## 37           NA     3 0.2029770 0.33221477 0.20162382 0.11073826 #79D694
    ## 38           NA     3 0.8090229 0.87954545 0.09548855 0.12045455 #35B96B
    ## 39           NA     3 0.9045115 0.87954545 0.09548855 0.12045455 #43BF73
    ## 40           NA     3 0.8090229 0.69886364 0.06365903 0.18068182 #50C57B
    ## 41           NA     3 0.8726819 0.69886364 0.06365903 0.18068182 #6CD18C
    ## 42           NA     2 0.8090229 0.69886364 0.19097710 0.30113636 #35B96B
    ## 43           NA     3 0.9363410 0.69886364 0.06365903 0.18068182 #BEF4BE
    ## 44           NA     3 0.4046008 0.10728170 0.08829334 0.10728170 #35B96B
    ## 45           NA     3 0.4046008 0.00000000 0.08829334 0.10728170 #43BF73
    ## 46           NA     3 0.4928942 0.07152113 0.06622001 0.14304226 #50C57B
    ## 47           NA     3 0.5591142 0.07152113 0.06622001 0.14304226 #6CD18C
    ## 48           NA     2 0.4046008 0.00000000 0.22073336 0.21456340 #35B96B
    ## 49           NA     3 0.4928942 0.00000000 0.13244001 0.07152113 #79D694
    ## 50           NA     3 0.6253342 0.00000000 0.11824106 0.09727611 #35B96B
    ## 51           NA     3 0.7435752 0.13549172 0.08489102 0.08767111 #43BF73
    ## 52           NA     3 0.6253342 0.09727611 0.11824106 0.12588672 #6CD18C
    ## 53           NA     2 0.6253342 0.00000000 0.20313208 0.22316283 #35B96B
    ## 54           NA     3 0.7435752 0.04782061 0.08489102 0.08767111 #79D694
    ## 55           NA     3 0.7435752 0.00000000 0.08489102 0.04782061 #BEF4BE
    ## 56           NA     3 0.4046008 0.45364833 0.13795835 0.09808612 #35B96B
    ## 57           NA     3 0.5425592 0.61712520 0.08277501 0.08173844 #43BF73
    ## 58           NA     3 0.4046008 0.55173445 0.13795835 0.14712919 #6CD18C
    ## 59           NA     2 0.4046008 0.45364833 0.22073336 0.24521531 #35B96B
    ## 60           NA     3 0.5425592 0.53538676 0.08277501 0.08173844 #79D694
    ## 61           NA     3 0.5425592 0.45364833 0.08277501 0.08173844 #BEF4BE
    ## 62           NA     3 0.6253342 0.33640964 0.09559157 0.11324681 #35B96B
    ## 63           NA     3 0.7209257 0.36157560 0.10754051 0.08808085 #43BF73
    ## 64           NA     3 0.7893606 0.22316283 0.03910564 0.03460319 #50C57B
    ## 65           NA     3 0.6253342 0.22316283 0.09559157 0.11324681 #6CD18C
    ## 66           NA     2 0.6253342 0.22316283 0.20313208 0.22649362 #35B96B
    ## 67           NA     3 0.7209257 0.22316283 0.06843487 0.13841277 #79D694
    ## 68           NA     3 0.7893606 0.25776602 0.03910564 0.10380958 #BEF4BE
    ## 69           NA     1 0.0000000 0.00000000 1.00000000 1.00000000 #35B96B
    ## 70           NA     3 0.6253342 0.57426004 0.07601915 0.12460359 #35B96B
    ## 71           NA     3 0.6253342 0.44965645 0.07601915 0.12460359 #43BF73
    ## 72           NA     3 0.7013533 0.53272551 0.05701437 0.16613813 #50C57B
    ## 73           NA     3 0.7583677 0.53272551 0.05701437 0.16613813 #6CD18C
    ## 74           NA     2 0.6253342 0.44965645 0.19004789 0.24920719 #35B96B
    ## 75           NA     3 0.7013533 0.44965645 0.11402873 0.08306906 #79D694
    ## 76           NA     3 0.4046008 0.33410586 0.08489745 0.11954246 #35B96B
    ## 77           NA     3 0.4046008 0.21456340 0.08489745 0.11954246 #43BF73
    ## 78           NA     3 0.4894983 0.30422025 0.06791796 0.14942808 #50C57B
    ## 79           NA     3 0.5574162 0.30422025 0.06791796 0.14942808 #6CD18C
    ## 80           NA     2 0.4046008 0.21456340 0.22073336 0.23908493 #35B96B
    ## 81           NA     3 0.4894983 0.21456340 0.08301084 0.08965685 #79D694
    ## 82           NA     3 0.5725091 0.21456340 0.05282508 0.08965685 #BEF4BE
    ## 83           NA     3 0.6068119 0.69886364 0.11101783 0.07922754 #35B96B
    ## 84           NA     3 0.7178297 0.69886364 0.09119322 0.07419302 #43BF73
    ## 85           NA     3 0.7156947 0.86950758 0.09332817 0.13049242 #50C57B
    ## 86           NA     3 0.6068119 0.86950758 0.10888287 0.13049242 #6CD18C
    ## 87           NA     2 0.6068119 0.69886364 0.20221105 0.30113636 #35B96B
    ## 88           NA     3 0.6068119 0.77809118 0.11101783 0.09141640 #79D694
    ## 89           NA     3 0.7178297 0.77305665 0.09119322 0.09645092 #BEF4BE
    ## 90           NA     3 0.2029770 0.11073826 0.10081191 0.22147651 #35B96B
    ## 91           NA     3 0.3037889 0.11073826 0.10081191 0.22147651 #43BF73
    ## 92           NA     3 0.2029770 0.00000000 0.20162382 0.11073826 #6CD18C
    ## 93           NA     2 0.2029770 0.00000000 0.20162382 0.33221477 #35B96B
    ## 94           NA     3 0.0000000 0.16666667 0.20297700 0.16666667 #35B96B
    ## 95           NA     2 0.0000000 0.00000000 0.20297700 0.33333333 #35B96B
    ## 96           NA     3 0.0000000 0.00000000 0.20297700 0.16666667 #BEF4BE
    ## 97           NA     3 0.2029770 0.83221477 0.10081191 0.16778523 #35B96B
    ## 98           NA     3 0.3037889 0.83221477 0.10081191 0.16778523 #50C57B
    ## 99           NA     3 0.2029770 0.66442953 0.10081191 0.16778523 #6CD18C
    ## 100          NA     2 0.2029770 0.66442953 0.20162382 0.33557047 #35B96B
    ## 101          NA     3 0.3037889 0.66442953 0.10081191 0.16778523 #BEF4BE
    ## 
    ## $type
    ## [1] "color"
    ## 
    ## $vSize
    ## [1] "frequency"
    ## 
    ## $vColor
    ## [1] "group_color"
    ## 
    ## $stdErr
    ## [1] "frequency"
    ## 
    ## $algorithm
    ## [1] "pivotSize"
    ## 
    ## $vpCoorX
    ## [1] 0.02812148 0.97187852
    ## 
    ## $vpCoorY
    ## [1] 0.01968504 0.91031496
    ## 
    ## $aspRatio
    ## [1] 1.483512
    ## 
    ## $range
    ## [1] NA NA
    ## 
    ## $mapping
    ## [1] NA NA NA
    ## 
    ## $draw
    ## [1] TRUE

``` r
#tree map only banana
tree_map_3(data = filter(question_5_frequencies_by_depto, crop=="Banana"), "crop", "expert_in", "cat_abbreviations", "group_color", title="Top 5 Most Limiting Pests and Diseases in Bananas by Department")
```

    ## `summarise()` has grouped output by 'crop', 'expert_in', 'cat_abbreviations'.
    ## You can override using the `.groups` argument.

![](README_files/figure-gfm/question_5-4.png)<!-- -->

    ## $tm
    ##      crop  expert_in cat_abbreviations vSize  vColor stdErr vColorValue level
    ## 1  Banana  Antioquia                BS    17 #FFDC12     17          NA     3
    ## 2  Banana  Antioquia                BW    13 #FFDE25     13          NA     3
    ## 3  Banana  Antioquia               FUS     1 #FFE24A      1          NA     3
    ## 4  Banana  Antioquia              MOKO    17 #FFE45C     17          NA     3
    ## 5  Banana  Antioquia              <NA>    61 #FFDC12     61          NA     2
    ## 6  Banana  Antioquia                SI    13 #FFEB94     13          NA     3
    ## 7  Banana     Caldas                BS    20 #FFDC12     20          NA     3
    ## 8  Banana     Caldas                BW    20 #FFDE25     20          NA     3
    ## 9  Banana     Caldas               FUS    20 #FFE24A     20          NA     3
    ## 10 Banana     Caldas              MOKO    20 #FFE45C     20          NA     3
    ## 11 Banana     Caldas              <NA>    80 #FFDC12     80          NA     2
    ## 12 Banana      Cesar                BS   100 #FFDC12    100          NA     3
    ## 13 Banana      Cesar              <NA>   100 #FFDC12    100          NA     2
    ## 14 Banana      Chocó                BS    25 #FFDC12     25          NA     3
    ## 15 Banana      Chocó              MOKO    25 #FFE45C     25          NA     3
    ## 16 Banana      Chocó              <NA>    62 #FFDC12     62          NA     2
    ## 17 Banana      Chocó                SI    12 #FFEB94     12          NA     3
    ## 18 Banana    Córdoba                BS    25 #FFDC12     25          NA     3
    ## 19 Banana    Córdoba                BW    12 #FFDE25     12          NA     3
    ## 20 Banana    Córdoba              MOKO    25 #FFE45C     25          NA     3
    ## 21 Banana    Córdoba              <NA>    62 #FFDC12     62          NA     2
    ## 22 Banana      Huila                BS    20 #FFDC12     20          NA     3
    ## 23 Banana      Huila                BW    20 #FFDE25     20          NA     3
    ## 24 Banana      Huila               FUS    20 #FFE24A     20          NA     3
    ## 25 Banana      Huila              MOKO    20 #FFE45C     20          NA     3
    ## 26 Banana      Huila              <NA>    80 #FFDC12     80          NA     2
    ## 27 Banana La Guajira                BS    23 #FFDC12     23          NA     3
    ## 28 Banana La Guajira                BW    20 #FFDE25     20          NA     3
    ## 29 Banana La Guajira               FUS    23 #FFE24A     23          NA     3
    ## 30 Banana La Guajira              MOKO    17 #FFE45C     17          NA     3
    ## 31 Banana La Guajira              <NA>    93 #FFDC12     93          NA     2
    ## 32 Banana La Guajira                SI    10 #FFEB94     10          NA     3
    ## 33 Banana  Magdalena                BS    21 #FFDC12     21          NA     3
    ## 34 Banana  Magdalena                BW    19 #FFDE25     19          NA     3
    ## 35 Banana  Magdalena               FUS    17 #FFE24A     17          NA     3
    ## 36 Banana  Magdalena              MOKO    23 #FFE45C     23          NA     3
    ## 37 Banana  Magdalena              <NA>    90 #FFDC12     90          NA     2
    ## 38 Banana  Magdalena                SI    10 #FFEB94     10          NA     3
    ## 39 Banana       <NA>              <NA>   788 #FFDC12    788          NA     1
    ## 40 Banana    Quindío                BS    20 #FFDC12     20          NA     3
    ## 41 Banana    Quindío                BW    20 #FFDE25     20          NA     3
    ## 42 Banana    Quindío               FUS    20 #FFE24A     20          NA     3
    ## 43 Banana    Quindío              MOKO    20 #FFE45C     20          NA     3
    ## 44 Banana    Quindío              <NA>    80 #FFDC12     80          NA     2
    ## 45 Banana  Risaralda                BS    20 #FFDC12     20          NA     3
    ## 46 Banana  Risaralda                BW    20 #FFDE25     20          NA     3
    ## 47 Banana  Risaralda               FUS    20 #FFE24A     20          NA     3
    ## 48 Banana  Risaralda              MOKO    20 #FFE45C     20          NA     3
    ## 49 Banana  Risaralda              <NA>    80 #FFDC12     80          NA     2
    ##           x0         y0          w          h   color
    ## 1  0.8556386 0.38679021 0.14436137 0.14944167 #FFDC12
    ## 2  0.8556386 0.12306961 0.14436137 0.11427893 #FFDE25
    ## 3  0.9896885 0.00000000 0.01031153 0.12306961 #FFE24A
    ## 4  0.8556386 0.23734854 0.14436137 0.14944167 #FFE45C
    ## 5  0.8556386 0.00000000 0.14436137 0.53623188 #FFDC12
    ## 6  0.8556386 0.00000000 0.13404984 0.12306961 #FFEB94
    ## 7  0.2449239 0.48000000 0.15862944 0.16000000 #FFDC12
    ## 8  0.2449239 0.32000000 0.15862944 0.16000000 #FFDE25
    ## 9  0.4035533 0.48000000 0.15862944 0.16000000 #FFE24A
    ## 10 0.4035533 0.32000000 0.15862944 0.16000000 #FFE45C
    ## 11 0.2449239 0.32000000 0.31725888 0.32000000 #FFDC12
    ## 12 0.0000000 0.48186528 0.24492386 0.51813472 #FFDC12
    ## 13 0.0000000 0.48186528 0.24492386 0.51813472 #FFDC12
    ## 14 0.5621827 0.26811594 0.11832899 0.26811594 #FFDC12
    ## 15 0.6805117 0.35507246 0.17512690 0.18115942 #FFE45C
    ## 16 0.5621827 0.26811594 0.29345589 0.26811594 #FFDC12
    ## 17 0.6805117 0.26811594 0.17512690 0.08695652 #FFEB94
    ## 18 0.5621827 0.00000000 0.11832899 0.26811594 #FFDC12
    ## 19 0.6805117 0.00000000 0.17512690 0.08695652 #FFDE25
    ## 20 0.6805117 0.08695652 0.17512690 0.18115942 #FFE45C
    ## 21 0.5621827 0.00000000 0.29345589 0.26811594 #FFDC12
    ## 22 0.2449239 0.16000000 0.15862944 0.16000000 #FFDC12
    ## 23 0.2449239 0.00000000 0.15862944 0.16000000 #FFDE25
    ## 24 0.4035533 0.16000000 0.15862944 0.16000000 #FFE24A
    ## 25 0.4035533 0.00000000 0.15862944 0.16000000 #FFE45C
    ## 26 0.2449239 0.00000000 0.31725888 0.32000000 #FFDC12
    ## 27 0.0000000 0.24352332 0.12246193 0.23834197 #FFDC12
    ## 28 0.0000000 0.00000000 0.10422292 0.24352332 #FFDE25
    ## 29 0.1224619 0.24352332 0.12246193 0.23834197 #FFE24A
    ## 30 0.1042229 0.09019382 0.14070094 0.15332950 #FFE45C
    ## 31 0.0000000 0.00000000 0.24492386 0.48186528 #FFDC12
    ## 32 0.1042229 0.00000000 0.14070094 0.09019382 #FFEB94
    ## 33 0.2449239 0.64000000 0.15510434 0.17181818 #FFDC12
    ## 34 0.4000282 0.85130435 0.16215454 0.14869565 #FFDE25
    ## 35 0.4000282 0.64000000 0.10209730 0.21130435 #FFE24A
    ## 36 0.2449239 0.81181818 0.15510434 0.18818182 #FFE45C
    ## 37 0.2449239 0.64000000 0.31725888 0.36000000 #FFDC12
    ## 38 0.5021255 0.64000000 0.06005724 0.21130435 #FFEB94
    ## 39 0.0000000 0.00000000 1.00000000 1.00000000 #FFDC12
    ## 40 0.5621827 0.76811594 0.10945431 0.23188406 #FFDC12
    ## 41 0.6716371 0.76811594 0.10945431 0.23188406 #FFDE25
    ## 42 0.5621827 0.53623188 0.10945431 0.23188406 #FFE24A
    ## 43 0.6716371 0.53623188 0.10945431 0.23188406 #FFE45C
    ## 44 0.5621827 0.53623188 0.21890863 0.46376812 #FFDC12
    ## 45 0.7810914 0.76811594 0.10945431 0.23188406 #FFDC12
    ## 46 0.8905457 0.76811594 0.10945431 0.23188406 #FFDE25
    ## 47 0.7810914 0.53623188 0.10945431 0.23188406 #FFE24A
    ## 48 0.8905457 0.53623188 0.10945431 0.23188406 #FFE45C
    ## 49 0.7810914 0.53623188 0.21890863 0.46376812 #FFDC12
    ## 
    ## $type
    ## [1] "color"
    ## 
    ## $vSize
    ## [1] "frequency"
    ## 
    ## $vColor
    ## [1] "group_color"
    ## 
    ## $stdErr
    ## [1] "frequency"
    ## 
    ## $algorithm
    ## [1] "pivotSize"
    ## 
    ## $vpCoorX
    ## [1] 0.02812148 0.97187852
    ## 
    ## $vpCoorY
    ## [1] 0.01968504 0.91031496
    ## 
    ## $aspRatio
    ## [1] 1.483512
    ## 
    ## $range
    ## [1] NA NA
    ## 
    ## $mapping
    ## [1] NA NA NA
    ## 
    ## $draw
    ## [1] TRUE

``` r
#Additional top 5 diseases and pest in Colombia
q5_top_5Colobia<- count_elements_by_group(question_5, "answer_in_english", c("answer_in_english"))
q5_top_5Colobia$mean<-round((q5_top_5Colobia$n/sum(q5_top_5Colobia$n)*100),0)
q5_top_5Colobia$background_color<- "white"
q5_top_5Colobia$color<- palette_soil(length(unique(q5_top_5Colobia$answer_in_english)))
#Make abbreviations 
q5_top_5Colobia <- q5_top_5Colobia %>%
  mutate(cat_abbreviations = case_when(
    answer_in_english == "Banana Mosaic Disease" ~ "BMD",
    answer_in_english == "Black Sigatoka" ~ "BS",
    answer_in_english == "Black Weevil" ~ "BW",
    answer_in_english == "Elephantiasis" ~ "ELE",
    answer_in_english == "Fusarium" ~ "FUS",
    answer_in_english == "Moko or Madurabiche" ~ "MOKO",
    answer_in_english == "Nematodes" ~ "NEM",
    answer_in_english == "Red Spider Mite" ~ "RSM",
    answer_in_english == "Scale Insect" ~ "SI",
    answer_in_english == "Scarab Beetle" ~ "SB",
    answer_in_english == "Whiteflies" ~ "WF",
    answer_in_english == "Yellow Sigatoka" ~ "YS",
    TRUE ~ NA_character_  # Default case if none of the above conditions are met
  ))
#sort the results by mean
q5_top_5Colobia <- q5_top_5Colobia %>%
  arrange(desc(mean))
#Finding the order of the levels
q5_top_5Colobia$cat_abbreviations<- factor(q5_top_5Colobia$cat_abbreviations, levels = q5_top_5Colobia$cat_abbreviations)
#plot most important pest and diseases
bar_plot_banana_plantain(data_set = q5_top_5Colobia,x_lab = "Pest and Diseases", y_lab ="Proportion of Experts (%)", title = "
Important Pests and Diseases in Musaceae Identified by Experts" ,x = "cat_abbreviations", y = "mean", alpha = 0.3,background_color = "background_color", bar_color = "color",proportional_limit =1.10)
```

![](README_files/figure-gfm/question_5-5.png)<!-- -->

## Question 6: What level of knowledge do producers have about the phytosanitary status of the banana planting material they use?

``` r
#selecting only question 6----
  question_6<- filter(individual_surveys, question_number==6)
#some experts selected more than one option in this question so an intermediate answer is chosen 
question_6 <- question_6 %>%
  mutate(answer_in_english = case_when(
    answer_in_english == "Very Low Knowledge,Low Knowledge,Moderate Knowledge" ~ "Low Knowledge",
    answer_in_english == "Very Low Knowledge,Low Knowledge" ~ "Low Knowledge",
    answer_in_english == "Moderate Knowledge,High Knowledge" ~ "Moderate Knowledge",
    TRUE ~ answer_in_english  # This keeps all other values as they are
  ))
#some experts selected more than one option in this question so an intermediate answer is chosen 
question_6 <- question_6 %>%
  mutate(numeric_answer = case_when(
    numeric_answer == "2,3,4" ~ "3",
    numeric_answer == "2,3" ~ "2.5",
    numeric_answer == "4,5" ~ "4.5",
    TRUE ~ numeric_answer  # This keeps all other values as they are
  ))
  #organizing the order of the levels
  question_6$answer_in_english<- factor(question_6$answer_in_english,levels = 
c("No Knowledge", "Very Low Knowledge", "Low Knowledge", "Moderate Knowledge", "High Knowledge", "Very High Knowledge"))
 #average by department (weighted and no weighted)
    #not weighted 
    avg_dept_no_weight<- question_6 %>%
      group_by(crop, expert_in) %>%
      mutate(numeric_answer=as.numeric(numeric_answer))%>%
      mutate(average= mean(numeric_answer)) %>%
      group_by(average)%>%
      mutate(ave_cat= category_by_mean_by_question(6, mean =average, language = "en"))
```

    ## Warning: There were 5 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `ave_cat = category_by_mean_by_question(6, mean = average,
    ##   language = "en")`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 4 remaining warnings.

``` r
    #weighted 
    add_weights_question6<- inner_join(question_6, experience_of_each_expert)
```

    ## Joining with `by = join_by(crop, expert_ID, expert_in)`

``` r
    avg_dept_weight<- add_weights_question6 %>%
      group_by(crop, expert_in) %>%
      mutate(numeric_answer=as.numeric(numeric_answer))%>%
      mutate(average_weighted= weighted.mean(numeric_answer, weights)) %>% 
      group_by(average_weighted)%>%
      mutate(ave_cat_weighted= category_by_mean_by_question(6, mean =average_weighted, language = "en"))
```

    ## Warning: There were 7 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `ave_cat_weighted = category_by_mean_by_question(6, mean =
    ##   average_weighted, language = "en")`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 6 remaining warnings.

``` r
    #finding the levels per crop (banana and plantain) no weighted
  levels_per_crop_Q6_no_weighted<- tapply(avg_dept_no_weight$ave_cat, avg_dept_no_weight$crop, function(x){(unique(x))})
  #generating a ramp palette according to the number of levels per crop
  colors_banana_question6_no_weighted<- palette_banana(length(levels_per_crop_Q6_no_weighted$Banana))
  colors_plantain_question6_no_weighted<- palette_plantain(length(levels_per_crop_Q6_no_weighted$Plantain))
  #Assigning the colors by crop and answer
    # Define the knowledge levels for each crop
    levels_by_crop_no_weighted <- list(
      Banana = levels_per_crop_Q6_no_weighted$Banana,
      Plantain = levels_per_crop_Q6_no_weighted$Plantain
    )
    # Define the colors for each crop
    colors_by_crop_no_weighted <- list(
      Banana = colors_banana_question6_no_weighted, # Replace with actual color vector for Banana
      Plantain = colors_plantain_question6_no_weighted # Replace with actual color vector for Plantain
      # Add more crops and their color vectors here if needed
    )
    # Now call the function
    avg_dept_no_weight <- assign_group_color(data = avg_dept_no_weight, levels_by_crop = levels_by_crop_no_weighted, colors_by_crop = colors_by_crop_no_weighted,answer_col =  "ave_cat")
    
    #finding the levels per crop (banana and plantain) weighted
  levels_per_crop_Q6_weighted<- tapply(avg_dept_weight$ave_cat_weighted, avg_dept_weight$crop, function(x){(unique(x))})
  #generating a ramp palette according to the number of levels per crop
  colors_banana_question6_weighted<- palette_banana(length(levels_per_crop_Q6_weighted$Banana))
  colors_plantain_question6_weighted<- palette_plantain(length(levels_per_crop_Q6_weighted$Plantain))
  #Assigning the colors by crop and answer
    # Define the knowledge levels for each crop
    levels_by_crop_weighted <- list(
      Banana = levels_per_crop_Q6_weighted$Banana,
      Plantain = levels_per_crop_Q6_weighted$Plantain
    )
    # Define the colors for each crop
    colors_by_crop_weighted <- list(
      Banana = colors_banana_question6_weighted, # Replace with actual color vector for Banana
      Plantain = colors_plantain_question6_weighted # Replace with actual color vector for Plantain
      # Add more crops and their color vectors here if needed
    )
    # Now call the function
    avg_dept_weight <- assign_group_color(data = avg_dept_weight, levels_by_crop = levels_by_crop_weighted, colors_by_crop = colors_by_crop_weighted,answer_col =  "ave_cat_weighted")

#tree map
tree_map_3(data = avg_dept_no_weight, "crop", "expert_in", "ave_cat", "group_color", title="No weighted")
```

    ## `summarise()` has grouped output by 'crop', 'expert_in', 'ave_cat'. You can
    ## override using the `.groups` argument.

![](README_files/figure-gfm/question_6-1.png)<!-- -->

    ## $tm
    ##        crop          expert_in             ave_cat vSize  vColor stdErr
    ## 1    Banana          Antioquia      High Knowledge    11 #FFDA00     11
    ## 2    Banana          Antioquia                <NA>    11 #FFDA00     11
    ## 3    Banana             Caldas  Moderate Knowledge     1 #FFE033      1
    ## 4    Banana             Caldas                <NA>     1 #FFE033      1
    ## 5    Banana              Cesar                <NA>     1 #FFE566      1
    ## 6    Banana              Cesar Very High Knowledge     1 #FFE566      1
    ## 7    Banana              Chocó       Low Knowledge     2 #FFEB99      2
    ## 8    Banana              Chocó                <NA>     2 #FFEB99      2
    ## 9    Banana            Córdoba                <NA>     1 #FFF2CC      1
    ## 10   Banana            Córdoba  Very Low Knowledge     1 #FFF2CC      1
    ## 11   Banana              Huila  Moderate Knowledge     1 #FFE033      1
    ## 12   Banana              Huila                <NA>     1 #FFE033      1
    ## 13   Banana         La Guajira      High Knowledge     9 #FFDA00      9
    ## 14   Banana         La Guajira                <NA>     9 #FFDA00      9
    ## 15   Banana          Magdalena  Moderate Knowledge    13 #FFE033     13
    ## 16   Banana          Magdalena                <NA>    13 #FFE033     13
    ## 17   Banana               <NA>                <NA>    41 #FFE033     41
    ## 18   Banana            Quindío  Moderate Knowledge     1 #FFE033      1
    ## 19   Banana            Quindío                <NA>     1 #FFE033      1
    ## 20   Banana          Risaralda  Moderate Knowledge     1 #FFE033      1
    ## 21   Banana          Risaralda                <NA>     1 #FFE033      1
    ## 22 Plantain          Antioquia      High Knowledge     2 #28B463      2
    ## 23 Plantain          Antioquia                <NA>     2 #28B463      2
    ## 24 Plantain             Arauca       Low Knowledge     2 #59C981      2
    ## 25 Plantain             Arauca                <NA>     2 #59C981      2
    ## 26 Plantain          Atlántico                <NA>     1 #BEF4BE      1
    ## 27 Plantain          Atlántico  Very Low Knowledge     1 #BEF4BE      1
    ## 28 Plantain            Bolívar                <NA>     1 #BEF4BE      1
    ## 29 Plantain            Bolívar  Very Low Knowledge     1 #BEF4BE      1
    ## 30 Plantain             Caldas       Low Knowledge     7 #59C981      7
    ## 31 Plantain             Caldas                <NA>     7 #59C981      7
    ## 32 Plantain           Casanare       Low Knowledge     2 #59C981      2
    ## 33 Plantain           Casanare                <NA>     2 #59C981      2
    ## 34 Plantain              Chocó      High Knowledge     1 #28B463      1
    ## 35 Plantain              Chocó                <NA>     1 #28B463      1
    ## 36 Plantain            Córdoba       Low Knowledge     1 #59C981      1
    ## 37 Plantain            Córdoba                <NA>     1 #59C981      1
    ## 38 Plantain              Huila       Low Knowledge     1 #59C981      1
    ## 39 Plantain              Huila                <NA>     1 #59C981      1
    ## 40 Plantain         La Guajira       Low Knowledge     4 #59C981      4
    ## 41 Plantain         La Guajira                <NA>     4 #59C981      4
    ## 42 Plantain          Magdalena       Low Knowledge     3 #59C981      3
    ## 43 Plantain          Magdalena                <NA>     3 #59C981      3
    ## 44 Plantain               Meta  Moderate Knowledge    10 #8CDE9F     10
    ## 45 Plantain               Meta                <NA>    10 #8CDE9F     10
    ## 46 Plantain               <NA>                <NA>    55 #59C981     55
    ## 47 Plantain Norte De Santander  Moderate Knowledge     1 #8CDE9F      1
    ## 48 Plantain Norte De Santander                <NA>     1 #8CDE9F      1
    ## 49 Plantain            Quindío  Moderate Knowledge     6 #8CDE9F      6
    ## 50 Plantain            Quindío                <NA>     6 #8CDE9F      6
    ## 51 Plantain          Risaralda  Moderate Knowledge    10 #8CDE9F     10
    ## 52 Plantain          Risaralda                <NA>    10 #8CDE9F     10
    ## 53 Plantain          Santander       Low Knowledge     1 #59C981      1
    ## 54 Plantain          Santander                <NA>     1 #59C981      1
    ## 55 Plantain              Sucre                <NA>     1 #BEF4BE      1
    ## 56 Plantain              Sucre  Very Low Knowledge     1 #BEF4BE      1
    ## 57 Plantain             Tolima       Low Knowledge     1 #59C981      1
    ## 58 Plantain             Tolima                <NA>     1 #59C981      1
    ##    vColorValue level        x0         y0          w          h   color
    ## 1           NA     3 0.8042535 0.41463415 0.19574653 0.58536585 #FFDA00
    ## 2           NA     2 0.8042535 0.41463415 0.19574653 0.58536585 #FFDA00
    ## 3           NA     3 0.8492647 0.27642276 0.07536765 0.13821138 #FFE033
    ## 4           NA     2 0.8492647 0.27642276 0.07536765 0.13821138 #FFE033
    ## 5           NA     2 0.9246324 0.27642276 0.07536765 0.13821138 #FFE566
    ## 6           NA     3 0.9246324 0.27642276 0.07536765 0.13821138 #FFE566
    ## 7           NA     3 0.5729167 0.00000000 0.27634804 0.07538803 #FFEB99
    ## 8           NA     2 0.5729167 0.00000000 0.27634804 0.07538803 #FFEB99
    ## 9           NA     2 0.8492647 0.13821138 0.07536765 0.13821138 #FFF2CC
    ## 10          NA     3 0.8492647 0.13821138 0.07536765 0.13821138 #FFF2CC
    ## 11          NA     3 0.9246324 0.13821138 0.07536765 0.13821138 #FFE033
    ## 12          NA     2 0.9246324 0.13821138 0.07536765 0.13821138 #FFE033
    ## 13          NA     3 0.5729167 0.07538803 0.27634804 0.33924612 #FFDA00
    ## 14          NA     2 0.5729167 0.07538803 0.27634804 0.33924612 #FFDA00
    ## 15          NA     3 0.5729167 0.41463415 0.23133681 0.58536585 #FFE033
    ## 16          NA     2 0.5729167 0.41463415 0.23133681 0.58536585 #FFE033
    ## 17          NA     1 0.5729167 0.00000000 0.42708333 1.00000000 #FFE033
    ## 18          NA     3 0.8492647 0.00000000 0.07536765 0.13821138 #FFE033
    ## 19          NA     2 0.8492647 0.00000000 0.07536765 0.13821138 #FFE033
    ## 20          NA     3 0.9246324 0.00000000 0.07536765 0.13821138 #FFE033
    ## 21          NA     2 0.9246324 0.00000000 0.07536765 0.13821138 #FFE033
    ## 22          NA     3 0.4928902 0.37603306 0.08002646 0.26033058 #28B463
    ## 23          NA     2 0.4928902 0.37603306 0.08002646 0.26033058 #28B463
    ## 24          NA     3 0.2127976 0.18801653 0.11080586 0.18801653 #59C981
    ## 25          NA     2 0.2127976 0.18801653 0.11080586 0.18801653 #59C981
    ## 26          NA     2 0.3236035 0.25068871 0.08310440 0.12534435 #BEF4BE
    ## 27          NA     3 0.3236035 0.25068871 0.08310440 0.12534435 #BEF4BE
    ## 28          NA     2 0.4067079 0.25068871 0.08310440 0.12534435 #BEF4BE
    ## 29          NA     3 0.4067079 0.25068871 0.08310440 0.12534435 #BEF4BE
    ## 30          NA     3 0.0000000 0.29370629 0.21279762 0.34265734 #59C981
    ## 31          NA     2 0.0000000 0.29370629 0.21279762 0.34265734 #59C981
    ## 32          NA     3 0.2127976 0.00000000 0.11080586 0.18801653 #59C981
    ## 33          NA     2 0.2127976 0.00000000 0.11080586 0.18801653 #59C981
    ## 34          NA     3 0.4898123 0.25068871 0.08310440 0.12534435 #28B463
    ## 35          NA     2 0.4898123 0.25068871 0.08310440 0.12534435 #28B463
    ## 36          NA     3 0.3236035 0.12534435 0.08310440 0.12534435 #59C981
    ## 37          NA     2 0.3236035 0.12534435 0.08310440 0.12534435 #59C981
    ## 38          NA     3 0.3236035 0.00000000 0.08310440 0.12534435 #59C981
    ## 39          NA     2 0.3236035 0.00000000 0.08310440 0.12534435 #59C981
    ## 40          NA     3 0.2127976 0.37603306 0.16005291 0.26033058 #59C981
    ## 41          NA     2 0.2127976 0.37603306 0.16005291 0.26033058 #59C981
    ## 42          NA     3 0.3728505 0.37603306 0.12003968 0.26033058 #59C981
    ## 43          NA     2 0.3728505 0.37603306 0.12003968 0.26033058 #59C981
    ## 44          NA     3 0.0000000 0.63636364 0.28645833 0.36363636 #8CDE9F
    ## 45          NA     2 0.0000000 0.63636364 0.28645833 0.36363636 #8CDE9F
    ## 46          NA     1 0.0000000 0.00000000 0.57291667 1.00000000 #59C981
    ## 47          NA     3 0.4067079 0.12534435 0.08310440 0.12534435 #8CDE9F
    ## 48          NA     2 0.4067079 0.12534435 0.08310440 0.12534435 #8CDE9F
    ## 49          NA     3 0.0000000 0.00000000 0.21279762 0.29370629 #8CDE9F
    ## 50          NA     2 0.0000000 0.00000000 0.21279762 0.29370629 #8CDE9F
    ## 51          NA     3 0.2864583 0.63636364 0.28645833 0.36363636 #8CDE9F
    ## 52          NA     2 0.2864583 0.63636364 0.28645833 0.36363636 #8CDE9F
    ## 53          NA     3 0.4898123 0.12534435 0.08310440 0.12534435 #59C981
    ## 54          NA     2 0.4898123 0.12534435 0.08310440 0.12534435 #59C981
    ## 55          NA     2 0.4067079 0.00000000 0.08310440 0.12534435 #BEF4BE
    ## 56          NA     3 0.4067079 0.00000000 0.08310440 0.12534435 #BEF4BE
    ## 57          NA     3 0.4898123 0.00000000 0.08310440 0.12534435 #59C981
    ## 58          NA     2 0.4898123 0.00000000 0.08310440 0.12534435 #59C981
    ## 
    ## $type
    ## [1] "color"
    ## 
    ## $vSize
    ## [1] "frequency"
    ## 
    ## $vColor
    ## [1] "group_color"
    ## 
    ## $stdErr
    ## [1] "frequency"
    ## 
    ## $algorithm
    ## [1] "pivotSize"
    ## 
    ## $vpCoorX
    ## [1] 0.02812148 0.97187852
    ## 
    ## $vpCoorY
    ## [1] 0.01968504 0.91031496
    ## 
    ## $aspRatio
    ## [1] 1.483512
    ## 
    ## $range
    ## [1] NA NA
    ## 
    ## $mapping
    ## [1] NA NA NA
    ## 
    ## $draw
    ## [1] TRUE

``` r
tree_map_3(data = avg_dept_weight, "crop", "expert_in", "ave_cat_weighted", "group_color", title="weighted")
```

    ## `summarise()` has grouped output by 'crop', 'expert_in', 'ave_cat_weighted'.
    ## You can override using the `.groups` argument.

![](README_files/figure-gfm/question_6-2.png)<!-- -->

    ## $tm
    ##        crop          expert_in    ave_cat_weighted vSize  vColor stdErr
    ## 1    Banana          Antioquia      High Knowledge    11 #FFDA00     11
    ## 2    Banana          Antioquia                <NA>    11 #FFDA00     11
    ## 3    Banana             Caldas  Moderate Knowledge     1 #FFE033      1
    ## 4    Banana             Caldas                <NA>     1 #FFE033      1
    ## 5    Banana              Cesar                <NA>     1 #FFE566      1
    ## 6    Banana              Cesar Very High Knowledge     1 #FFE566      1
    ## 7    Banana              Chocó       Low Knowledge     2 #FFEB99      2
    ## 8    Banana              Chocó                <NA>     2 #FFEB99      2
    ## 9    Banana            Córdoba                <NA>     1 #FFF2CC      1
    ## 10   Banana            Córdoba  Very Low Knowledge     1 #FFF2CC      1
    ## 11   Banana              Huila  Moderate Knowledge     1 #FFE033      1
    ## 12   Banana              Huila                <NA>     1 #FFE033      1
    ## 13   Banana         La Guajira      High Knowledge     8 #FFDA00      8
    ## 14   Banana         La Guajira                <NA>     8 #FFDA00      8
    ## 15   Banana          Magdalena  Moderate Knowledge    12 #FFE033     12
    ## 16   Banana          Magdalena                <NA>    12 #FFE033     12
    ## 17   Banana               <NA>                <NA>    39 #FFE033     39
    ## 18   Banana            Quindío  Moderate Knowledge     1 #FFE033      1
    ## 19   Banana            Quindío                <NA>     1 #FFE033      1
    ## 20   Banana          Risaralda  Moderate Knowledge     1 #FFE033      1
    ## 21   Banana          Risaralda                <NA>     1 #FFE033      1
    ## 22 Plantain          Antioquia      High Knowledge     2 #28B463      2
    ## 23 Plantain          Antioquia                <NA>     2 #28B463      2
    ## 24 Plantain             Arauca       Low Knowledge     2 #59C981      2
    ## 25 Plantain             Arauca                <NA>     2 #59C981      2
    ## 26 Plantain          Atlántico                <NA>     1 #BEF4BE      1
    ## 27 Plantain          Atlántico  Very Low Knowledge     1 #BEF4BE      1
    ## 28 Plantain            Bolívar                <NA>     1 #BEF4BE      1
    ## 29 Plantain            Bolívar  Very Low Knowledge     1 #BEF4BE      1
    ## 30 Plantain             Caldas       Low Knowledge     7 #59C981      7
    ## 31 Plantain             Caldas                <NA>     7 #59C981      7
    ## 32 Plantain           Casanare       Low Knowledge     2 #59C981      2
    ## 33 Plantain           Casanare                <NA>     2 #59C981      2
    ## 34 Plantain              Chocó      High Knowledge     1 #28B463      1
    ## 35 Plantain              Chocó                <NA>     1 #28B463      1
    ## 36 Plantain            Córdoba       Low Knowledge     1 #59C981      1
    ## 37 Plantain            Córdoba                <NA>     1 #59C981      1
    ## 38 Plantain              Huila       Low Knowledge     1 #59C981      1
    ## 39 Plantain              Huila                <NA>     1 #59C981      1
    ## 40 Plantain         La Guajira       Low Knowledge     4 #59C981      4
    ## 41 Plantain         La Guajira                <NA>     4 #59C981      4
    ## 42 Plantain          Magdalena       Low Knowledge     3 #59C981      3
    ## 43 Plantain          Magdalena                <NA>     3 #59C981      3
    ## 44 Plantain               Meta  Moderate Knowledge    10 #8CDE9F     10
    ## 45 Plantain               Meta                <NA>    10 #8CDE9F     10
    ## 46 Plantain               <NA>                <NA>    55 #59C981     55
    ## 47 Plantain Norte De Santander  Moderate Knowledge     1 #8CDE9F      1
    ## 48 Plantain Norte De Santander                <NA>     1 #8CDE9F      1
    ## 49 Plantain            Quindío       Low Knowledge     6 #59C981      6
    ## 50 Plantain            Quindío                <NA>     6 #59C981      6
    ## 51 Plantain          Risaralda       Low Knowledge    10 #59C981     10
    ## 52 Plantain          Risaralda                <NA>    10 #59C981     10
    ## 53 Plantain          Santander       Low Knowledge     1 #59C981      1
    ## 54 Plantain          Santander                <NA>     1 #59C981      1
    ## 55 Plantain              Sucre                <NA>     1 #BEF4BE      1
    ## 56 Plantain              Sucre  Very Low Knowledge     1 #BEF4BE      1
    ## 57 Plantain             Tolima       Low Knowledge     1 #59C981      1
    ## 58 Plantain             Tolima                <NA>     1 #59C981      1
    ##    vColorValue level        x0         y0          w          h   color
    ## 1           NA     3 0.8015726 0.41025641 0.19842738 0.58974359 #FFDA00
    ## 2           NA     2 0.8015726 0.41025641 0.19842738 0.58974359 #FFDA00
    ## 3           NA     3 0.8444149 0.27350427 0.07779255 0.13675214 #FFE033
    ## 4           NA     2 0.8444149 0.27350427 0.07779255 0.13675214 #FFE033
    ## 5           NA     2 0.9222074 0.27350427 0.07779255 0.13675214 #FFE566
    ## 6           NA     3 0.9222074 0.27350427 0.07779255 0.13675214 #FFE566
    ## 7           NA     3 0.5851064 0.00000000 0.25930851 0.08205128 #FFEB99
    ## 8           NA     2 0.5851064 0.00000000 0.25930851 0.08205128 #FFEB99
    ## 9           NA     2 0.8444149 0.13675214 0.07779255 0.13675214 #FFF2CC
    ## 10          NA     3 0.8444149 0.13675214 0.07779255 0.13675214 #FFF2CC
    ## 11          NA     3 0.9222074 0.13675214 0.07779255 0.13675214 #FFE033
    ## 12          NA     2 0.9222074 0.13675214 0.07779255 0.13675214 #FFE033
    ## 13          NA     3 0.5851064 0.08205128 0.25930851 0.32820513 #FFDA00
    ## 14          NA     2 0.5851064 0.08205128 0.25930851 0.32820513 #FFDA00
    ## 15          NA     3 0.5851064 0.41025641 0.21646623 0.58974359 #FFE033
    ## 16          NA     2 0.5851064 0.41025641 0.21646623 0.58974359 #FFE033
    ## 17          NA     1 0.5851064 0.00000000 0.41489362 1.00000000 #FFE033
    ## 18          NA     3 0.8444149 0.00000000 0.07779255 0.13675214 #FFE033
    ## 19          NA     2 0.8444149 0.00000000 0.07779255 0.13675214 #FFE033
    ## 20          NA     3 0.9222074 0.00000000 0.07779255 0.13675214 #FFE033
    ## 21          NA     2 0.9222074 0.00000000 0.07779255 0.13675214 #FFE033
    ## 22          NA     3 0.5033772 0.37603306 0.08172915 0.26033058 #28B463
    ## 23          NA     2 0.5033772 0.37603306 0.08172915 0.26033058 #28B463
    ## 24          NA     3 0.2173252 0.18801653 0.11316343 0.18801653 #59C981
    ## 25          NA     2 0.2173252 0.18801653 0.11316343 0.18801653 #59C981
    ## 26          NA     2 0.3304887 0.25068871 0.08487257 0.12534435 #BEF4BE
    ## 27          NA     3 0.3304887 0.25068871 0.08487257 0.12534435 #BEF4BE
    ## 28          NA     2 0.3304887 0.12534435 0.08487257 0.12534435 #BEF4BE
    ## 29          NA     3 0.3304887 0.12534435 0.08487257 0.12534435 #BEF4BE
    ## 30          NA     3 0.0000000 0.29370629 0.21732523 0.34265734 #59C981
    ## 31          NA     2 0.0000000 0.29370629 0.21732523 0.34265734 #59C981
    ## 32          NA     3 0.2173252 0.00000000 0.11316343 0.18801653 #59C981
    ## 33          NA     2 0.2173252 0.00000000 0.11316343 0.18801653 #59C981
    ## 34          NA     3 0.3304887 0.00000000 0.08487257 0.12534435 #28B463
    ## 35          NA     2 0.3304887 0.00000000 0.08487257 0.12534435 #28B463
    ## 36          NA     3 0.4153612 0.25068871 0.08487257 0.12534435 #59C981
    ## 37          NA     2 0.4153612 0.25068871 0.08487257 0.12534435 #59C981
    ## 38          NA     3 0.5002338 0.25068871 0.08487257 0.12534435 #59C981
    ## 39          NA     2 0.5002338 0.25068871 0.08487257 0.12534435 #59C981
    ## 40          NA     3 0.2173252 0.37603306 0.16345829 0.26033058 #59C981
    ## 41          NA     2 0.2173252 0.37603306 0.16345829 0.26033058 #59C981
    ## 42          NA     3 0.3807835 0.37603306 0.12259372 0.26033058 #59C981
    ## 43          NA     2 0.3807835 0.37603306 0.12259372 0.26033058 #59C981
    ## 44          NA     3 0.0000000 0.63636364 0.29255319 0.36363636 #8CDE9F
    ## 45          NA     2 0.0000000 0.63636364 0.29255319 0.36363636 #8CDE9F
    ## 46          NA     1 0.0000000 0.00000000 0.58510638 1.00000000 #59C981
    ## 47          NA     3 0.4153612 0.12534435 0.08487257 0.12534435 #8CDE9F
    ## 48          NA     2 0.4153612 0.12534435 0.08487257 0.12534435 #8CDE9F
    ## 49          NA     3 0.0000000 0.00000000 0.21732523 0.29370629 #59C981
    ## 50          NA     2 0.0000000 0.00000000 0.21732523 0.29370629 #59C981
    ## 51          NA     3 0.2925532 0.63636364 0.29255319 0.36363636 #59C981
    ## 52          NA     2 0.2925532 0.63636364 0.29255319 0.36363636 #59C981
    ## 53          NA     3 0.4153612 0.00000000 0.08487257 0.12534435 #59C981
    ## 54          NA     2 0.4153612 0.00000000 0.08487257 0.12534435 #59C981
    ## 55          NA     2 0.5002338 0.12534435 0.08487257 0.12534435 #BEF4BE
    ## 56          NA     3 0.5002338 0.12534435 0.08487257 0.12534435 #BEF4BE
    ## 57          NA     3 0.5002338 0.00000000 0.08487257 0.12534435 #59C981
    ## 58          NA     2 0.5002338 0.00000000 0.08487257 0.12534435 #59C981
    ## 
    ## $type
    ## [1] "color"
    ## 
    ## $vSize
    ## [1] "frequency"
    ## 
    ## $vColor
    ## [1] "group_color"
    ## 
    ## $stdErr
    ## [1] "frequency"
    ## 
    ## $algorithm
    ## [1] "pivotSize"
    ## 
    ## $vpCoorX
    ## [1] 0.02812148 0.97187852
    ## 
    ## $vpCoorY
    ## [1] 0.01968504 0.91031496
    ## 
    ## $aspRatio
    ## [1] 1.483512
    ## 
    ## $range
    ## [1] NA NA
    ## 
    ## $mapping
    ## [1] NA NA NA
    ## 
    ## $draw
    ## [1] TRUE

``` r
#Map of Colombia  
  #non weighted
  nal_q6_no_weight<- question_6 %>%
  group_by(expert_in) %>%
  summarise(average= mean(as.numeric(numeric_answer))) %>% 
  group_by(average) %>%
  mutate(cat= category_by_mean_by_question(language = "en", mean = average, question =6)) %>%
  rename(EKE.expert.in=expert_in)
```

    ## Warning: There was 1 warning in `mutate()`.
    ## ℹ In argument: `cat = category_by_mean_by_question(...)`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length

``` r
  nal_q6_no_weight<- full_join(codes_department, nal_q6_no_weight)
```

    ## Joining with `by = join_by(EKE.expert.in)`

``` r
  nal_q6_no_weight$cat<- factor(nal_q6_no_weight$cat, levels = c("Very Low Knowledge","Low Knowledge", "Moderate Knowledge", "High Knowledge", "Very High Knowledge", NA))
  colmap(departamentos, data = nal_q6_no_weight, data_id = "id_depto", var = "cat")+
    scale_fill_manual(values = palette_soil(length(unique(nal_q6_no_weight$cat))-1), na.value = "#eeeeee")
```

    ## Scale for fill is already present.
    ## Adding another scale for fill, which will replace the existing scale.

![](README_files/figure-gfm/question_6-3.png)<!-- -->

``` r
# weighted
  nal_q6_weight<- inner_join(question_6, experience_of_each_expert)
```

    ## Joining with `by = join_by(crop, expert_ID, expert_in)`

``` r
  nal_q6_weight<- nal_q6_weight %>%
  group_by(expert_in) %>%
  mutate(numeric_answer=as.numeric(numeric_answer)) %>%
  summarise(average_weighted= weighted.mean(numeric_answer, weights)) %>% 
  group_by(average_weighted) %>%
  mutate(cat_weighted= category_by_mean_by_question(language = "en", mean = average_weighted, question =6)) %>%
  rename(EKE.expert.in=expert_in)
```

    ## Warning: There was 1 warning in `mutate()`.
    ## ℹ In argument: `cat_weighted = category_by_mean_by_question(...)`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length

``` r
  nal_q6_weight<- full_join(codes_department, nal_q6_weight)
```

    ## Joining with `by = join_by(EKE.expert.in)`

``` r
  nal_q6_weight$cat_weighted<- factor(nal_q6_weight$cat_weighted, levels = c("Very Low Knowledge","Low Knowledge", "Moderate Knowledge", "High Knowledge", "Very High Knowledge", NA))
  colmap(departamentos, data = nal_q6_weight, data_id = "id_depto", var = "cat_weighted")+
    scale_fill_manual(values = palette_soil(length(unique(nal_q6_weight$cat))-1), na.value = "#eeeeee")
```

    ## Scale for fill is already present.
    ## Adding another scale for fill, which will replace the existing scale.

![](README_files/figure-gfm/question_6-4.png)<!-- -->

## Question 7: What is the likelihood of each region reporting an outbreak of a pest or disease in banana plantations?

``` r
#selecting only question 7----
question_7<- filter(individual_surveys, question_number==7)
#some experts selected more than one option in this question so an intermediate answer is chosen 
question_7 <- question_7 %>%
  mutate(answer_in_english = case_when(
    answer_in_english == "Somewhat Likely,Likely" ~ "Likely",
    answer_in_english == "Extremely Unlikely,Unlikely" ~ "Very Unlikely",
    TRUE ~ answer_in_english  # This keeps all other values as they are
  ))
#some experts selected more than one option in this question so an intermediate answer is chosen 
question_7 <- question_7 %>%
  mutate(numeric_answer = case_when(
    numeric_answer == "1,3" ~ "2",
    numeric_answer == "6,7" ~ "6.5",
    TRUE ~ numeric_answer  # This keeps all other values as they are
  ))
#organizing the order of the levels
question_7$answer_in_english<- factor(question_7$answer_in_english,levels = c("Extremely Unlikely", "Very Unlikely", "Somewhat Unlikely", 
                                                                              "Unlikely", "Neutral", "Somewhat Likely", "Likely", 
                                                                              "Very Likely", "Extremely Likely"))
#average by department (weighted and no weighted)
#not weighted 
avg_dept_no_weight_7<- question_7 %>%
  group_by(crop, expert_in) %>%
  mutate(numeric_answer=as.numeric(numeric_answer))%>%
  mutate(average= mean(numeric_answer)) %>%
  group_by(average)%>%
  mutate(ave_cat= category_by_mean_by_question(7, mean =average, language = "en"))
```

    ## Warning: There were 12 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `ave_cat = category_by_mean_by_question(7, mean = average,
    ##   language = "en")`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 11 remaining warnings.

``` r
#weighted 
add_weights_question_7<- inner_join(question_7, experience_of_each_expert)
```

    ## Joining with `by = join_by(crop, expert_ID, expert_in)`

``` r
avg_dept_weight_7<- add_weights_question_7 %>%
  group_by(crop, expert_in) %>%
  mutate(numeric_answer=as.numeric(numeric_answer))%>%
  mutate(average_weighted= weighted.mean(numeric_answer, weights)) %>% 
  group_by(average_weighted)%>%
  mutate(ave_cat_weighted= category_by_mean_by_question(7, mean =average_weighted, language = "en"))
```

    ## Warning: There were 9 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `ave_cat_weighted = category_by_mean_by_question(7, mean =
    ##   average_weighted, language = "en")`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 8 remaining warnings.

``` r
#finding the levels per crop (banana and plantain) no weighted
levels_per_crop_Q7_no_weighted<- tapply(avg_dept_no_weight_7$ave_cat, avg_dept_no_weight_7$crop, function(x){(unique(x))})
#generating a ramp palette according to the number of levels per crop
colors_banana_question7_no_weighted<- palette_banana(length(levels_per_crop_Q7_no_weighted$Banana))
colors_plantain_question7_no_weighted<- palette_plantain(length(levels_per_crop_Q7_no_weighted$Plantain))
#Assigning the colors by crop and answer
# Define the knowledge levels for each crop
levels_by_crop_no_weighted_7 <- list(
  Banana = levels_per_crop_Q7_no_weighted$Banana,
  Plantain = levels_per_crop_Q7_no_weighted$Plantain
)
# Define the colors for each crop
colors_by_crop_no_weighted_7 <- list(
  Banana = colors_banana_question7_no_weighted, # Replace with actual color vector for Banana
  Plantain = colors_plantain_question7_no_weighted # Replace with actual color vector for Plantain
  # Add more crops and their color vectors here if needed
)
# Now call the function
avg_dept_no_weight_7 <- assign_group_color(data = avg_dept_no_weight_7, levels_by_crop = levels_by_crop_no_weighted_7, colors_by_crop = colors_by_crop_no_weighted_7,answer_col =  "ave_cat")

#finding the levels per crop (banana and plantain) weighted
levels_per_crop_Q7_weighted<- tapply(avg_dept_weight_7$ave_cat_weighted, avg_dept_weight_7$crop, function(x){(unique(x))})
#generating a ramp palette according to the number of levels per crop
colors_banana_question7_weighted<- palette_banana(length(levels_per_crop_Q7_weighted$Banana))
colors_plantain_question7_weighted<- palette_plantain(length(levels_per_crop_Q7_weighted$Plantain))
#Assigning the colors by crop and answer
# Define the knowledge levels for each crop
levels_by_crop_weighted_7 <- list(
  Banana = levels_per_crop_Q7_weighted$Banana,
  Plantain = levels_per_crop_Q7_weighted$Plantain
)
# Define the colors for each crop
colors_by_crop_weighted_7 <- list(
  Banana = colors_banana_question7_weighted, # Replace with actual color vector for Banana
  Plantain = colors_plantain_question7_weighted # Replace with actual color vector for Plantain
  # Add more crops and their color vectors here if needed
)
# Now call the function
avg_dept_weight_7 <- assign_group_color(data = avg_dept_weight_7, levels_by_crop = levels_by_crop_weighted_7, colors_by_crop = colors_by_crop_weighted_7,answer_col =  "ave_cat_weighted")

#tree map
tree_map_3(data = avg_dept_no_weight_7, "crop", "expert_in", "ave_cat", "group_color", title="No weighted")
```

    ## `summarise()` has grouped output by 'crop', 'expert_in', 'ave_cat'. You can
    ## override using the `.groups` argument.

![](README_files/figure-gfm/question_7-1.png)<!-- -->

    ## $tm
    ##        crop          expert_in           ave_cat vSize  vColor stdErr
    ## 1    Banana          Antioquia              <NA>    11 #FFE033     11
    ## 2    Banana          Antioquia   Somewhat Likely    11 #FFE033     11
    ## 3    Banana             Arauca            Likely     1 #FFDA00      1
    ## 4    Banana             Arauca              <NA>     1 #FFDA00      1
    ## 5    Banana          Atlántico            Likely     1 #FFDA00      1
    ## 6    Banana          Atlántico              <NA>     1 #FFDA00      1
    ## 7    Banana            Bolívar            Likely     1 #FFDA00      1
    ## 8    Banana            Bolívar              <NA>     1 #FFDA00      1
    ## 9    Banana             Caldas              <NA>     2 #FFE033      2
    ## 10   Banana             Caldas   Somewhat Likely     2 #FFE033      2
    ## 11   Banana           Casanare            Likely     1 #FFDA00      1
    ## 12   Banana           Casanare              <NA>     1 #FFDA00      1
    ## 13   Banana              Cesar              <NA>     2 #FFE566      2
    ## 14   Banana              Cesar       Very Likely     2 #FFE566      2
    ## 15   Banana              Chocó              <NA>     3 #FFEB99      3
    ## 16   Banana              Chocó           Neutral     3 #FFEB99      3
    ## 17   Banana            Córdoba              <NA>     2 #FFEB99      2
    ## 18   Banana            Córdoba           Neutral     2 #FFEB99      2
    ## 19   Banana              Huila              <NA>     1 #FFF2CC      1
    ## 20   Banana              Huila Somewhat Unlikely     1 #FFF2CC      1
    ## 21   Banana         La Guajira            Likely    10 #FFDA00     10
    ## 22   Banana         La Guajira              <NA>    10 #FFDA00     10
    ## 23   Banana          Magdalena              <NA>    13 #FFE033     13
    ## 24   Banana          Magdalena   Somewhat Likely    13 #FFE033     13
    ## 25   Banana               Meta            Likely     1 #FFDA00      1
    ## 26   Banana               Meta              <NA>     1 #FFDA00      1
    ## 27   Banana               <NA>              <NA>    54 #FFDA00     54
    ## 28   Banana            Quindío              <NA>     2 #FFE033      2
    ## 29   Banana            Quindío   Somewhat Likely     2 #FFE033      2
    ## 30   Banana          Risaralda              <NA>     2 #FFE033      2
    ## 31   Banana          Risaralda   Somewhat Likely     2 #FFE033      2
    ## 32   Banana              Sucre            Likely     1 #FFDA00      1
    ## 33   Banana              Sucre              <NA>     1 #FFDA00      1
    ## 34 Plantain          Antioquia              <NA>     3 #28B463      3
    ## 35 Plantain          Antioquia   Somewhat Likely     3 #28B463      3
    ## 36 Plantain             Arauca              <NA>     2 #28B463      2
    ## 37 Plantain             Arauca   Somewhat Likely     2 #28B463      2
    ## 38 Plantain          Atlántico              <NA>     1 #82DA99      1
    ## 39 Plantain          Atlántico          Unlikely     1 #82DA99      1
    ## 40 Plantain            Bolívar              <NA>     1 #82DA99      1
    ## 41 Plantain            Bolívar          Unlikely     1 #82DA99      1
    ## 42 Plantain             Caldas              <NA>     7 #64CD87      7
    ## 43 Plantain             Caldas Somewhat Unlikely     7 #64CD87      7
    ## 44 Plantain           Casanare              <NA>     3 #A0E7AB      3
    ## 45 Plantain           Casanare           Neutral     3 #A0E7AB      3
    ## 46 Plantain              Chocó              <NA>     1 #82DA99      1
    ## 47 Plantain              Chocó          Unlikely     1 #82DA99      1
    ## 48 Plantain            Córdoba              <NA>     1 #82DA99      1
    ## 49 Plantain            Córdoba          Unlikely     1 #82DA99      1
    ## 50 Plantain              Huila              <NA>     1 #82DA99      1
    ## 51 Plantain              Huila          Unlikely     1 #82DA99      1
    ## 52 Plantain         La Guajira            Likely     4 #46C075      4
    ## 53 Plantain         La Guajira              <NA>     4 #46C075      4
    ## 54 Plantain          Magdalena            Likely     3 #46C075      3
    ## 55 Plantain          Magdalena              <NA>     3 #46C075      3
    ## 56 Plantain               Meta              <NA>    10 #A0E7AB     10
    ## 57 Plantain               Meta           Neutral    10 #A0E7AB     10
    ## 58 Plantain               <NA>              <NA>    55 #82DA99     55
    ## 59 Plantain Norte De Santander              <NA>     1 #82DA99      1
    ## 60 Plantain Norte De Santander          Unlikely     1 #82DA99      1
    ## 61 Plantain            Quindío              <NA>     5 #64CD87      5
    ## 62 Plantain            Quindío Somewhat Unlikely     5 #64CD87      5
    ## 63 Plantain          Risaralda              <NA>     9 #64CD87      9
    ## 64 Plantain          Risaralda Somewhat Unlikely     9 #64CD87      9
    ## 65 Plantain          Santander              <NA>     1 #82DA99      1
    ## 66 Plantain          Santander          Unlikely     1 #82DA99      1
    ## 67 Plantain              Sucre              <NA>     1 #BEF4BE      1
    ## 68 Plantain              Sucre     Very Unlikely     1 #BEF4BE      1
    ## 69 Plantain             Tolima              <NA>     1 #82DA99      1
    ## 70 Plantain             Tolima          Unlikely     1 #82DA99      1
    ##    vColorValue level        x0         y0          w          h   color
    ## 1           NA     2 0.7729358 0.55555556 0.22706422 0.44444444 #FFE033
    ## 2           NA     3 0.7729358 0.55555556 0.22706422 0.44444444 #FFE033
    ## 3           NA     3 0.7522936 0.12962963 0.07077326 0.12962963 #FFDA00
    ## 4           NA     2 0.7522936 0.12962963 0.07077326 0.12962963 #FFDA00
    ## 5           NA     3 0.7522936 0.00000000 0.07077326 0.12962963 #FFDA00
    ## 6           NA     2 0.7522936 0.00000000 0.07077326 0.12962963 #FFDA00
    ## 7           NA     3 0.8230668 0.12962963 0.07077326 0.12962963 #FFDA00
    ## 8           NA     2 0.8230668 0.12962963 0.07077326 0.12962963 #FFDA00
    ## 9           NA     2 0.6532110 0.00000000 0.09908257 0.18518519 #FFE033
    ## 10          NA     3 0.6532110 0.00000000 0.09908257 0.18518519 #FFE033
    ## 11          NA     3 0.8230668 0.00000000 0.07077326 0.12962963 #FFDA00
    ## 12          NA     2 0.8230668 0.00000000 0.07077326 0.12962963 #FFDA00
    ## 13          NA     2 0.7522936 0.40740741 0.12385321 0.14814815 #FFE566
    ## 14          NA     3 0.7522936 0.40740741 0.12385321 0.14814815 #FFE566
    ## 15          NA     2 0.5045872 0.00000000 0.14862385 0.18518519 #FFEB99
    ## 16          NA     3 0.5045872 0.00000000 0.14862385 0.18518519 #FFEB99
    ## 17          NA     2 0.8761468 0.40740741 0.12385321 0.14814815 #FFEB99
    ## 18          NA     3 0.8761468 0.40740741 0.12385321 0.14814815 #FFEB99
    ## 19          NA     2 0.8938401 0.17283951 0.10615990 0.08641975 #FFF2CC
    ## 20          NA     3 0.8938401 0.17283951 0.10615990 0.08641975 #FFF2CC
    ## 21          NA     3 0.5045872 0.18518519 0.24770642 0.37037037 #FFDA00
    ## 22          NA     2 0.5045872 0.18518519 0.24770642 0.37037037 #FFDA00
    ## 23          NA     2 0.5045872 0.55555556 0.26834862 0.44444444 #FFE033
    ## 24          NA     3 0.5045872 0.55555556 0.26834862 0.44444444 #FFE033
    ## 25          NA     3 0.8938401 0.08641975 0.10615990 0.08641975 #FFDA00
    ## 26          NA     2 0.8938401 0.08641975 0.10615990 0.08641975 #FFDA00
    ## 27          NA     1 0.5045872 0.00000000 0.49541284 1.00000000 #FFDA00
    ## 28          NA     2 0.7522936 0.25925926 0.12385321 0.14814815 #FFE033
    ## 29          NA     3 0.7522936 0.25925926 0.12385321 0.14814815 #FFE033
    ## 30          NA     2 0.8761468 0.25925926 0.12385321 0.14814815 #FFE033
    ## 31          NA     3 0.8761468 0.25925926 0.12385321 0.14814815 #FFE033
    ## 32          NA     3 0.8938401 0.00000000 0.10615990 0.08641975 #FFDA00
    ## 33          NA     2 0.8938401 0.00000000 0.10615990 0.08641975 #FFDA00
    ## 34          NA     2 0.2242610 0.45818182 0.14016310 0.19636364 #28B463
    ## 35          NA     3 0.2242610 0.45818182 0.14016310 0.19636364 #28B463
    ## 36          NA     2 0.3644241 0.26181818 0.09344207 0.19636364 #28B463
    ## 37          NA     3 0.3644241 0.26181818 0.09344207 0.19636364 #28B463
    ## 38          NA     2 0.4578661 0.26181818 0.04672103 0.19636364 #82DA99
    ## 39          NA     3 0.4578661 0.26181818 0.04672103 0.19636364 #82DA99
    ## 40          NA     2 0.2242610 0.13090909 0.07008155 0.13090909 #82DA99
    ## 41          NA     3 0.2242610 0.13090909 0.07008155 0.13090909 #82DA99
    ## 42          NA     2 0.0000000 0.36818182 0.22426096 0.28636364 #64CD87
    ## 43          NA     3 0.0000000 0.36818182 0.22426096 0.28636364 #64CD87
    ## 44          NA     2 0.3644241 0.45818182 0.14016310 0.19636364 #A0E7AB
    ## 45          NA     3 0.3644241 0.45818182 0.14016310 0.19636364 #A0E7AB
    ## 46          NA     2 0.2242610 0.00000000 0.07008155 0.13090909 #82DA99
    ## 47          NA     3 0.2242610 0.00000000 0.07008155 0.13090909 #82DA99
    ## 48          NA     2 0.2943425 0.13090909 0.07008155 0.13090909 #82DA99
    ## 49          NA     3 0.2943425 0.13090909 0.07008155 0.13090909 #82DA99
    ## 50          NA     2 0.2943425 0.00000000 0.07008155 0.13090909 #82DA99
    ## 51          NA     3 0.2943425 0.00000000 0.07008155 0.13090909 #82DA99
    ## 52          NA     3 0.0000000 0.00000000 0.22426096 0.16363636 #46C075
    ## 53          NA     2 0.0000000 0.00000000 0.22426096 0.16363636 #46C075
    ## 54          NA     3 0.2242610 0.26181818 0.14016310 0.19636364 #46C075
    ## 55          NA     2 0.2242610 0.26181818 0.14016310 0.19636364 #46C075
    ## 56          NA     2 0.0000000 0.65454545 0.26557219 0.34545455 #A0E7AB
    ## 57          NA     3 0.0000000 0.65454545 0.26557219 0.34545455 #A0E7AB
    ## 58          NA     1 0.0000000 0.00000000 0.50458716 1.00000000 #82DA99
    ## 59          NA     2 0.3644241 0.13090909 0.07008155 0.13090909 #82DA99
    ## 60          NA     3 0.3644241 0.13090909 0.07008155 0.13090909 #82DA99
    ## 61          NA     2 0.0000000 0.16363636 0.22426096 0.20454545 #64CD87
    ## 62          NA     3 0.0000000 0.16363636 0.22426096 0.20454545 #64CD87
    ## 63          NA     2 0.2655722 0.65454545 0.23901497 0.34545455 #64CD87
    ## 64          NA     3 0.2655722 0.65454545 0.23901497 0.34545455 #64CD87
    ## 65          NA     2 0.4345056 0.13090909 0.07008155 0.13090909 #82DA99
    ## 66          NA     3 0.4345056 0.13090909 0.07008155 0.13090909 #82DA99
    ## 67          NA     2 0.3644241 0.00000000 0.07008155 0.13090909 #BEF4BE
    ## 68          NA     3 0.3644241 0.00000000 0.07008155 0.13090909 #BEF4BE
    ## 69          NA     2 0.4345056 0.00000000 0.07008155 0.13090909 #82DA99
    ## 70          NA     3 0.4345056 0.00000000 0.07008155 0.13090909 #82DA99
    ## 
    ## $type
    ## [1] "color"
    ## 
    ## $vSize
    ## [1] "frequency"
    ## 
    ## $vColor
    ## [1] "group_color"
    ## 
    ## $stdErr
    ## [1] "frequency"
    ## 
    ## $algorithm
    ## [1] "pivotSize"
    ## 
    ## $vpCoorX
    ## [1] 0.02812148 0.97187852
    ## 
    ## $vpCoorY
    ## [1] 0.01968504 0.91031496
    ## 
    ## $aspRatio
    ## [1] 1.483512
    ## 
    ## $range
    ## [1] NA NA
    ## 
    ## $mapping
    ## [1] NA NA NA
    ## 
    ## $draw
    ## [1] TRUE

``` r
tree_map_3(data = avg_dept_weight_7, "crop", "expert_in", "ave_cat_weighted", "group_color", title="weighted")
```

    ## `summarise()` has grouped output by 'crop', 'expert_in', 'ave_cat_weighted'.
    ## You can override using the `.groups` argument.

![](README_files/figure-gfm/question_7-2.png)<!-- -->

    ## $tm
    ##        crop          expert_in  ave_cat_weighted vSize  vColor stdErr
    ## 1    Banana          Antioquia            Likely    11 #FFDA00     11
    ## 2    Banana          Antioquia              <NA>    11 #FFDA00     11
    ## 3    Banana             Caldas              <NA>     1 #FFEB99      1
    ## 4    Banana             Caldas Somewhat Unlikely     1 #FFEB99      1
    ## 5    Banana              Cesar              <NA>     1 #FFE566      1
    ## 6    Banana              Cesar       Very Likely     1 #FFE566      1
    ## 7    Banana              Chocó              <NA>     2 #FFEB99      2
    ## 8    Banana              Chocó Somewhat Unlikely     2 #FFEB99      2
    ## 9    Banana            Córdoba              <NA>     1 #FFF2CC      1
    ## 10   Banana            Córdoba          Unlikely     1 #FFF2CC      1
    ## 11   Banana              Huila              <NA>     1 #FFEB99      1
    ## 12   Banana              Huila Somewhat Unlikely     1 #FFEB99      1
    ## 13   Banana         La Guajira            Likely     9 #FFDA00      9
    ## 14   Banana         La Guajira              <NA>     9 #FFDA00      9
    ## 15   Banana          Magdalena              <NA>    12 #FFE033     12
    ## 16   Banana          Magdalena   Somewhat Likely    12 #FFE033     12
    ## 17   Banana               <NA>              <NA>    40 #FFEB99     40
    ## 18   Banana            Quindío              <NA>     1 #FFEB99      1
    ## 19   Banana            Quindío Somewhat Unlikely     1 #FFEB99      1
    ## 20   Banana          Risaralda              <NA>     1 #FFEB99      1
    ## 21   Banana          Risaralda Somewhat Unlikely     1 #FFEB99      1
    ## 22 Plantain          Antioquia              <NA>     3 #28B463      3
    ## 23 Plantain          Antioquia   Somewhat Likely     3 #28B463      3
    ## 24 Plantain             Arauca              <NA>     2 #28B463      2
    ## 25 Plantain             Arauca   Somewhat Likely     2 #28B463      2
    ## 26 Plantain          Atlántico              <NA>     1 #82DA99      1
    ## 27 Plantain          Atlántico          Unlikely     1 #82DA99      1
    ## 28 Plantain            Bolívar              <NA>     1 #82DA99      1
    ## 29 Plantain            Bolívar          Unlikely     1 #82DA99      1
    ## 30 Plantain             Caldas              <NA>     7 #64CD87      7
    ## 31 Plantain             Caldas Somewhat Unlikely     7 #64CD87      7
    ## 32 Plantain           Casanare              <NA>     3 #A0E7AB      3
    ## 33 Plantain           Casanare           Neutral     3 #A0E7AB      3
    ## 34 Plantain              Chocó              <NA>     1 #82DA99      1
    ## 35 Plantain              Chocó          Unlikely     1 #82DA99      1
    ## 36 Plantain            Córdoba              <NA>     1 #82DA99      1
    ## 37 Plantain            Córdoba          Unlikely     1 #82DA99      1
    ## 38 Plantain              Huila              <NA>     1 #82DA99      1
    ## 39 Plantain              Huila          Unlikely     1 #82DA99      1
    ## 40 Plantain         La Guajira            Likely     4 #46C075      4
    ## 41 Plantain         La Guajira              <NA>     4 #46C075      4
    ## 42 Plantain          Magdalena            Likely     3 #46C075      3
    ## 43 Plantain          Magdalena              <NA>     3 #46C075      3
    ## 44 Plantain               Meta              <NA>    10 #28B463     10
    ## 45 Plantain               Meta   Somewhat Likely    10 #28B463     10
    ## 46 Plantain               <NA>              <NA>    55 #82DA99     55
    ## 47 Plantain Norte De Santander              <NA>     1 #82DA99      1
    ## 48 Plantain Norte De Santander          Unlikely     1 #82DA99      1
    ## 49 Plantain            Quindío              <NA>     5 #64CD87      5
    ## 50 Plantain            Quindío Somewhat Unlikely     5 #64CD87      5
    ## 51 Plantain          Risaralda              <NA>     9 #64CD87      9
    ## 52 Plantain          Risaralda Somewhat Unlikely     9 #64CD87      9
    ## 53 Plantain          Santander              <NA>     1 #82DA99      1
    ## 54 Plantain          Santander          Unlikely     1 #82DA99      1
    ## 55 Plantain              Sucre              <NA>     1 #BEF4BE      1
    ## 56 Plantain              Sucre     Very Unlikely     1 #BEF4BE      1
    ## 57 Plantain             Tolima              <NA>     1 #82DA99      1
    ## 58 Plantain             Tolima          Unlikely     1 #82DA99      1
    ##    vColorValue level        x0         y0          w          h   color
    ## 1           NA     3 0.7986270 0.42500000 0.20137300 0.57500000 #FFDA00
    ## 2           NA     2 0.7986270 0.42500000 0.20137300 0.57500000 #FFDA00
    ## 3           NA     2 0.8513932 0.28333333 0.07430341 0.14166667 #FFEB99
    ## 4           NA     3 0.8513932 0.28333333 0.07430341 0.14166667 #FFEB99
    ## 5           NA     2 0.9256966 0.28333333 0.07430341 0.14166667 #FFE566
    ## 6           NA     3 0.9256966 0.28333333 0.07430341 0.14166667 #FFE566
    ## 7           NA     2 0.5789474 0.00000000 0.27244582 0.07727273 #FFEB99
    ## 8           NA     3 0.5789474 0.00000000 0.27244582 0.07727273 #FFEB99
    ## 9           NA     2 0.8513932 0.14166667 0.07430341 0.14166667 #FFF2CC
    ## 10          NA     3 0.8513932 0.14166667 0.07430341 0.14166667 #FFF2CC
    ## 11          NA     2 0.9256966 0.14166667 0.07430341 0.14166667 #FFEB99
    ## 12          NA     3 0.9256966 0.14166667 0.07430341 0.14166667 #FFEB99
    ## 13          NA     3 0.5789474 0.07727273 0.27244582 0.34772727 #FFDA00
    ## 14          NA     2 0.5789474 0.07727273 0.27244582 0.34772727 #FFDA00
    ## 15          NA     2 0.5789474 0.42500000 0.21967963 0.57500000 #FFE033
    ## 16          NA     3 0.5789474 0.42500000 0.21967963 0.57500000 #FFE033
    ## 17          NA     1 0.5789474 0.00000000 0.42105263 1.00000000 #FFEB99
    ## 18          NA     2 0.8513932 0.00000000 0.07430341 0.14166667 #FFEB99
    ## 19          NA     3 0.8513932 0.00000000 0.07430341 0.14166667 #FFEB99
    ## 20          NA     2 0.9256966 0.00000000 0.07430341 0.14166667 #FFEB99
    ## 21          NA     3 0.9256966 0.00000000 0.07430341 0.14166667 #FFEB99
    ## 22          NA     2 0.2573099 0.45818182 0.16081871 0.19636364 #28B463
    ## 23          NA     3 0.2573099 0.45818182 0.16081871 0.19636364 #28B463
    ## 24          NA     2 0.2573099 0.07636364 0.13784461 0.15272727 #28B463
    ## 25          NA     3 0.2573099 0.07636364 0.13784461 0.15272727 #28B463
    ## 26          NA     2 0.2573099 0.00000000 0.13784461 0.07636364 #82DA99
    ## 27          NA     3 0.2573099 0.00000000 0.13784461 0.07636364 #82DA99
    ## 28          NA     2 0.3951546 0.34363636 0.09189641 0.11454545 #82DA99
    ## 29          NA     3 0.3951546 0.34363636 0.09189641 0.11454545 #82DA99
    ## 30          NA     2 0.0000000 0.36818182 0.25730994 0.28636364 #64CD87
    ## 31          NA     3 0.0000000 0.36818182 0.25730994 0.28636364 #64CD87
    ## 32          NA     2 0.4181287 0.45818182 0.16081871 0.19636364 #A0E7AB
    ## 33          NA     3 0.4181287 0.45818182 0.16081871 0.19636364 #A0E7AB
    ## 34          NA     2 0.4870510 0.34363636 0.09189641 0.11454545 #82DA99
    ## 35          NA     3 0.4870510 0.34363636 0.09189641 0.11454545 #82DA99
    ## 36          NA     2 0.3951546 0.22909091 0.09189641 0.11454545 #82DA99
    ## 37          NA     3 0.3951546 0.22909091 0.09189641 0.11454545 #82DA99
    ## 38          NA     2 0.4870510 0.22909091 0.09189641 0.11454545 #82DA99
    ## 39          NA     3 0.4870510 0.22909091 0.09189641 0.11454545 #82DA99
    ## 40          NA     3 0.1429500 0.00000000 0.11435997 0.36818182 #46C075
    ## 41          NA     2 0.1429500 0.00000000 0.11435997 0.36818182 #46C075
    ## 42          NA     3 0.2573099 0.22909091 0.13784461 0.22909091 #46C075
    ## 43          NA     2 0.2573099 0.22909091 0.13784461 0.22909091 #46C075
    ## 44          NA     2 0.0000000 0.65454545 0.30470914 0.34545455 #28B463
    ## 45          NA     3 0.0000000 0.65454545 0.30470914 0.34545455 #28B463
    ## 46          NA     1 0.0000000 0.00000000 0.57894737 1.00000000 #82DA99
    ## 47          NA     2 0.3951546 0.11454545 0.09189641 0.11454545 #82DA99
    ## 48          NA     3 0.3951546 0.11454545 0.09189641 0.11454545 #82DA99
    ## 49          NA     2 0.0000000 0.00000000 0.14294997 0.36818182 #64CD87
    ## 50          NA     3 0.0000000 0.00000000 0.14294997 0.36818182 #64CD87
    ## 51          NA     2 0.3047091 0.65454545 0.27423823 0.34545455 #64CD87
    ## 52          NA     3 0.3047091 0.65454545 0.27423823 0.34545455 #64CD87
    ## 53          NA     2 0.3951546 0.00000000 0.09189641 0.11454545 #82DA99
    ## 54          NA     3 0.3951546 0.00000000 0.09189641 0.11454545 #82DA99
    ## 55          NA     2 0.4870510 0.11454545 0.09189641 0.11454545 #BEF4BE
    ## 56          NA     3 0.4870510 0.11454545 0.09189641 0.11454545 #BEF4BE
    ## 57          NA     2 0.4870510 0.00000000 0.09189641 0.11454545 #82DA99
    ## 58          NA     3 0.4870510 0.00000000 0.09189641 0.11454545 #82DA99
    ## 
    ## $type
    ## [1] "color"
    ## 
    ## $vSize
    ## [1] "frequency"
    ## 
    ## $vColor
    ## [1] "group_color"
    ## 
    ## $stdErr
    ## [1] "frequency"
    ## 
    ## $algorithm
    ## [1] "pivotSize"
    ## 
    ## $vpCoorX
    ## [1] 0.02812148 0.97187852
    ## 
    ## $vpCoorY
    ## [1] 0.01968504 0.91031496
    ## 
    ## $aspRatio
    ## [1] 1.483512
    ## 
    ## $range
    ## [1] NA NA
    ## 
    ## $mapping
    ## [1] NA NA NA
    ## 
    ## $draw
    ## [1] TRUE

``` r
#Map of Colombia  
#non weighted
nal_q7_no_weight<- question_7 %>% group_by(expert_in) %>%
  summarise(average= mean(as.numeric(numeric_answer))) %>%
  group_by(average) %>% 
  mutate(cat= category_by_mean_by_question(language = "en", mean = average, question =7))%>%
  rename(EKE.expert.in = expert_in)
```

    ## Warning: There was 1 warning in `mutate()`.
    ## ℹ In argument: `cat = category_by_mean_by_question(...)`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length

``` r
nal_q7_no_weight<- full_join(codes_department, nal_q7_no_weight)
```

    ## Joining with `by = join_by(EKE.expert.in)`

``` r
nal_q7_no_weight$cat<- factor(nal_q7_no_weight$cat, levels = c("Extremely Unlikely", "Very Unlikely", "Somewhat Unlikely", 
                                                                        "Unlikely", "Neutral", "Somewhat Likely", "Likely", 
                                                                        "Very Likely", "Extremely Likely"))
colmap(departamentos, data = nal_q7_no_weight, data_id = "id_depto", var = "cat")+
  scale_fill_manual(values = palette_soil(length(unique(nal_q7_no_weight$cat))-1), na.value = "#eeeeee")
```

    ## Scale for fill is already present.
    ## Adding another scale for fill, which will replace the existing scale.

![](README_files/figure-gfm/question_7-3.png)<!-- -->

``` r
# weighted
nal_q7_weight<- inner_join(question_7, experience_of_each_expert)
```

    ## Joining with `by = join_by(crop, expert_ID, expert_in)`

``` r
nal_q7_weight<- nal_q7_weight %>%
  group_by(expert_in) %>%
  mutate(numeric_answer=as.numeric(numeric_answer)) %>%
  summarise(average_weighted= weighted.mean(numeric_answer, weights)) %>% 
  group_by(average_weighted) %>%
  mutate(cat_weighted= category_by_mean_by_question(language = "en", mean = average_weighted, question =7)) %>%
  rename(EKE.expert.in=expert_in)
```

    ## Warning: There was 1 warning in `mutate()`.
    ## ℹ In argument: `cat_weighted = category_by_mean_by_question(...)`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length

``` r
nal_q7_weight<- full_join(codes_department, nal_q7_weight)
```

    ## Joining with `by = join_by(EKE.expert.in)`

``` r
nal_q7_weight$cat_weighted<- factor(nal_q7_weight$cat_weighted, levels = c("Extremely Unlikely", "Very Unlikely", "Somewhat Unlikely", 
                                                                           "Unlikely", "Neutral", "Somewhat Likely", "Likely", 
                                                                           "Very Likely", "Extremely Likely"))
colmap(departamentos, data = nal_q7_weight, data_id = "id_depto", var = "cat_weighted")+
  scale_fill_manual(values = palette_soil(length(unique(nal_q7_weight$cat))-1), na.value = "#eeeeee")
```

    ## Scale for fill is already present.
    ## Adding another scale for fill, which will replace the existing scale.

![](README_files/figure-gfm/question_7-4.png)<!-- -->

## Question 8: What is the perceived effectiveness of the policies implemented by the government to ensure phytosanitary safety in banana production systems?

``` r
#selecting only question 8----
question_8<- filter(individual_surveys, question_number==8)
#some experts selected more than one option in this question so an intermediate answer is chosen 
question_8 <- question_8 %>%
  mutate(answer_in_english = case_when(
    answer_in_english == "Slightly Effective,Moderately Effective" ~ "Moderately Effective",
    TRUE ~ answer_in_english  # This keeps all other values as they are
  ))
#some experts selected more than one option in this question so an intermediate answer is chosen 
question_8 <- question_8 %>%
  mutate(numeric_answer = case_when(
    numeric_answer == "2,3" ~ "2.5",
    TRUE ~ numeric_answer  # This keeps all other values as they are
  ))
#organizing the order of the levels
question_8$answer_in_english<- factor(question_8$answer_in_english,levels = c("Not Effective", "Slightly Effective", "Moderately Effective", "Very Effective", "Extremely Effective"))
#average by department (weighted and no weighted)
#not weighted 
avg_dept_no_weight_8<- question_8 %>%
  group_by(crop, expert_in) %>%
  mutate(numeric_answer=as.numeric(numeric_answer))%>%
  mutate(average= mean(numeric_answer)) %>%
  group_by(average)%>%
  mutate(ave_cat= category_by_mean_by_question(8, mean =average, language = "en"))
```

    ## Warning: There were 6 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `ave_cat = category_by_mean_by_question(8, mean = average,
    ##   language = "en")`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 5 remaining warnings.

``` r
#weighted 
add_weights_question_8<- inner_join(question_8, experience_of_each_expert)
```

    ## Joining with `by = join_by(crop, expert_ID, expert_in)`

``` r
avg_dept_weight_8<- add_weights_question_8 %>%
  group_by(crop, expert_in) %>%
  mutate(numeric_answer=as.numeric(numeric_answer))%>%
  mutate(average_weighted= weighted.mean(numeric_answer, weights)) %>% 
  group_by(average_weighted)%>%
  mutate(ave_cat_weighted= category_by_mean_by_question(8, mean =average_weighted, language = "en"))
```

    ## Warning: There were 9 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `ave_cat_weighted = category_by_mean_by_question(8, mean =
    ##   average_weighted, language = "en")`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 8 remaining warnings.

``` r
#finding the levels per crop (banana and plantain) no weighted
levels_per_crop_Q8_no_weighted<- tapply(avg_dept_no_weight_8$ave_cat, avg_dept_no_weight_8$crop, function(x){(unique(x))})
#generating a ramp palette according to the number of levels per crop
colors_banana_question8_no_weighted<- palette_banana(length(levels_per_crop_Q8_no_weighted$Banana))
colors_plantain_question8_no_weighted<- palette_plantain(length(levels_per_crop_Q8_no_weighted$Plantain))
#Assigning the colors by crop and answer
# Define the knowledge levels for each crop
levels_by_crop_no_weighted_8 <- list(
  Banana = levels_per_crop_Q8_no_weighted$Banana,
  Plantain = levels_per_crop_Q8_no_weighted$Plantain
)
# Define the colors for each crop
colors_by_crop_no_weighted_8 <- list(
  Banana = colors_banana_question8_no_weighted, # Replace with actual color vector for Banana
  Plantain = colors_plantain_question8_no_weighted # Replace with actual color vector for Plantain
  # Add more crops and their color vectors here if needed
)
# Now call the function
avg_dept_no_weight_8 <- assign_group_color(data = avg_dept_no_weight_8, levels_by_crop = levels_by_crop_no_weighted_8, colors_by_crop = colors_by_crop_no_weighted_8,answer_col =  "ave_cat")

#finding the levels per crop (banana and plantain) weighted
levels_per_crop_Q8_weighted<- tapply(avg_dept_weight_8$ave_cat_weighted, avg_dept_weight_8$crop, function(x){(unique(x))})
#generating a ramp palette according to the number of levels per crop
colors_banana_question8_weighted<- palette_banana(length(levels_per_crop_Q8_weighted$Banana))
colors_plantain_question8_weighted<- palette_plantain(length(levels_per_crop_Q8_weighted$Plantain))
#Assigning the colors by crop and answer
# Define the knowledge levels for each crop
levels_by_crop_weighted_8 <- list(
  Banana = levels_per_crop_Q8_weighted$Banana,
  Plantain = levels_per_crop_Q8_weighted$Plantain
)
# Define the colors for each crop
colors_by_crop_weighted_8 <- list(
  Banana = colors_banana_question8_weighted, # Replace with actual color vector for Banana
  Plantain = colors_plantain_question8_weighted # Replace with actual color vector for Plantain
  # Add more crops and their color vectors here if needed
)
# Now call the function
avg_dept_weight_8 <- assign_group_color(data = avg_dept_weight_8, levels_by_crop = levels_by_crop_weighted_8, colors_by_crop = colors_by_crop_weighted_8,answer_col =  "ave_cat_weighted")

#tree map
tree_map_3(data = avg_dept_no_weight_8, "crop", "expert_in", "ave_cat", "group_color", title="No weighted")
```

    ## `summarise()` has grouped output by 'crop', 'expert_in', 'ave_cat'. You can
    ## override using the `.groups` argument.

![](README_files/figure-gfm/question_8-1.png)<!-- -->

    ## $tm
    ##        crop          expert_in              ave_cat vSize  vColor stdErr
    ## 1    Banana          Antioquia Moderately Effective    13 #FFE566     13
    ## 2    Banana          Antioquia                 <NA>    13 #FFE566     13
    ## 3    Banana             Arauca Moderately Effective     1 #FFE566      1
    ## 4    Banana             Arauca                 <NA>     1 #FFE566      1
    ## 5    Banana          Atlántico Moderately Effective     1 #FFE566      1
    ## 6    Banana          Atlántico                 <NA>     1 #FFE566      1
    ## 7    Banana            Bolívar Moderately Effective     1 #FFE566      1
    ## 8    Banana            Bolívar                 <NA>     1 #FFE566      1
    ## 9    Banana             Caldas Moderately Effective     2 #FFE566      2
    ## 10   Banana             Caldas                 <NA>     2 #FFE566      2
    ## 11   Banana           Casanare Moderately Effective     1 #FFE566      1
    ## 12   Banana           Casanare                 <NA>     1 #FFE566      1
    ## 13   Banana              Cesar Moderately Effective     2 #FFE566      2
    ## 14   Banana              Cesar                 <NA>     2 #FFE566      2
    ## 15   Banana              Chocó                 <NA>     3 #FFF2CC      3
    ## 16   Banana              Chocó   Slightly Effective     3 #FFF2CC      3
    ## 17   Banana            Córdoba                 <NA>     2 #FFF2CC      2
    ## 18   Banana            Córdoba   Slightly Effective     2 #FFF2CC      2
    ## 19   Banana              Huila Moderately Effective     1 #FFE566      1
    ## 20   Banana              Huila                 <NA>     1 #FFE566      1
    ## 21   Banana         La Guajira                 <NA>    11 #FFDA00     11
    ## 22   Banana         La Guajira       Very Effective    11 #FFDA00     11
    ## 23   Banana          Magdalena Moderately Effective    13 #FFE566     13
    ## 24   Banana          Magdalena                 <NA>    13 #FFE566     13
    ## 25   Banana               Meta Moderately Effective     1 #FFE566      1
    ## 26   Banana               Meta                 <NA>     1 #FFE566      1
    ## 27   Banana               <NA>                 <NA>    57 #FFE566     57
    ## 28   Banana            Quindío Moderately Effective     2 #FFE566      2
    ## 29   Banana            Quindío                 <NA>     2 #FFE566      2
    ## 30   Banana          Risaralda Moderately Effective     2 #FFE566      2
    ## 31   Banana          Risaralda                 <NA>     2 #FFE566      2
    ## 32   Banana              Sucre Moderately Effective     1 #FFE566      1
    ## 33   Banana              Sucre                 <NA>     1 #FFE566      1
    ## 34 Plantain          Antioquia Moderately Effective     3 #28B463      3
    ## 35 Plantain          Antioquia                 <NA>     3 #28B463      3
    ## 36 Plantain             Arauca Moderately Effective     2 #28B463      2
    ## 37 Plantain             Arauca                 <NA>     2 #28B463      2
    ## 38 Plantain          Atlántico Moderately Effective     1 #28B463      1
    ## 39 Plantain          Atlántico                 <NA>     1 #28B463      1
    ## 40 Plantain            Bolívar Moderately Effective     1 #28B463      1
    ## 41 Plantain            Bolívar                 <NA>     1 #28B463      1
    ## 42 Plantain             Caldas                 <NA>     7 #BEF4BE      7
    ## 43 Plantain             Caldas   Slightly Effective     7 #BEF4BE      7
    ## 44 Plantain           Casanare Moderately Effective     2 #28B463      2
    ## 45 Plantain           Casanare                 <NA>     2 #28B463      2
    ## 46 Plantain            Córdoba Moderately Effective     1 #28B463      1
    ## 47 Plantain            Córdoba                 <NA>     1 #28B463      1
    ## 48 Plantain              Huila Moderately Effective     1 #28B463      1
    ## 49 Plantain              Huila                 <NA>     1 #28B463      1
    ## 50 Plantain         La Guajira Moderately Effective     4 #28B463      4
    ## 51 Plantain         La Guajira                 <NA>     4 #28B463      4
    ## 52 Plantain          Magdalena Moderately Effective     3 #28B463      3
    ## 53 Plantain          Magdalena                 <NA>     3 #28B463      3
    ## 54 Plantain               Meta Moderately Effective    10 #28B463     10
    ## 55 Plantain               Meta                 <NA>    10 #28B463     10
    ## 56 Plantain               <NA>                 <NA>    54 #28B463     54
    ## 57 Plantain Norte De Santander Moderately Effective     1 #28B463      1
    ## 58 Plantain Norte De Santander                 <NA>     1 #28B463      1
    ## 59 Plantain            Quindío Moderately Effective     6 #28B463      6
    ## 60 Plantain            Quindío                 <NA>     6 #28B463      6
    ## 61 Plantain          Risaralda Moderately Effective     9 #28B463      9
    ## 62 Plantain          Risaralda                 <NA>     9 #28B463      9
    ## 63 Plantain          Santander Moderately Effective     1 #28B463      1
    ## 64 Plantain          Santander                 <NA>     1 #28B463      1
    ## 65 Plantain              Sucre Moderately Effective     1 #28B463      1
    ## 66 Plantain              Sucre                 <NA>     1 #28B463      1
    ## 67 Plantain             Tolima Moderately Effective     1 #28B463      1
    ## 68 Plantain             Tolima                 <NA>     1 #28B463      1
    ##    vColorValue level        x0        y0          w         h   color
    ## 1           NA     3 0.0000000 0.5438596 0.25675676 0.4561404 #FFE566
    ## 2           NA     2 0.0000000 0.5438596 0.25675676 0.4561404 #FFE566
    ## 3           NA     3 0.4638187 0.2175439 0.04969486 0.1812865 #FFE566
    ## 4           NA     2 0.4638187 0.2175439 0.04969486 0.1812865 #FFE566
    ## 5           NA     3 0.2650392 0.1087719 0.08282476 0.1087719 #FFE566
    ## 6           NA     2 0.2650392 0.1087719 0.08282476 0.1087719 #FFE566
    ## 7           NA     3 0.2650392 0.0000000 0.08282476 0.1087719 #FFE566
    ## 8           NA     2 0.2650392 0.0000000 0.08282476 0.1087719 #FFE566
    ## 9           NA     3 0.1590235 0.0000000 0.10601569 0.1699561 #FFE566
    ## 10          NA     2 0.1590235 0.0000000 0.10601569 0.1699561 #FFE566
    ## 11          NA     3 0.3478640 0.1087719 0.08282476 0.1087719 #FFE566
    ## 12          NA     2 0.3478640 0.1087719 0.08282476 0.1087719 #FFE566
    ## 13          NA     3 0.2650392 0.3988304 0.12423714 0.1450292 #FFE566
    ## 14          NA     2 0.2650392 0.3988304 0.12423714 0.1450292 #FFE566
    ## 15          NA     2 0.0000000 0.0000000 0.15902354 0.1699561 #FFF2CC
    ## 16          NA     3 0.0000000 0.0000000 0.15902354 0.1699561 #FFF2CC
    ## 17          NA     2 0.3892764 0.3988304 0.12423714 0.1450292 #FFF2CC
    ## 18          NA     3 0.3892764 0.3988304 0.12423714 0.1450292 #FFF2CC
    ## 19          NA     3 0.3478640 0.0000000 0.08282476 0.1087719 #FFE566
    ## 20          NA     2 0.3478640 0.0000000 0.08282476 0.1087719 #FFE566
    ## 21          NA     2 0.0000000 0.1699561 0.26503923 0.3739035 #FFDA00
    ## 22          NA     3 0.0000000 0.1699561 0.26503923 0.3739035 #FFDA00
    ## 23          NA     3 0.2567568 0.5438596 0.25675676 0.4561404 #FFE566
    ## 24          NA     2 0.2567568 0.5438596 0.25675676 0.4561404 #FFE566
    ## 25          NA     3 0.4306888 0.1087719 0.08282476 0.1087719 #FFE566
    ## 26          NA     2 0.4306888 0.1087719 0.08282476 0.1087719 #FFE566
    ## 27          NA     1 0.0000000 0.0000000 0.51351351 1.0000000 #FFE566
    ## 28          NA     3 0.2650392 0.2175439 0.09938971 0.1812865 #FFE566
    ## 29          NA     2 0.2650392 0.2175439 0.09938971 0.1812865 #FFE566
    ## 30          NA     3 0.3644289 0.2175439 0.09938971 0.1812865 #FFE566
    ## 31          NA     2 0.3644289 0.2175439 0.09938971 0.1812865 #FFE566
    ## 32          NA     3 0.4306888 0.0000000 0.08282476 0.1087719 #FFE566
    ## 33          NA     2 0.4306888 0.0000000 0.08282476 0.1087719 #FFE566
    ## 34          NA     3 0.8689465 0.4419192 0.13105350 0.2062290 #28B463
    ## 35          NA     2 0.8689465 0.4419192 0.13105350 0.2062290 #28B463
    ## 36          NA     3 0.6942085 0.1262626 0.14270270 0.1262626 #28B463
    ## 37          NA     2 0.6942085 0.1262626 0.14270270 0.1262626 #28B463
    ## 38          NA     3 0.8369112 0.3314394 0.08154440 0.1104798 #28B463
    ## 39          NA     2 0.8369112 0.3314394 0.08154440 0.1104798 #28B463
    ## 40          NA     3 0.9184556 0.3314394 0.08154440 0.1104798 #28B463
    ## 41          NA     2 0.9184556 0.3314394 0.08154440 0.1104798 #28B463
    ## 42          NA     2 0.5135135 0.2991453 0.18069498 0.3490028 #BEF4BE
    ## 43          NA     3 0.5135135 0.2991453 0.18069498 0.3490028 #BEF4BE
    ## 44          NA     3 0.6942085 0.0000000 0.14270270 0.1262626 #28B463
    ## 45          NA     2 0.6942085 0.0000000 0.14270270 0.1262626 #28B463
    ## 46          NA     3 0.8369112 0.2209596 0.08154440 0.1104798 #28B463
    ## 47          NA     2 0.8369112 0.2209596 0.08154440 0.1104798 #28B463
    ## 48          NA     3 0.9184556 0.2209596 0.08154440 0.1104798 #28B463
    ## 49          NA     2 0.9184556 0.2209596 0.08154440 0.1104798 #28B463
    ## 50          NA     3 0.6942085 0.4419192 0.17473800 0.2062290 #28B463
    ## 51          NA     2 0.6942085 0.4419192 0.17473800 0.2062290 #28B463
    ## 52          NA     3 0.6942085 0.2525253 0.14270270 0.1893939 #28B463
    ## 53          NA     2 0.6942085 0.2525253 0.14270270 0.1893939 #28B463
    ## 54          NA     3 0.5135135 0.6481481 0.25604552 0.3518519 #28B463
    ## 55          NA     2 0.5135135 0.6481481 0.25604552 0.3518519 #28B463
    ## 56          NA     1 0.5135135 0.0000000 0.48648649 1.0000000 #28B463
    ## 57          NA     3 0.8369112 0.1104798 0.08154440 0.1104798 #28B463
    ## 58          NA     2 0.8369112 0.1104798 0.08154440 0.1104798 #28B463
    ## 59          NA     3 0.5135135 0.0000000 0.18069498 0.2991453 #28B463
    ## 60          NA     2 0.5135135 0.0000000 0.18069498 0.2991453 #28B463
    ## 61          NA     3 0.7695590 0.6481481 0.23044097 0.3518519 #28B463
    ## 62          NA     2 0.7695590 0.6481481 0.23044097 0.3518519 #28B463
    ## 63          NA     3 0.8369112 0.0000000 0.08154440 0.1104798 #28B463
    ## 64          NA     2 0.8369112 0.0000000 0.08154440 0.1104798 #28B463
    ## 65          NA     3 0.9184556 0.1104798 0.08154440 0.1104798 #28B463
    ## 66          NA     2 0.9184556 0.1104798 0.08154440 0.1104798 #28B463
    ## 67          NA     3 0.9184556 0.0000000 0.08154440 0.1104798 #28B463
    ## 68          NA     2 0.9184556 0.0000000 0.08154440 0.1104798 #28B463
    ## 
    ## $type
    ## [1] "color"
    ## 
    ## $vSize
    ## [1] "frequency"
    ## 
    ## $vColor
    ## [1] "group_color"
    ## 
    ## $stdErr
    ## [1] "frequency"
    ## 
    ## $algorithm
    ## [1] "pivotSize"
    ## 
    ## $vpCoorX
    ## [1] 0.02812148 0.97187852
    ## 
    ## $vpCoorY
    ## [1] 0.01968504 0.91031496
    ## 
    ## $aspRatio
    ## [1] 1.483512
    ## 
    ## $range
    ## [1] NA NA
    ## 
    ## $mapping
    ## [1] NA NA NA
    ## 
    ## $draw
    ## [1] TRUE

``` r
tree_map_3(data = avg_dept_weight_8, "crop", "expert_in", "ave_cat_weighted", "group_color", title="weighted")
```

    ## `summarise()` has grouped output by 'crop', 'expert_in', 'ave_cat_weighted'.
    ## You can override using the `.groups` argument.

![](README_files/figure-gfm/question_8-2.png)<!-- -->

    ## $tm
    ##        crop          expert_in     ave_cat_weighted vSize  vColor stdErr
    ## 1    Banana          Antioquia Moderately Effective    12 #FFDA00     12
    ## 2    Banana          Antioquia                 <NA>    12 #FFDA00     12
    ## 3    Banana             Caldas Moderately Effective     1 #FFDA00      1
    ## 4    Banana             Caldas                 <NA>     1 #FFDA00      1
    ## 5    Banana              Cesar Moderately Effective     1 #FFDA00      1
    ## 6    Banana              Cesar                 <NA>     1 #FFDA00      1
    ## 7    Banana              Chocó                 <NA>     2 #FFF2CC      2
    ## 8    Banana              Chocó        Not Effective     2 #FFF2CC      2
    ## 9    Banana            Córdoba                 <NA>     1 #FFF2CC      1
    ## 10   Banana            Córdoba        Not Effective     1 #FFF2CC      1
    ## 11   Banana              Huila Moderately Effective     1 #FFDA00      1
    ## 12   Banana              Huila                 <NA>     1 #FFDA00      1
    ## 13   Banana         La Guajira Moderately Effective     9 #FFDA00      9
    ## 14   Banana         La Guajira                 <NA>     9 #FFDA00      9
    ## 15   Banana          Magdalena Moderately Effective    12 #FFDA00     12
    ## 16   Banana          Magdalena                 <NA>    12 #FFDA00     12
    ## 17   Banana               <NA>                 <NA>    41 #FFDA00     41
    ## 18   Banana            Quindío Moderately Effective     1 #FFDA00      1
    ## 19   Banana            Quindío                 <NA>     1 #FFDA00      1
    ## 20   Banana          Risaralda Moderately Effective     1 #FFDA00      1
    ## 21   Banana          Risaralda                 <NA>     1 #FFDA00      1
    ## 22 Plantain          Antioquia Moderately Effective     3 #28B463      3
    ## 23 Plantain          Antioquia                 <NA>     3 #28B463      3
    ## 24 Plantain             Arauca Moderately Effective     2 #28B463      2
    ## 25 Plantain             Arauca                 <NA>     2 #28B463      2
    ## 26 Plantain          Atlántico Moderately Effective     1 #28B463      1
    ## 27 Plantain          Atlántico                 <NA>     1 #28B463      1
    ## 28 Plantain            Bolívar Moderately Effective     1 #28B463      1
    ## 29 Plantain            Bolívar                 <NA>     1 #28B463      1
    ## 30 Plantain             Caldas                 <NA>     7 #BEF4BE      7
    ## 31 Plantain             Caldas   Slightly Effective     7 #BEF4BE      7
    ## 32 Plantain           Casanare Moderately Effective     2 #28B463      2
    ## 33 Plantain           Casanare                 <NA>     2 #28B463      2
    ## 34 Plantain            Córdoba Moderately Effective     1 #28B463      1
    ## 35 Plantain            Córdoba                 <NA>     1 #28B463      1
    ## 36 Plantain              Huila Moderately Effective     1 #28B463      1
    ## 37 Plantain              Huila                 <NA>     1 #28B463      1
    ## 38 Plantain         La Guajira Moderately Effective     4 #28B463      4
    ## 39 Plantain         La Guajira                 <NA>     4 #28B463      4
    ## 40 Plantain          Magdalena Moderately Effective     3 #28B463      3
    ## 41 Plantain          Magdalena                 <NA>     3 #28B463      3
    ## 42 Plantain               Meta Moderately Effective    10 #28B463     10
    ## 43 Plantain               Meta                 <NA>    10 #28B463     10
    ## 44 Plantain               <NA>                 <NA>    54 #28B463     54
    ## 45 Plantain Norte De Santander Moderately Effective     1 #28B463      1
    ## 46 Plantain Norte De Santander                 <NA>     1 #28B463      1
    ## 47 Plantain            Quindío Moderately Effective     6 #28B463      6
    ## 48 Plantain            Quindío                 <NA>     6 #28B463      6
    ## 49 Plantain          Risaralda Moderately Effective     9 #28B463      9
    ## 50 Plantain          Risaralda                 <NA>     9 #28B463      9
    ## 51 Plantain          Santander Moderately Effective     1 #28B463      1
    ## 52 Plantain          Santander                 <NA>     1 #28B463      1
    ## 53 Plantain              Sucre Moderately Effective     1 #28B463      1
    ## 54 Plantain              Sucre                 <NA>     1 #28B463      1
    ## 55 Plantain             Tolima Moderately Effective     1 #28B463      1
    ## 56 Plantain             Tolima                 <NA>     1 #28B463      1
    ##    vColorValue level        x0         y0          w          h   color
    ## 1           NA     3 0.5684211 0.41463415 0.21578947 0.58536585 #FFDA00
    ## 2           NA     2 0.5684211 0.41463415 0.21578947 0.58536585 #FFDA00
    ## 3           NA     3 0.8476780 0.27642276 0.07616099 0.13821138 #FFDA00
    ## 4           NA     2 0.8476780 0.27642276 0.07616099 0.13821138 #FFDA00
    ## 5           NA     3 0.9238390 0.27642276 0.07616099 0.13821138 #FFDA00
    ## 6           NA     2 0.9238390 0.27642276 0.07616099 0.13821138 #FFDA00
    ## 7           NA     2 0.5684211 0.00000000 0.27925697 0.07538803 #FFF2CC
    ## 8           NA     3 0.5684211 0.00000000 0.27925697 0.07538803 #FFF2CC
    ## 9           NA     2 0.8476780 0.13821138 0.07616099 0.13821138 #FFF2CC
    ## 10          NA     3 0.8476780 0.13821138 0.07616099 0.13821138 #FFF2CC
    ## 11          NA     3 0.9238390 0.13821138 0.07616099 0.13821138 #FFDA00
    ## 12          NA     2 0.9238390 0.13821138 0.07616099 0.13821138 #FFDA00
    ## 13          NA     3 0.5684211 0.07538803 0.27925697 0.33924612 #FFDA00
    ## 14          NA     2 0.5684211 0.07538803 0.27925697 0.33924612 #FFDA00
    ## 15          NA     3 0.7842105 0.41463415 0.21578947 0.58536585 #FFDA00
    ## 16          NA     2 0.7842105 0.41463415 0.21578947 0.58536585 #FFDA00
    ## 17          NA     1 0.5684211 0.00000000 0.43157895 1.00000000 #FFDA00
    ## 18          NA     3 0.8476780 0.00000000 0.07616099 0.13821138 #FFDA00
    ## 19          NA     2 0.8476780 0.00000000 0.07616099 0.13821138 #FFDA00
    ## 20          NA     3 0.9238390 0.00000000 0.07616099 0.13821138 #FFDA00
    ## 21          NA     2 0.9238390 0.00000000 0.07616099 0.13821138 #FFDA00
    ## 22          NA     3 0.3540451 0.35353535 0.10718797 0.29461279 #28B463
    ## 23          NA     2 0.3540451 0.35353535 0.10718797 0.29461279 #28B463
    ## 24          NA     3 0.2111278 0.17676768 0.11909774 0.17676768 #28B463
    ## 25          NA     2 0.2111278 0.17676768 0.11909774 0.17676768 #28B463
    ## 26          NA     3 0.3302256 0.22095960 0.07939850 0.13257576 #28B463
    ## 27          NA     2 0.3302256 0.22095960 0.07939850 0.13257576 #28B463
    ## 28          NA     3 0.4096241 0.22095960 0.07939850 0.13257576 #28B463
    ## 29          NA     2 0.4096241 0.22095960 0.07939850 0.13257576 #28B463
    ## 30          NA     2 0.0000000 0.29914530 0.21112782 0.34900285 #BEF4BE
    ## 31          NA     3 0.0000000 0.29914530 0.21112782 0.34900285 #BEF4BE
    ## 32          NA     3 0.2111278 0.00000000 0.11909774 0.17676768 #28B463
    ## 33          NA     2 0.2111278 0.00000000 0.11909774 0.17676768 #28B463
    ## 34          NA     3 0.4890226 0.22095960 0.07939850 0.13257576 #28B463
    ## 35          NA     2 0.4890226 0.22095960 0.07939850 0.13257576 #28B463
    ## 36          NA     3 0.3302256 0.11047980 0.09527820 0.11047980 #28B463
    ## 37          NA     2 0.3302256 0.11047980 0.09527820 0.11047980 #28B463
    ## 38          NA     3 0.2111278 0.35353535 0.14291729 0.29461279 #28B463
    ## 39          NA     2 0.2111278 0.35353535 0.14291729 0.29461279 #28B463
    ## 40          NA     3 0.4612331 0.35353535 0.10718797 0.29461279 #28B463
    ## 41          NA     2 0.4612331 0.35353535 0.10718797 0.29461279 #28B463
    ## 42          NA     3 0.0000000 0.64814815 0.29916898 0.35185185 #28B463
    ## 43          NA     2 0.0000000 0.64814815 0.29916898 0.35185185 #28B463
    ## 44          NA     1 0.0000000 0.00000000 0.56842105 1.00000000 #28B463
    ## 45          NA     3 0.3302256 0.00000000 0.09527820 0.11047980 #28B463
    ## 46          NA     2 0.3302256 0.00000000 0.09527820 0.11047980 #28B463
    ## 47          NA     3 0.0000000 0.00000000 0.21112782 0.29914530 #28B463
    ## 48          NA     2 0.0000000 0.00000000 0.21112782 0.29914530 #28B463
    ## 49          NA     3 0.2991690 0.64814815 0.26925208 0.35185185 #28B463
    ## 50          NA     2 0.2991690 0.64814815 0.26925208 0.35185185 #28B463
    ## 51          NA     3 0.4255038 0.07365320 0.07145865 0.14730640 #28B463
    ## 52          NA     2 0.4255038 0.07365320 0.07145865 0.14730640 #28B463
    ## 53          NA     3 0.4969624 0.07365320 0.07145865 0.14730640 #28B463
    ## 54          NA     2 0.4969624 0.07365320 0.07145865 0.14730640 #28B463
    ## 55          NA     3 0.4255038 0.00000000 0.14291729 0.07365320 #28B463
    ## 56          NA     2 0.4255038 0.00000000 0.14291729 0.07365320 #28B463
    ## 
    ## $type
    ## [1] "color"
    ## 
    ## $vSize
    ## [1] "frequency"
    ## 
    ## $vColor
    ## [1] "group_color"
    ## 
    ## $stdErr
    ## [1] "frequency"
    ## 
    ## $algorithm
    ## [1] "pivotSize"
    ## 
    ## $vpCoorX
    ## [1] 0.02812148 0.97187852
    ## 
    ## $vpCoorY
    ## [1] 0.01968504 0.91031496
    ## 
    ## $aspRatio
    ## [1] 1.483512
    ## 
    ## $range
    ## [1] NA NA
    ## 
    ## $mapping
    ## [1] NA NA NA
    ## 
    ## $draw
    ## [1] TRUE

``` r
#Map of Colombia  
#non weighted
nal_q8_no_weight<- question_8 %>% group_by(expert_in) %>%
  summarise(average= mean(as.numeric(numeric_answer))) %>%
  group_by(average) %>% 
  mutate(cat= category_by_mean_by_question(language = "en", mean = average, question =8))%>%
  rename(EKE.expert.in = expert_in)
  
nal_q8_no_weight<- full_join(codes_department, nal_q8_no_weight)
```

    ## Joining with `by = join_by(EKE.expert.in)`

``` r
nal_q8_no_weight$cat<- factor(nal_q8_no_weight$cat, levels = c("Not Effective", "Slightly Effective", "Moderately Effective", "Very Effective", "Extremely Effective"))
colmap(departamentos, data = nal_q8_no_weight, data_id = "id_depto", var = "cat")+
  scale_fill_manual(values = palette_soil(length(unique(nal_q8_no_weight$cat))-1), na.value = "#eeeeee")
```

    ## Scale for fill is already present.
    ## Adding another scale for fill, which will replace the existing scale.

![](README_files/figure-gfm/question_8-3.png)<!-- -->

``` r
# weighted
nal_q8_weight<- inner_join(question_8, experience_of_each_expert)
```

    ## Joining with `by = join_by(crop, expert_ID, expert_in)`

``` r
nal_q8_weight<- nal_q8_weight %>%
  group_by(expert_in) %>%
  mutate(numeric_answer=as.numeric(numeric_answer)) %>%
  summarise(average_weighted= weighted.mean(numeric_answer, weights)) %>% 
  group_by(average_weighted) %>%
  mutate(cat_weighted= category_by_mean_by_question(language = "en", mean = average_weighted, question =8)) %>%
  rename(EKE.expert.in=expert_in)
```

    ## Warning: There was 1 warning in `mutate()`.
    ## ℹ In argument: `cat_weighted = category_by_mean_by_question(...)`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length

``` r
nal_q8_weight<- full_join(codes_department, nal_q8_weight)
```

    ## Joining with `by = join_by(EKE.expert.in)`

``` r
nal_q8_weight$cat_weighted<- factor(nal_q8_weight$cat_weighted, levels = c("Not Effective", "Slightly Effective", "Moderately Effective", "Very Effective", "Extremely Effective"))
colmap(departamentos, data = nal_q8_weight, data_id = "id_depto", var = "cat_weighted")+
  scale_fill_manual(values = palette_soil(length(unique(nal_q8_weight$cat))-1), na.value = "#eeeeee")
```

    ## Scale for fill is already present.
    ## Adding another scale for fill, which will replace the existing scale.

![](README_files/figure-gfm/question_8-4.png)<!-- -->

## Question 9: What is the level of training of producers on phytosanitary issues associated with banana production?

``` r
#selecting only question 9----
question_9<- filter(individual_surveys, question_number==9)
#some experts selected more than one option in this question so an intermediate answer is chosen 
question_9 <- question_9 %>%
  mutate(answer_in_english = case_when(
    answer_in_english == "Adequate,Good" ~ "Good",
    TRUE ~ answer_in_english  # This keeps all other values as they are
  ))
#some experts selected more than one option in this question so an intermediate answer is chosen 
question_9 <- question_9 %>%
  mutate(numeric_answer = case_when(
    numeric_answer == "4,5" ~ "4.5",
    TRUE ~ numeric_answer  # This keeps all other values as they are
  ))
#organizing the order of the levels
question_9$answer_in_english<- factor(question_9$answer_in_english,levels = c("No Training or Information Available", "Poor", "Fair", "Adequate", "Good", "Excellent", "Unsure"))
question_9<- filter(question_9, answer_in_english!="Unsure")
#average by department (weighted and no weighted)
#not weighted 
avg_dept_no_weight_9<- question_9 %>%
  group_by(crop, expert_in) %>%
  mutate(numeric_answer=as.numeric(numeric_answer))%>%
  mutate(average= mean(numeric_answer)) %>%
  group_by(average)%>%
  mutate(ave_cat= category_by_mean_by_question(9, mean =average, language = "en"))
```

    ## Warning: There were 9 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `ave_cat = category_by_mean_by_question(9, mean = average,
    ##   language = "en")`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 8 remaining warnings.

``` r
#weighted 
add_weights_question_9<- inner_join(question_9, experience_of_each_expert)
```

    ## Joining with `by = join_by(crop, expert_ID, expert_in)`

``` r
avg_dept_weight_9<- add_weights_question_9 %>%
  group_by(crop, expert_in) %>%
  mutate(numeric_answer=as.numeric(numeric_answer))%>%
  mutate(average_weighted= weighted.mean(numeric_answer, weights)) %>% 
  group_by(average_weighted)%>%
  mutate(ave_cat_weighted= category_by_mean_by_question(9, mean =average_weighted, language = "en"))
```

    ## Warning: There were 10 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `ave_cat_weighted = category_by_mean_by_question(9, mean =
    ##   average_weighted, language = "en")`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 9 remaining warnings.

``` r
#finding the levels per crop (banana and plantain) no weighted
levels_per_crop_Q9_no_weighted<- tapply(avg_dept_no_weight_9$ave_cat, avg_dept_no_weight_9$crop, function(x){(unique(x))})
#generating a ramp palette according to the number of levels per crop
colors_banana_question9_no_weighted<- palette_banana(length(levels_per_crop_Q9_no_weighted$Banana))
colors_plantain_question9_no_weighted<- palette_plantain(length(levels_per_crop_Q9_no_weighted$Plantain))
#Assigning the colors by crop and answer
# Define the knowledge levels for each crop
levels_by_crop_no_weighted_9 <- list(
  Banana = levels_per_crop_Q9_no_weighted$Banana,
  Plantain = levels_per_crop_Q9_no_weighted$Plantain
)
# Define the colors for each crop
colors_by_crop_no_weighted_9 <- list(
  Banana = colors_banana_question9_no_weighted, # Replace with actual color vector for Banana
  Plantain = colors_plantain_question9_no_weighted # Replace with actual color vector for Plantain
  # Add more crops and their color vectors here if needed
)
# Now call the function
avg_dept_no_weight_9 <- assign_group_color(data = avg_dept_no_weight_9, levels_by_crop = levels_by_crop_no_weighted_9, colors_by_crop = colors_by_crop_no_weighted_9,answer_col =  "ave_cat")

#finding the levels per crop (banana and plantain) weighted
levels_per_crop_Q9_weighted<- tapply(avg_dept_weight_9$ave_cat_weighted, avg_dept_weight_9$crop, function(x){(unique(x))})
#generating a ramp palette according to the number of levels per crop
colors_banana_question9_weighted<- palette_banana(length(levels_per_crop_Q9_weighted$Banana))
colors_plantain_question9_weighted<- palette_plantain(length(levels_per_crop_Q9_weighted$Plantain))
#Assigning the colors by crop and answer
# Define the knowledge levels for each crop
levels_by_crop_weighted_9 <- list(
  Banana = levels_per_crop_Q9_weighted$Banana,
  Plantain = levels_per_crop_Q9_weighted$Plantain
)
# Define the colors for each crop
colors_by_crop_weighted_9 <- list(
  Banana = colors_banana_question9_weighted, # Replace with actual color vector for Banana
  Plantain = colors_plantain_question9_weighted # Replace with actual color vector for Plantain
  # Add more crops and their color vectors here if needed
)
# Now call the function
avg_dept_weight_9 <- assign_group_color(data = avg_dept_weight_9, levels_by_crop = levels_by_crop_weighted_9, colors_by_crop = colors_by_crop_weighted_9,answer_col =  "ave_cat_weighted")

#tree map
tree_map_3(data = avg_dept_no_weight_9, "crop", "expert_in", "ave_cat", "group_color", title="No weighted")
```

    ## `summarise()` has grouped output by 'crop', 'expert_in', 'ave_cat'. You can
    ## override using the `.groups` argument.

![](README_files/figure-gfm/question_9-1.png)<!-- -->

    ## $tm
    ##        crop          expert_in                              ave_cat vSize
    ## 1    Banana          Antioquia                                 Good    12
    ## 2    Banana          Antioquia                                 <NA>    12
    ## 3    Banana             Caldas                             Adequate     2
    ## 4    Banana             Caldas                                 <NA>     2
    ## 5    Banana              Cesar                             Adequate     2
    ## 6    Banana              Cesar                                 <NA>     2
    ## 7    Banana              Chocó                                 Fair     2
    ## 8    Banana              Chocó                                 <NA>     2
    ## 9    Banana            Córdoba                                 <NA>     1
    ## 10   Banana            Córdoba No Training or Information Available     1
    ## 11   Banana              Huila                                 Fair     1
    ## 12   Banana              Huila                                 <NA>     1
    ## 13   Banana         La Guajira                                 Good    11
    ## 14   Banana         La Guajira                                 <NA>    11
    ## 15   Banana          Magdalena                                 Good    13
    ## 16   Banana          Magdalena                                 <NA>    13
    ## 17   Banana               Meta                                 Good     1
    ## 18   Banana               Meta                                 <NA>     1
    ## 19   Banana               <NA>                                 <NA>    47
    ## 20   Banana            Quindío                                 Fair     1
    ## 21   Banana            Quindío                                 <NA>     1
    ## 22   Banana          Risaralda                                 Fair     1
    ## 23   Banana          Risaralda                                 <NA>     1
    ## 24 Plantain          Antioquia                            Excellent     2
    ## 25 Plantain          Antioquia                                 <NA>     2
    ## 26 Plantain             Arauca                                 Fair     2
    ## 27 Plantain             Arauca                                 <NA>     2
    ## 28 Plantain          Atlántico                                 <NA>     1
    ## 29 Plantain          Atlántico                                 Poor     1
    ## 30 Plantain            Bolívar                                 <NA>     1
    ## 31 Plantain            Bolívar                                 Poor     1
    ## 32 Plantain             Caldas                                 Fair     7
    ## 33 Plantain             Caldas                                 <NA>     7
    ## 34 Plantain           Casanare                                 Fair     3
    ## 35 Plantain           Casanare                                 <NA>     3
    ## 36 Plantain              Chocó                                 Fair     1
    ## 37 Plantain              Chocó                                 <NA>     1
    ## 38 Plantain            Córdoba                                 Fair     1
    ## 39 Plantain            Córdoba                                 <NA>     1
    ## 40 Plantain              Huila                                 <NA>     1
    ## 41 Plantain              Huila                                 Poor     1
    ## 42 Plantain         La Guajira                             Adequate     4
    ## 43 Plantain         La Guajira                                 <NA>     4
    ## 44 Plantain          Magdalena                                 Fair     3
    ## 45 Plantain          Magdalena                                 <NA>     3
    ## 46 Plantain               Meta                             Adequate    10
    ## 47 Plantain               Meta                                 <NA>    10
    ## 48 Plantain               <NA>                                 <NA>    56
    ## 49 Plantain Norte De Santander                                 <NA>     1
    ## 50 Plantain Norte De Santander                                 Poor     1
    ## 51 Plantain            Quindío                             Adequate     6
    ## 52 Plantain            Quindío                                 <NA>     6
    ## 53 Plantain          Risaralda                             Adequate    10
    ## 54 Plantain          Risaralda                                 <NA>    10
    ## 55 Plantain          Santander                                 <NA>     1
    ## 56 Plantain          Santander                                 Poor     1
    ## 57 Plantain              Sucre                                 <NA>     1
    ## 58 Plantain              Sucre                                 Poor     1
    ## 59 Plantain             Tolima                                 <NA>     1
    ## 60 Plantain             Tolima                                 Poor     1
    ##     vColor stdErr vColorValue level        x0         y0          w          h
    ## 1  #FFDA00     12          NA     3 0.7809709 0.46808511 0.21902913 0.53191489
    ## 2  #FFDA00     12          NA     2 0.7809709 0.46808511 0.21902913 0.53191489
    ## 3  #FFE244      2          NA     3 0.5436893 0.00000000 0.26963813 0.07201309
    ## 4  #FFE244      2          NA     2 0.5436893 0.00000000 0.26963813 0.07201309
    ## 5  #FFE244      2          NA     3 0.8133274 0.26004728 0.09333628 0.20803783
    ## 6  #FFE244      2          NA     2 0.8133274 0.26004728 0.09333628 0.20803783
    ## 7  #FFEA88      2          NA     3 0.9066637 0.26004728 0.09333628 0.20803783
    ## 8  #FFEA88      2          NA     2 0.9066637 0.26004728 0.09333628 0.20803783
    ## 9  #FFF2CC      1          NA     2 0.8133274 0.13002364 0.07466902 0.13002364
    ## 10 #FFF2CC      1          NA     3 0.8133274 0.13002364 0.07466902 0.13002364
    ## 11 #FFEA88      1          NA     3 0.8133274 0.00000000 0.07466902 0.13002364
    ## 12 #FFEA88      1          NA     2 0.8133274 0.00000000 0.07466902 0.13002364
    ## 13 #FFDA00     11          NA     3 0.5436893 0.07201309 0.26963813 0.39607201
    ## 14 #FFDA00     11          NA     2 0.5436893 0.07201309 0.26963813 0.39607201
    ## 15 #FFDA00     13          NA     3 0.5436893 0.46808511 0.23728155 0.53191489
    ## 16 #FFDA00     13          NA     2 0.5436893 0.46808511 0.23728155 0.53191489
    ## 17 #FFDA00      1          NA     3 0.8879965 0.17336485 0.11200353 0.08668243
    ## 18 #FFDA00      1          NA     2 0.8879965 0.17336485 0.11200353 0.08668243
    ## 19 #FFDA00     47          NA     1 0.5436893 0.00000000 0.45631068 1.00000000
    ## 20 #FFEA88      1          NA     3 0.8879965 0.08668243 0.11200353 0.08668243
    ## 21 #FFEA88      1          NA     2 0.8879965 0.08668243 0.11200353 0.08668243
    ## 22 #FFEA88      1          NA     3 0.8879965 0.00000000 0.11200353 0.08668243
    ## 23 #FFEA88      1          NA     2 0.8879965 0.00000000 0.11200353 0.08668243
    ## 24 #28B463      2          NA     3 0.1963323 0.18167702 0.10687910 0.18167702
    ## 25 #28B463      2          NA     2 0.1963323 0.18167702 0.10687910 0.18167702
    ## 26 #8CDE9F      2          NA     3 0.1963323 0.00000000 0.10687910 0.18167702
    ## 27 #8CDE9F      2          NA     2 0.1963323 0.00000000 0.10687910 0.18167702
    ## 28 #BEF4BE      1          NA     2 0.3032114 0.24223602 0.08015932 0.12111801
    ## 29 #BEF4BE      1          NA     3 0.3032114 0.24223602 0.08015932 0.12111801
    ## 30 #BEF4BE      1          NA     2 0.3833707 0.24223602 0.08015932 0.12111801
    ## 31 #BEF4BE      1          NA     3 0.3833707 0.24223602 0.08015932 0.12111801
    ## 32 #8CDE9F      7          NA     3 0.0000000 0.29670330 0.19633225 0.34615385
    ## 33 #8CDE9F      7          NA     2 0.0000000 0.29670330 0.19633225 0.34615385
    ## 34 #8CDE9F      3          NA     3 0.3352751 0.36335404 0.10420712 0.27950311
    ## 35 #8CDE9F      3          NA     2 0.3352751 0.36335404 0.10420712 0.27950311
    ## 36 #8CDE9F      1          NA     3 0.4635300 0.24223602 0.08015932 0.12111801
    ## 37 #8CDE9F      1          NA     2 0.4635300 0.24223602 0.08015932 0.12111801
    ## 38 #8CDE9F      1          NA     3 0.3032114 0.12111801 0.08015932 0.12111801
    ## 39 #8CDE9F      1          NA     2 0.3032114 0.12111801 0.08015932 0.12111801
    ## 40 #BEF4BE      1          NA     2 0.3032114 0.00000000 0.08015932 0.12111801
    ## 41 #BEF4BE      1          NA     3 0.3032114 0.00000000 0.08015932 0.12111801
    ## 42 #59C981      4          NA     3 0.1963323 0.36335404 0.13894283 0.27950311
    ## 43 #59C981      4          NA     2 0.1963323 0.36335404 0.13894283 0.27950311
    ## 44 #8CDE9F      3          NA     3 0.4394822 0.36335404 0.10420712 0.27950311
    ## 45 #8CDE9F      3          NA     2 0.4394822 0.36335404 0.10420712 0.27950311
    ## 46 #59C981     10          NA     3 0.0000000 0.64285714 0.27184466 0.35714286
    ## 47 #59C981     10          NA     2 0.0000000 0.64285714 0.27184466 0.35714286
    ## 48 #BEF4BE     56          NA     1 0.0000000 0.00000000 0.54368932 1.00000000
    ## 49 #BEF4BE      1          NA     2 0.3833707 0.12111801 0.08015932 0.12111801
    ## 50 #BEF4BE      1          NA     3 0.3833707 0.12111801 0.08015932 0.12111801
    ## 51 #59C981      6          NA     3 0.0000000 0.00000000 0.19633225 0.29670330
    ## 52 #59C981      6          NA     2 0.0000000 0.00000000 0.19633225 0.29670330
    ## 53 #59C981     10          NA     3 0.2718447 0.64285714 0.27184466 0.35714286
    ## 54 #59C981     10          NA     2 0.2718447 0.64285714 0.27184466 0.35714286
    ## 55 #BEF4BE      1          NA     2 0.4635300 0.12111801 0.08015932 0.12111801
    ## 56 #BEF4BE      1          NA     3 0.4635300 0.12111801 0.08015932 0.12111801
    ## 57 #BEF4BE      1          NA     2 0.3833707 0.00000000 0.08015932 0.12111801
    ## 58 #BEF4BE      1          NA     3 0.3833707 0.00000000 0.08015932 0.12111801
    ## 59 #BEF4BE      1          NA     2 0.4635300 0.00000000 0.08015932 0.12111801
    ## 60 #BEF4BE      1          NA     3 0.4635300 0.00000000 0.08015932 0.12111801
    ##      color
    ## 1  #FFDA00
    ## 2  #FFDA00
    ## 3  #FFE244
    ## 4  #FFE244
    ## 5  #FFE244
    ## 6  #FFE244
    ## 7  #FFEA88
    ## 8  #FFEA88
    ## 9  #FFF2CC
    ## 10 #FFF2CC
    ## 11 #FFEA88
    ## 12 #FFEA88
    ## 13 #FFDA00
    ## 14 #FFDA00
    ## 15 #FFDA00
    ## 16 #FFDA00
    ## 17 #FFDA00
    ## 18 #FFDA00
    ## 19 #FFDA00
    ## 20 #FFEA88
    ## 21 #FFEA88
    ## 22 #FFEA88
    ## 23 #FFEA88
    ## 24 #28B463
    ## 25 #28B463
    ## 26 #8CDE9F
    ## 27 #8CDE9F
    ## 28 #BEF4BE
    ## 29 #BEF4BE
    ## 30 #BEF4BE
    ## 31 #BEF4BE
    ## 32 #8CDE9F
    ## 33 #8CDE9F
    ## 34 #8CDE9F
    ## 35 #8CDE9F
    ## 36 #8CDE9F
    ## 37 #8CDE9F
    ## 38 #8CDE9F
    ## 39 #8CDE9F
    ## 40 #BEF4BE
    ## 41 #BEF4BE
    ## 42 #59C981
    ## 43 #59C981
    ## 44 #8CDE9F
    ## 45 #8CDE9F
    ## 46 #59C981
    ## 47 #59C981
    ## 48 #BEF4BE
    ## 49 #BEF4BE
    ## 50 #BEF4BE
    ## 51 #59C981
    ## 52 #59C981
    ## 53 #59C981
    ## 54 #59C981
    ## 55 #BEF4BE
    ## 56 #BEF4BE
    ## 57 #BEF4BE
    ## 58 #BEF4BE
    ## 59 #BEF4BE
    ## 60 #BEF4BE
    ## 
    ## $type
    ## [1] "color"
    ## 
    ## $vSize
    ## [1] "frequency"
    ## 
    ## $vColor
    ## [1] "group_color"
    ## 
    ## $stdErr
    ## [1] "frequency"
    ## 
    ## $algorithm
    ## [1] "pivotSize"
    ## 
    ## $vpCoorX
    ## [1] 0.02812148 0.97187852
    ## 
    ## $vpCoorY
    ## [1] 0.01968504 0.91031496
    ## 
    ## $aspRatio
    ## [1] 1.483512
    ## 
    ## $range
    ## [1] NA NA
    ## 
    ## $mapping
    ## [1] NA NA NA
    ## 
    ## $draw
    ## [1] TRUE

``` r
tree_map_3(data = avg_dept_weight_9, "crop", "expert_in", "ave_cat_weighted", "group_color", title="weighted")
```

    ## `summarise()` has grouped output by 'crop', 'expert_in', 'ave_cat_weighted'.
    ## You can override using the `.groups` argument.

![](README_files/figure-gfm/question_9-2.png)<!-- -->

    ## $tm
    ##        crop          expert_in                     ave_cat_weighted vSize
    ## 1    Banana          Antioquia                                 Good    12
    ## 2    Banana          Antioquia                                 <NA>    12
    ## 3    Banana             Caldas                                 Fair     1
    ## 4    Banana             Caldas                                 <NA>     1
    ## 5    Banana              Cesar                                 Fair     1
    ## 6    Banana              Cesar                                 <NA>     1
    ## 7    Banana              Chocó                                 Fair     2
    ## 8    Banana              Chocó                                 <NA>     2
    ## 9    Banana            Córdoba                                 <NA>     1
    ## 10   Banana            Córdoba No Training or Information Available     1
    ## 11   Banana              Huila                                 Fair     1
    ## 12   Banana              Huila                                 <NA>     1
    ## 13   Banana         La Guajira                                 Good     9
    ## 14   Banana         La Guajira                                 <NA>     9
    ## 15   Banana          Magdalena                                 Good    12
    ## 16   Banana          Magdalena                                 <NA>    12
    ## 17   Banana               <NA>                                 <NA>    41
    ## 18   Banana            Quindío                                 Fair     1
    ## 19   Banana            Quindío                                 <NA>     1
    ## 20   Banana          Risaralda                                 Fair     1
    ## 21   Banana          Risaralda                                 <NA>     1
    ## 22 Plantain          Antioquia                            Excellent     2
    ## 23 Plantain          Antioquia                                 <NA>     2
    ## 24 Plantain             Arauca                                 Fair     2
    ## 25 Plantain             Arauca                                 <NA>     2
    ## 26 Plantain          Atlántico                                 <NA>     1
    ## 27 Plantain          Atlántico                                 Poor     1
    ## 28 Plantain            Bolívar                                 <NA>     1
    ## 29 Plantain            Bolívar                                 Poor     1
    ## 30 Plantain             Caldas                                 Fair     7
    ## 31 Plantain             Caldas                                 <NA>     7
    ## 32 Plantain           Casanare                                 Fair     3
    ## 33 Plantain           Casanare                                 <NA>     3
    ## 34 Plantain              Chocó                                 Fair     1
    ## 35 Plantain              Chocó                                 <NA>     1
    ## 36 Plantain            Córdoba                                 Fair     1
    ## 37 Plantain            Córdoba                                 <NA>     1
    ## 38 Plantain              Huila                                 <NA>     1
    ## 39 Plantain              Huila                                 Poor     1
    ## 40 Plantain         La Guajira                                 Fair     4
    ## 41 Plantain         La Guajira                                 <NA>     4
    ## 42 Plantain          Magdalena                                 Fair     3
    ## 43 Plantain          Magdalena                                 <NA>     3
    ## 44 Plantain               Meta                             Adequate    10
    ## 45 Plantain               Meta                                 <NA>    10
    ## 46 Plantain               <NA>                                 <NA>    56
    ## 47 Plantain Norte De Santander                                 <NA>     1
    ## 48 Plantain Norte De Santander                                 Poor     1
    ## 49 Plantain            Quindío                             Adequate     6
    ## 50 Plantain            Quindío                                 <NA>     6
    ## 51 Plantain          Risaralda                                 Fair    10
    ## 52 Plantain          Risaralda                                 <NA>    10
    ## 53 Plantain          Santander                                 <NA>     1
    ## 54 Plantain          Santander                                 Poor     1
    ## 55 Plantain              Sucre                                 <NA>     1
    ## 56 Plantain              Sucre                                 Poor     1
    ## 57 Plantain             Tolima                                 <NA>     1
    ## 58 Plantain             Tolima                                 Poor     1
    ##     vColor stdErr vColorValue level        x0         y0          w          h
    ## 1  #FFDA00     12          NA     3 0.5773196 0.41463415 0.21134021 0.58536585
    ## 2  #FFDA00     12          NA     2 0.5773196 0.41463415 0.21134021 0.58536585
    ## 3  #FFE566      1          NA     3 0.8508187 0.27642276 0.07459066 0.13821138
    ## 4  #FFE566      1          NA     2 0.8508187 0.27642276 0.07459066 0.13821138
    ## 5  #FFE566      1          NA     3 0.9254093 0.27642276 0.07459066 0.13821138
    ## 6  #FFE566      1          NA     2 0.9254093 0.27642276 0.07459066 0.13821138
    ## 7  #FFE566      2          NA     3 0.5773196 0.00000000 0.27349909 0.07538803
    ## 8  #FFE566      2          NA     2 0.5773196 0.00000000 0.27349909 0.07538803
    ## 9  #FFF2CC      1          NA     2 0.8508187 0.13821138 0.07459066 0.13821138
    ## 10 #FFF2CC      1          NA     3 0.8508187 0.13821138 0.07459066 0.13821138
    ## 11 #FFE566      1          NA     3 0.9254093 0.13821138 0.07459066 0.13821138
    ## 12 #FFE566      1          NA     2 0.9254093 0.13821138 0.07459066 0.13821138
    ## 13 #FFDA00      9          NA     3 0.5773196 0.07538803 0.27349909 0.33924612
    ## 14 #FFDA00      9          NA     2 0.5773196 0.07538803 0.27349909 0.33924612
    ## 15 #FFDA00     12          NA     3 0.7886598 0.41463415 0.21134021 0.58536585
    ## 16 #FFDA00     12          NA     2 0.7886598 0.41463415 0.21134021 0.58536585
    ## 17 #FFE566     41          NA     1 0.5773196 0.00000000 0.42268041 1.00000000
    ## 18 #FFE566      1          NA     3 0.8508187 0.00000000 0.07459066 0.13821138
    ## 19 #FFE566      1          NA     2 0.8508187 0.00000000 0.07459066 0.13821138
    ## 20 #FFE566      1          NA     3 0.9254093 0.00000000 0.07459066 0.13821138
    ## 21 #FFE566      1          NA     2 0.9254093 0.00000000 0.07459066 0.13821138
    ## 22 #28B463      2          NA     3 0.2084765 0.18167702 0.11349018 0.18167702
    ## 23 #28B463      2          NA     2 0.2084765 0.18167702 0.11349018 0.18167702
    ## 24 #59C981      2          NA     3 0.2084765 0.00000000 0.11349018 0.18167702
    ## 25 #59C981      2          NA     2 0.2084765 0.00000000 0.11349018 0.18167702
    ## 26 #BEF4BE      1          NA     2 0.3219667 0.24223602 0.08511763 0.12111801
    ## 27 #BEF4BE      1          NA     3 0.3219667 0.24223602 0.08511763 0.12111801
    ## 28 #BEF4BE      1          NA     2 0.3219667 0.12111801 0.08511763 0.12111801
    ## 29 #BEF4BE      1          NA     3 0.3219667 0.12111801 0.08511763 0.12111801
    ## 30 #59C981      7          NA     3 0.0000000 0.29670330 0.20847652 0.34615385
    ## 31 #59C981      7          NA     2 0.0000000 0.29670330 0.20847652 0.34615385
    ## 32 #59C981      3          NA     3 0.3560137 0.36335404 0.11065292 0.27950311
    ## 33 #59C981      3          NA     2 0.3560137 0.36335404 0.11065292 0.27950311
    ## 34 #59C981      1          NA     3 0.3219667 0.00000000 0.08511763 0.12111801
    ## 35 #59C981      1          NA     2 0.3219667 0.00000000 0.08511763 0.12111801
    ## 36 #59C981      1          NA     3 0.4070843 0.24223602 0.08511763 0.12111801
    ## 37 #59C981      1          NA     2 0.4070843 0.24223602 0.08511763 0.12111801
    ## 38 #BEF4BE      1          NA     2 0.4922020 0.24223602 0.08511763 0.12111801
    ## 39 #BEF4BE      1          NA     3 0.4922020 0.24223602 0.08511763 0.12111801
    ## 40 #59C981      4          NA     3 0.2084765 0.36335404 0.14753723 0.27950311
    ## 41 #59C981      4          NA     2 0.2084765 0.36335404 0.14753723 0.27950311
    ## 42 #59C981      3          NA     3 0.4666667 0.36335404 0.11065292 0.27950311
    ## 43 #59C981      3          NA     2 0.4666667 0.36335404 0.11065292 0.27950311
    ## 44 #8CDE9F     10          NA     3 0.0000000 0.64285714 0.28865979 0.35714286
    ## 45 #8CDE9F     10          NA     2 0.0000000 0.64285714 0.28865979 0.35714286
    ## 46 #59C981     56          NA     1 0.0000000 0.00000000 0.57731959 1.00000000
    ## 47 #BEF4BE      1          NA     2 0.4070843 0.12111801 0.08511763 0.12111801
    ## 48 #BEF4BE      1          NA     3 0.4070843 0.12111801 0.08511763 0.12111801
    ## 49 #8CDE9F      6          NA     3 0.0000000 0.00000000 0.20847652 0.29670330
    ## 50 #8CDE9F      6          NA     2 0.0000000 0.00000000 0.20847652 0.29670330
    ## 51 #59C981     10          NA     3 0.2886598 0.64285714 0.28865979 0.35714286
    ## 52 #59C981     10          NA     2 0.2886598 0.64285714 0.28865979 0.35714286
    ## 53 #BEF4BE      1          NA     2 0.4070843 0.00000000 0.08511763 0.12111801
    ## 54 #BEF4BE      1          NA     3 0.4070843 0.00000000 0.08511763 0.12111801
    ## 55 #BEF4BE      1          NA     2 0.4922020 0.12111801 0.08511763 0.12111801
    ## 56 #BEF4BE      1          NA     3 0.4922020 0.12111801 0.08511763 0.12111801
    ## 57 #BEF4BE      1          NA     2 0.4922020 0.00000000 0.08511763 0.12111801
    ## 58 #BEF4BE      1          NA     3 0.4922020 0.00000000 0.08511763 0.12111801
    ##      color
    ## 1  #FFDA00
    ## 2  #FFDA00
    ## 3  #FFE566
    ## 4  #FFE566
    ## 5  #FFE566
    ## 6  #FFE566
    ## 7  #FFE566
    ## 8  #FFE566
    ## 9  #FFF2CC
    ## 10 #FFF2CC
    ## 11 #FFE566
    ## 12 #FFE566
    ## 13 #FFDA00
    ## 14 #FFDA00
    ## 15 #FFDA00
    ## 16 #FFDA00
    ## 17 #FFE566
    ## 18 #FFE566
    ## 19 #FFE566
    ## 20 #FFE566
    ## 21 #FFE566
    ## 22 #28B463
    ## 23 #28B463
    ## 24 #59C981
    ## 25 #59C981
    ## 26 #BEF4BE
    ## 27 #BEF4BE
    ## 28 #BEF4BE
    ## 29 #BEF4BE
    ## 30 #59C981
    ## 31 #59C981
    ## 32 #59C981
    ## 33 #59C981
    ## 34 #59C981
    ## 35 #59C981
    ## 36 #59C981
    ## 37 #59C981
    ## 38 #BEF4BE
    ## 39 #BEF4BE
    ## 40 #59C981
    ## 41 #59C981
    ## 42 #59C981
    ## 43 #59C981
    ## 44 #8CDE9F
    ## 45 #8CDE9F
    ## 46 #59C981
    ## 47 #BEF4BE
    ## 48 #BEF4BE
    ## 49 #8CDE9F
    ## 50 #8CDE9F
    ## 51 #59C981
    ## 52 #59C981
    ## 53 #BEF4BE
    ## 54 #BEF4BE
    ## 55 #BEF4BE
    ## 56 #BEF4BE
    ## 57 #BEF4BE
    ## 58 #BEF4BE
    ## 
    ## $type
    ## [1] "color"
    ## 
    ## $vSize
    ## [1] "frequency"
    ## 
    ## $vColor
    ## [1] "group_color"
    ## 
    ## $stdErr
    ## [1] "frequency"
    ## 
    ## $algorithm
    ## [1] "pivotSize"
    ## 
    ## $vpCoorX
    ## [1] 0.02812148 0.97187852
    ## 
    ## $vpCoorY
    ## [1] 0.01968504 0.91031496
    ## 
    ## $aspRatio
    ## [1] 1.483512
    ## 
    ## $range
    ## [1] NA NA
    ## 
    ## $mapping
    ## [1] NA NA NA
    ## 
    ## $draw
    ## [1] TRUE

``` r
#Map of Colombia  
#non weighted
nal_q9_no_weight<- question_9 %>% group_by(expert_in) %>%
  summarise(average= mean(as.numeric(numeric_answer))) %>%
  group_by(average) %>% 
  mutate(cat= category_by_mean_by_question(language = "en", mean = average, question =9))%>%
  rename(EKE.expert.in = expert_in)
```

    ## Warning: There were 2 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `cat = category_by_mean_by_question(...)`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 1 remaining warning.

``` r
nal_q9_no_weight<- full_join(codes_department, nal_q9_no_weight)
```

    ## Joining with `by = join_by(EKE.expert.in)`

``` r
nal_q9_no_weight$cat<- factor(nal_q9_no_weight$cat, levels = c("No Training or Information Available", "Poor", "Fair", "Adequate", "Good", "Excellent", "Unsure"))
colmap(departamentos, data = nal_q9_no_weight, data_id = "id_depto", var = "cat")+
  scale_fill_manual(values = palette_soil(length(unique(nal_q9_no_weight$cat))-1), na.value = "#eeeeee")
```

    ## Scale for fill is already present.
    ## Adding another scale for fill, which will replace the existing scale.

![](README_files/figure-gfm/question_9-3.png)<!-- -->

``` r
# weighted
nal_q9_weight<- inner_join(question_9, experience_of_each_expert)
```

    ## Joining with `by = join_by(crop, expert_ID, expert_in)`

``` r
nal_q9_weight<- nal_q9_weight %>%
  group_by(expert_in) %>%
  mutate(numeric_answer=as.numeric(numeric_answer)) %>%
  summarise(average_weighted= weighted.mean(numeric_answer, weights)) %>% 
  group_by(average_weighted) %>%
  mutate(cat_weighted= category_by_mean_by_question(language = "en", mean = average_weighted, question =9)) %>%
  rename(EKE.expert.in=expert_in)
```

    ## Warning: There was 1 warning in `mutate()`.
    ## ℹ In argument: `cat_weighted = category_by_mean_by_question(...)`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length

``` r
nal_q9_weight<- full_join(codes_department, nal_q9_weight)
```

    ## Joining with `by = join_by(EKE.expert.in)`

``` r
nal_q9_weight$cat_weighted<- factor(nal_q9_weight$cat_weighted, levels = c("No Training or Information Available", "Poor", "Fair", "Adequate", "Good", "Excellent", "Unsure"))
colmap(departamentos, data = nal_q9_weight, data_id = "id_depto", var = "cat_weighted")+
  scale_fill_manual(values = palette_soil(length(unique(nal_q9_weight$cat))-1), na.value = "#eeeeee")
```

    ## Scale for fill is already present.
    ## Adding another scale for fill, which will replace the existing scale.

![](README_files/figure-gfm/question_9-4.png)<!-- -->

## Question 13: How frequent is the use of new planting material to renew the production system?

``` r
#selecting only question 13----
question_13<- filter(individual_surveys, question_number==13)
#organizing the order of the levels
question_13$answer_in_english<- factor(question_13$answer_in_english,levels = c("Every 1 or 2 cycles", "Every 3 to 4 cycles", "Every 5 to 6 cycles",  "Every 7 or more cycles", "Not Sure"))
question_13<- filter(question_13, answer_in_english!="Not Sure")
#average by department (weighted and no weighted)
#not weighted 
avg_dept_no_weight_13<- question_13 %>%
  group_by(crop, expert_in) %>%
  mutate(numeric_answer=as.numeric(numeric_answer))%>%
  mutate(average= mean(numeric_answer)) %>%
  group_by(average)%>%
  mutate(ave_cat= category_by_mean_by_question(13, mean =average, language = "en"))
```

    ## Warning: There were 7 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `ave_cat = category_by_mean_by_question(13, mean = average,
    ##   language = "en")`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 6 remaining warnings.

``` r
#weighted 
add_weights_question_13<- inner_join(question_13, experience_of_each_expert)
```

    ## Joining with `by = join_by(crop, expert_ID, expert_in)`

``` r
avg_dept_weight_13<- add_weights_question_13 %>%
  group_by(crop, expert_in) %>%
  mutate(numeric_answer=as.numeric(numeric_answer))%>%
  mutate(average_weighted= weighted.mean(numeric_answer, weights)) %>% 
  group_by(average_weighted)%>%
  mutate(ave_cat_weighted= category_by_mean_by_question(13, mean =average_weighted, language = "en"))
```

    ## Warning: There were 8 warnings in `mutate()`.
    ## The first warning was:
    ## ℹ In argument: `ave_cat_weighted = category_by_mean_by_question(13, mean =
    ##   average_weighted, language = "en")`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 7 remaining warnings.

``` r
#finding the levels per crop (banana and plantain) no weighted
levels_per_crop_Q13_no_weighted<- tapply(avg_dept_no_weight_13$ave_cat, avg_dept_no_weight_13$crop, function(x){(unique(x))})
#generating a ramp palette according to the number of levels per crop
colors_banana_question13_no_weighted<- palette_banana(length(levels_per_crop_Q13_no_weighted$Banana))
colors_plantain_question13_no_weighted<- palette_plantain(length(levels_per_crop_Q13_no_weighted$Plantain))
#Assigning the colors by crop and answer
# Define the knowledge levels for each crop
levels_by_crop_no_weighted_13 <- list(
  Banana = levels_per_crop_Q13_no_weighted$Banana,
  Plantain = levels_per_crop_Q13_no_weighted$Plantain
)
# Define the colors for each crop
colors_by_crop_no_weighted_13 <- list(
  Banana = colors_banana_question13_no_weighted, # Replace with actual color vector for Banana
  Plantain = colors_plantain_question13_no_weighted # Replace with actual color vector for Plantain
  # Add more crops and their color vectors here if needed
)
# Now call the function
avg_dept_no_weight_13 <- assign_group_color(data = avg_dept_no_weight_13, levels_by_crop = levels_by_crop_no_weighted_13, colors_by_crop = colors_by_crop_no_weighted_13,answer_col =  "ave_cat")

#finding the levels per crop (banana and plantain) weighted
levels_per_crop_Q13_weighted<- tapply(avg_dept_weight_13$ave_cat_weighted, avg_dept_weight_13$crop, function(x){(unique(x))})
#generating a ramp palette according to the number of levels per crop
colors_banana_question13_weighted<- palette_banana(length(levels_per_crop_Q13_weighted$Banana))
colors_plantain_question13_weighted<- palette_plantain(length(levels_per_crop_Q13_weighted$Plantain))
#Assigning the colors by crop and answer
# Define the knowledge levels for each crop
levels_by_crop_weighted_13 <- list(
  Banana = levels_per_crop_Q13_weighted$Banana,
  Plantain = levels_per_crop_Q13_weighted$Plantain
)
# Define the colors for each crop
colors_by_crop_weighted_13 <- list(
  Banana = colors_banana_question13_weighted, # Replace with actual color vector for Banana
  Plantain = colors_plantain_question13_weighted # Replace with actual color vector for Plantain
  # Add more crops and their color vectors here if needed
)
# Now call the function
avg_dept_weight_13 <- assign_group_color(data = avg_dept_weight_13, levels_by_crop = levels_by_crop_weighted_13, colors_by_crop = colors_by_crop_weighted_13,answer_col =  "ave_cat_weighted")

#tree map
tree_map_3(data = avg_dept_no_weight_13, "crop", "expert_in", "ave_cat", "group_color", title="No weighted")
```

    ## `summarise()` has grouped output by 'crop', 'expert_in', 'ave_cat'. You can
    ## override using the `.groups` argument.

![](README_files/figure-gfm/questoin_13-1.png)<!-- -->

    ## $tm
    ##        crop          expert_in                ave_cat vSize  vColor stdErr
    ## 1    Banana          Antioquia    Every 5 to 6 cycles    10 #FFF2CC     10
    ## 2    Banana          Antioquia                   <NA>    10 #FFF2CC     10
    ## 3    Banana             Caldas Every 7 or more cycles     1 #FFDA00      1
    ## 4    Banana             Caldas                   <NA>     1 #FFDA00      1
    ## 5    Banana              Cesar Every 7 or more cycles     2 #FFDA00      2
    ## 6    Banana              Cesar                   <NA>     2 #FFDA00      2
    ## 7    Banana              Chocó Every 7 or more cycles     1 #FFDA00      1
    ## 8    Banana              Chocó                   <NA>     1 #FFDA00      1
    ## 9    Banana              Huila Every 7 or more cycles     1 #FFDA00      1
    ## 10   Banana              Huila                   <NA>     1 #FFDA00      1
    ## 11   Banana         La Guajira Every 7 or more cycles     9 #FFDA00      9
    ## 12   Banana         La Guajira                   <NA>     9 #FFDA00      9
    ## 13   Banana          Magdalena    Every 5 to 6 cycles    11 #FFF2CC     11
    ## 14   Banana          Magdalena                   <NA>    11 #FFF2CC     11
    ## 15   Banana               <NA>                   <NA>    37 #FFDA00     37
    ## 16   Banana            Quindío Every 7 or more cycles     1 #FFDA00      1
    ## 17   Banana            Quindío                   <NA>     1 #FFDA00      1
    ## 18   Banana          Risaralda Every 7 or more cycles     1 #FFDA00      1
    ## 19   Banana          Risaralda                   <NA>     1 #FFDA00      1
    ## 20 Plantain          Antioquia Every 7 or more cycles     2 #28B463      2
    ## 21 Plantain          Antioquia                   <NA>     2 #28B463      2
    ## 22 Plantain             Arauca    Every 3 to 4 cycles     2 #BEF4BE      2
    ## 23 Plantain             Arauca                   <NA>     2 #BEF4BE      2
    ## 24 Plantain          Atlántico Every 7 or more cycles     1 #28B463      1
    ## 25 Plantain          Atlántico                   <NA>     1 #28B463      1
    ## 26 Plantain            Bolívar Every 7 or more cycles     1 #28B463      1
    ## 27 Plantain            Bolívar                   <NA>     1 #28B463      1
    ## 28 Plantain             Caldas    Every 5 to 6 cycles     6 #59C981      6
    ## 29 Plantain             Caldas                   <NA>     6 #59C981      6
    ## 30 Plantain           Casanare    Every 3 to 4 cycles     2 #BEF4BE      2
    ## 31 Plantain           Casanare                   <NA>     2 #BEF4BE      2
    ## 32 Plantain              Chocó Every 7 or more cycles     1 #28B463      1
    ## 33 Plantain              Chocó                   <NA>     1 #28B463      1
    ## 34 Plantain            Córdoba Every 7 or more cycles     1 #28B463      1
    ## 35 Plantain            Córdoba                   <NA>     1 #28B463      1
    ## 36 Plantain              Huila Every 7 or more cycles     1 #28B463      1
    ## 37 Plantain              Huila                   <NA>     1 #28B463      1
    ## 38 Plantain         La Guajira Every 7 or more cycles     3 #28B463      3
    ## 39 Plantain         La Guajira                   <NA>     3 #28B463      3
    ## 40 Plantain          Magdalena Every 7 or more cycles     3 #28B463      3
    ## 41 Plantain          Magdalena                   <NA>     3 #28B463      3
    ## 42 Plantain               Meta    Every 1 or 2 cycles    10 #8CDE9F     10
    ## 43 Plantain               Meta                   <NA>    10 #8CDE9F     10
    ## 44 Plantain               <NA>                   <NA>    51 #28B463     51
    ## 45 Plantain Norte De Santander Every 7 or more cycles     1 #28B463      1
    ## 46 Plantain Norte De Santander                   <NA>     1 #28B463      1
    ## 47 Plantain            Quindío    Every 5 to 6 cycles     6 #59C981      6
    ## 48 Plantain            Quindío                   <NA>     6 #59C981      6
    ## 49 Plantain          Risaralda Every 7 or more cycles     8 #28B463      8
    ## 50 Plantain          Risaralda                   <NA>     8 #28B463      8
    ## 51 Plantain          Santander Every 7 or more cycles     1 #28B463      1
    ## 52 Plantain          Santander                   <NA>     1 #28B463      1
    ## 53 Plantain              Sucre Every 7 or more cycles     1 #28B463      1
    ## 54 Plantain              Sucre                   <NA>     1 #28B463      1
    ## 55 Plantain             Tolima Every 7 or more cycles     1 #28B463      1
    ## 56 Plantain             Tolima                   <NA>     1 #28B463      1
    ##    vColorValue level        x0         y0          w          h   color
    ## 1           NA     3 0.7997835 0.43243243 0.20021645 0.56756757 #FFF2CC
    ## 2           NA     2 0.7997835 0.43243243 0.20021645 0.56756757 #FFF2CC
    ## 3           NA     3 0.8686080 0.25945946 0.06569602 0.17297297 #FFDA00
    ## 4           NA     2 0.8686080 0.25945946 0.06569602 0.17297297 #FFDA00
    ## 5           NA     3 0.5795455 0.00000000 0.28906250 0.07862408 #FFDA00
    ## 6           NA     2 0.5795455 0.00000000 0.28906250 0.07862408 #FFDA00
    ## 7           NA     3 0.9343040 0.25945946 0.06569602 0.17297297 #FFDA00
    ## 8           NA     2 0.9343040 0.25945946 0.06569602 0.17297297 #FFDA00
    ## 9           NA     3 0.8686080 0.08648649 0.06569602 0.17297297 #FFDA00
    ## 10          NA     2 0.8686080 0.08648649 0.06569602 0.17297297 #FFDA00
    ## 11          NA     3 0.5795455 0.07862408 0.28906250 0.35380835 #FFDA00
    ## 12          NA     2 0.5795455 0.07862408 0.28906250 0.35380835 #FFDA00
    ## 13          NA     3 0.5795455 0.43243243 0.22023810 0.56756757 #FFF2CC
    ## 14          NA     2 0.5795455 0.43243243 0.22023810 0.56756757 #FFF2CC
    ## 15          NA     1 0.5795455 0.00000000 0.42045455 1.00000000 #FFDA00
    ## 16          NA     3 0.9343040 0.08648649 0.06569602 0.17297297 #FFDA00
    ## 17          NA     2 0.9343040 0.08648649 0.06569602 0.17297297 #FFDA00
    ## 18          NA     3 0.8686080 0.00000000 0.13139205 0.08648649 #FFDA00
    ## 19          NA     2 0.8686080 0.00000000 0.13139205 0.08648649 #FFDA00
    ## 20          NA     3 0.1931818 0.15126050 0.15025253 0.15126050 #28B463
    ## 21          NA     2 0.1931818 0.15126050 0.15025253 0.15126050 #28B463
    ## 22          NA     3 0.1931818 0.00000000 0.15025253 0.15126050 #BEF4BE
    ## 23          NA     2 0.1931818 0.00000000 0.15025253 0.15126050 #BEF4BE
    ## 24          NA     3 0.4614899 0.43315508 0.11805556 0.09625668 #28B463
    ## 25          NA     2 0.4614899 0.43315508 0.11805556 0.09625668 #28B463
    ## 26          NA     3 0.4614899 0.33689840 0.11805556 0.09625668 #28B463
    ## 27          NA     2 0.4614899 0.33689840 0.11805556 0.09625668 #28B463
    ## 28          NA     3 0.4346591 0.52941176 0.14488636 0.47058824 #59C981
    ## 29          NA     2 0.4346591 0.52941176 0.14488636 0.47058824 #59C981
    ## 30          NA     3 0.3434343 0.33689840 0.11805556 0.19251337 #BEF4BE
    ## 31          NA     2 0.3434343 0.33689840 0.11805556 0.19251337 #BEF4BE
    ## 32          NA     3 0.3434343 0.22459893 0.10119048 0.11229947 #28B463
    ## 33          NA     2 0.3434343 0.22459893 0.10119048 0.11229947 #28B463
    ## 34          NA     3 0.3434343 0.11229947 0.10119048 0.11229947 #28B463
    ## 35          NA     2 0.3434343 0.11229947 0.10119048 0.11229947 #28B463
    ## 36          NA     3 0.3434343 0.00000000 0.10119048 0.11229947 #28B463
    ## 37          NA     2 0.3434343 0.00000000 0.10119048 0.11229947 #28B463
    ## 38          NA     3 0.0000000 0.00000000 0.19318182 0.17647059 #28B463
    ## 39          NA     2 0.0000000 0.00000000 0.19318182 0.17647059 #28B463
    ## 40          NA     3 0.1931818 0.30252101 0.15025253 0.22689076 #28B463
    ## 41          NA     2 0.1931818 0.30252101 0.15025253 0.22689076 #28B463
    ## 42          NA     3 0.0000000 0.52941176 0.24147727 0.47058824 #8CDE9F
    ## 43          NA     2 0.0000000 0.52941176 0.24147727 0.47058824 #8CDE9F
    ## 44          NA     1 0.0000000 0.00000000 0.57954545 1.00000000 #28B463
    ## 45          NA     3 0.4446248 0.16844920 0.06746032 0.16844920 #28B463
    ## 46          NA     2 0.4446248 0.16844920 0.06746032 0.16844920 #28B463
    ## 47          NA     3 0.0000000 0.17647059 0.19318182 0.35294118 #59C981
    ## 48          NA     2 0.0000000 0.17647059 0.19318182 0.35294118 #59C981
    ## 49          NA     3 0.2414773 0.52941176 0.19318182 0.47058824 #28B463
    ## 50          NA     2 0.2414773 0.52941176 0.19318182 0.47058824 #28B463
    ## 51          NA     3 0.5120851 0.16844920 0.06746032 0.16844920 #28B463
    ## 52          NA     2 0.5120851 0.16844920 0.06746032 0.16844920 #28B463
    ## 53          NA     3 0.4446248 0.00000000 0.06746032 0.16844920 #28B463
    ## 54          NA     2 0.4446248 0.00000000 0.06746032 0.16844920 #28B463
    ## 55          NA     3 0.5120851 0.00000000 0.06746032 0.16844920 #28B463
    ## 56          NA     2 0.5120851 0.00000000 0.06746032 0.16844920 #28B463
    ## 
    ## $type
    ## [1] "color"
    ## 
    ## $vSize
    ## [1] "frequency"
    ## 
    ## $vColor
    ## [1] "group_color"
    ## 
    ## $stdErr
    ## [1] "frequency"
    ## 
    ## $algorithm
    ## [1] "pivotSize"
    ## 
    ## $vpCoorX
    ## [1] 0.02812148 0.97187852
    ## 
    ## $vpCoorY
    ## [1] 0.01968504 0.91031496
    ## 
    ## $aspRatio
    ## [1] 1.483512
    ## 
    ## $range
    ## [1] NA NA
    ## 
    ## $mapping
    ## [1] NA NA NA
    ## 
    ## $draw
    ## [1] TRUE

``` r
tree_map_3(data = avg_dept_weight_13, "crop", "expert_in", "ave_cat_weighted", "group_color", title="weighted")
```

    ## `summarise()` has grouped output by 'crop', 'expert_in', 'ave_cat_weighted'.
    ## You can override using the `.groups` argument.

![](README_files/figure-gfm/questoin_13-2.png)<!-- -->

    ## $tm
    ##        crop          expert_in       ave_cat_weighted vSize  vColor stdErr
    ## 1    Banana          Antioquia    Every 5 to 6 cycles    10 #FFF2CC     10
    ## 2    Banana          Antioquia                   <NA>    10 #FFF2CC     10
    ## 3    Banana             Caldas Every 7 or more cycles     1 #FFDA00      1
    ## 4    Banana             Caldas                   <NA>     1 #FFDA00      1
    ## 5    Banana              Cesar Every 7 or more cycles     2 #FFDA00      2
    ## 6    Banana              Cesar                   <NA>     2 #FFDA00      2
    ## 7    Banana              Chocó Every 7 or more cycles     1 #FFDA00      1
    ## 8    Banana              Chocó                   <NA>     1 #FFDA00      1
    ## 9    Banana              Huila Every 7 or more cycles     1 #FFDA00      1
    ## 10   Banana              Huila                   <NA>     1 #FFDA00      1
    ## 11   Banana         La Guajira Every 7 or more cycles     8 #FFDA00      8
    ## 12   Banana         La Guajira                   <NA>     8 #FFDA00      8
    ## 13   Banana          Magdalena Every 7 or more cycles    10 #FFDA00     10
    ## 14   Banana          Magdalena                   <NA>    10 #FFDA00     10
    ## 15   Banana               <NA>                   <NA>    35 #FFDA00     35
    ## 16   Banana            Quindío Every 7 or more cycles     1 #FFDA00      1
    ## 17   Banana            Quindío                   <NA>     1 #FFDA00      1
    ## 18   Banana          Risaralda Every 7 or more cycles     1 #FFDA00      1
    ## 19   Banana          Risaralda                   <NA>     1 #FFDA00      1
    ## 20 Plantain          Antioquia    Every 5 to 6 cycles     2 #28B463      2
    ## 21 Plantain          Antioquia                   <NA>     2 #28B463      2
    ## 22 Plantain             Arauca    Every 3 to 4 cycles     2 #BEF4BE      2
    ## 23 Plantain             Arauca                   <NA>     2 #BEF4BE      2
    ## 24 Plantain          Atlántico Every 7 or more cycles     1 #59C981      1
    ## 25 Plantain          Atlántico                   <NA>     1 #59C981      1
    ## 26 Plantain            Bolívar Every 7 or more cycles     1 #59C981      1
    ## 27 Plantain            Bolívar                   <NA>     1 #59C981      1
    ## 28 Plantain             Caldas    Every 5 to 6 cycles     6 #28B463      6
    ## 29 Plantain             Caldas                   <NA>     6 #28B463      6
    ## 30 Plantain           Casanare    Every 5 to 6 cycles     2 #28B463      2
    ## 31 Plantain           Casanare                   <NA>     2 #28B463      2
    ## 32 Plantain              Chocó Every 7 or more cycles     1 #59C981      1
    ## 33 Plantain              Chocó                   <NA>     1 #59C981      1
    ## 34 Plantain            Córdoba Every 7 or more cycles     1 #59C981      1
    ## 35 Plantain            Córdoba                   <NA>     1 #59C981      1
    ## 36 Plantain              Huila Every 7 or more cycles     1 #59C981      1
    ## 37 Plantain              Huila                   <NA>     1 #59C981      1
    ## 38 Plantain         La Guajira Every 7 or more cycles     3 #59C981      3
    ## 39 Plantain         La Guajira                   <NA>     3 #59C981      3
    ## 40 Plantain          Magdalena Every 7 or more cycles     3 #59C981      3
    ## 41 Plantain          Magdalena                   <NA>     3 #59C981      3
    ## 42 Plantain               Meta    Every 1 or 2 cycles    10 #8CDE9F     10
    ## 43 Plantain               Meta                   <NA>    10 #8CDE9F     10
    ## 44 Plantain               <NA>                   <NA>    51 #59C981     51
    ## 45 Plantain Norte De Santander Every 7 or more cycles     1 #59C981      1
    ## 46 Plantain Norte De Santander                   <NA>     1 #59C981      1
    ## 47 Plantain            Quindío    Every 5 to 6 cycles     6 #28B463      6
    ## 48 Plantain            Quindío                   <NA>     6 #28B463      6
    ## 49 Plantain          Risaralda    Every 5 to 6 cycles     8 #28B463      8
    ## 50 Plantain          Risaralda                   <NA>     8 #28B463      8
    ## 51 Plantain          Santander Every 7 or more cycles     1 #59C981      1
    ## 52 Plantain          Santander                   <NA>     1 #59C981      1
    ## 53 Plantain              Sucre Every 7 or more cycles     1 #59C981      1
    ## 54 Plantain              Sucre                   <NA>     1 #59C981      1
    ## 55 Plantain             Tolima Every 7 or more cycles     1 #59C981      1
    ## 56 Plantain             Tolima                   <NA>     1 #59C981      1
    ##    vColorValue level        x0         y0          w          h   color
    ## 1           NA     3 0.5930233 0.42857143 0.20348837 0.57142857 #FFF2CC
    ## 2           NA     2 0.5930233 0.42857143 0.20348837 0.57142857 #FFF2CC
    ## 3           NA     3 0.8643411 0.25714286 0.06782946 0.17142857 #FFDA00
    ## 4           NA     2 0.8643411 0.25714286 0.06782946 0.17142857 #FFDA00
    ## 5           NA     3 0.5930233 0.00000000 0.27131783 0.08571429 #FFDA00
    ## 6           NA     2 0.5930233 0.00000000 0.27131783 0.08571429 #FFDA00
    ## 7           NA     3 0.9321705 0.25714286 0.06782946 0.17142857 #FFDA00
    ## 8           NA     2 0.9321705 0.25714286 0.06782946 0.17142857 #FFDA00
    ## 9           NA     3 0.8643411 0.08571429 0.06782946 0.17142857 #FFDA00
    ## 10          NA     2 0.8643411 0.08571429 0.06782946 0.17142857 #FFDA00
    ## 11          NA     3 0.5930233 0.08571429 0.27131783 0.34285714 #FFDA00
    ## 12          NA     2 0.5930233 0.08571429 0.27131783 0.34285714 #FFDA00
    ## 13          NA     3 0.7965116 0.42857143 0.20348837 0.57142857 #FFDA00
    ## 14          NA     2 0.7965116 0.42857143 0.20348837 0.57142857 #FFDA00
    ## 15          NA     1 0.5930233 0.00000000 0.40697674 1.00000000 #FFDA00
    ## 16          NA     3 0.9321705 0.08571429 0.06782946 0.17142857 #FFDA00
    ## 17          NA     2 0.9321705 0.08571429 0.06782946 0.17142857 #FFDA00
    ## 18          NA     3 0.8643411 0.00000000 0.13565891 0.08571429 #FFDA00
    ## 19          NA     2 0.8643411 0.00000000 0.13565891 0.08571429 #FFDA00
    ## 20          NA     3 0.1976744 0.15126050 0.15374677 0.15126050 #28B463
    ## 21          NA     2 0.1976744 0.15126050 0.15374677 0.15126050 #28B463
    ## 22          NA     3 0.1976744 0.00000000 0.15374677 0.15126050 #BEF4BE
    ## 23          NA     2 0.1976744 0.00000000 0.15374677 0.15126050 #BEF4BE
    ## 24          NA     3 0.4722222 0.43315508 0.12080103 0.09625668 #59C981
    ## 25          NA     2 0.4722222 0.43315508 0.12080103 0.09625668 #59C981
    ## 26          NA     3 0.4722222 0.33689840 0.12080103 0.09625668 #59C981
    ## 27          NA     2 0.4722222 0.33689840 0.12080103 0.09625668 #59C981
    ## 28          NA     3 0.4447674 0.52941176 0.14825581 0.47058824 #28B463
    ## 29          NA     2 0.4447674 0.52941176 0.14825581 0.47058824 #28B463
    ## 30          NA     3 0.3514212 0.33689840 0.12080103 0.19251337 #28B463
    ## 31          NA     2 0.3514212 0.33689840 0.12080103 0.19251337 #28B463
    ## 32          NA     3 0.3514212 0.22459893 0.10354374 0.11229947 #59C981
    ## 33          NA     2 0.3514212 0.22459893 0.10354374 0.11229947 #59C981
    ## 34          NA     3 0.3514212 0.11229947 0.10354374 0.11229947 #59C981
    ## 35          NA     2 0.3514212 0.11229947 0.10354374 0.11229947 #59C981
    ## 36          NA     3 0.3514212 0.00000000 0.10354374 0.11229947 #59C981
    ## 37          NA     2 0.3514212 0.00000000 0.10354374 0.11229947 #59C981
    ## 38          NA     3 0.0000000 0.00000000 0.19767442 0.17647059 #59C981
    ## 39          NA     2 0.0000000 0.00000000 0.19767442 0.17647059 #59C981
    ## 40          NA     3 0.1976744 0.30252101 0.15374677 0.22689076 #59C981
    ## 41          NA     2 0.1976744 0.30252101 0.15374677 0.22689076 #59C981
    ## 42          NA     3 0.0000000 0.52941176 0.24709302 0.47058824 #8CDE9F
    ## 43          NA     2 0.0000000 0.52941176 0.24709302 0.47058824 #8CDE9F
    ## 44          NA     1 0.0000000 0.00000000 0.59302326 1.00000000 #59C981
    ## 45          NA     3 0.4549649 0.16844920 0.06902916 0.16844920 #59C981
    ## 46          NA     2 0.4549649 0.16844920 0.06902916 0.16844920 #59C981
    ## 47          NA     3 0.0000000 0.17647059 0.19767442 0.35294118 #28B463
    ## 48          NA     2 0.0000000 0.17647059 0.19767442 0.35294118 #28B463
    ## 49          NA     3 0.2470930 0.52941176 0.19767442 0.47058824 #28B463
    ## 50          NA     2 0.2470930 0.52941176 0.19767442 0.47058824 #28B463
    ## 51          NA     3 0.5239941 0.16844920 0.06902916 0.16844920 #59C981
    ## 52          NA     2 0.5239941 0.16844920 0.06902916 0.16844920 #59C981
    ## 53          NA     3 0.4549649 0.00000000 0.06902916 0.16844920 #59C981
    ## 54          NA     2 0.4549649 0.00000000 0.06902916 0.16844920 #59C981
    ## 55          NA     3 0.5239941 0.00000000 0.06902916 0.16844920 #59C981
    ## 56          NA     2 0.5239941 0.00000000 0.06902916 0.16844920 #59C981
    ## 
    ## $type
    ## [1] "color"
    ## 
    ## $vSize
    ## [1] "frequency"
    ## 
    ## $vColor
    ## [1] "group_color"
    ## 
    ## $stdErr
    ## [1] "frequency"
    ## 
    ## $algorithm
    ## [1] "pivotSize"
    ## 
    ## $vpCoorX
    ## [1] 0.02812148 0.97187852
    ## 
    ## $vpCoorY
    ## [1] 0.01968504 0.91031496
    ## 
    ## $aspRatio
    ## [1] 1.483512
    ## 
    ## $range
    ## [1] NA NA
    ## 
    ## $mapping
    ## [1] NA NA NA
    ## 
    ## $draw
    ## [1] TRUE

``` r
#Map of Colombia  
#non weighted
nal_q13_no_weight<- question_13 %>% group_by(expert_in) %>%
  summarise(average= mean(as.numeric(numeric_answer))) %>%
  group_by(average) %>% 
  mutate(cat= category_by_mean_by_question(language = "en", mean = average, question =13))%>%
  rename(EKE.expert.in = expert_in)
```

    ## Warning: There was 1 warning in `mutate()`.
    ## ℹ In argument: `cat = category_by_mean_by_question(...)`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length

``` r
nal_q13_no_weight<- full_join(codes_department, nal_q13_no_weight)
```

    ## Joining with `by = join_by(EKE.expert.in)`

``` r
nal_q13_no_weight$cat<- factor(nal_q13_no_weight$cat, levels = c("Every 1 or 2 cycles", "Every 3 to 4 cycles", "Every 5 to 6 cycles",  "Every 7 or more cycles", "Not Sure"))
colmap(departamentos, data = nal_q13_no_weight, data_id = "id_depto", var = "cat")+
  scale_fill_manual(values = palette_soil(length(unique(nal_q13_no_weight$cat))-1), na.value = "#eeeeee")
```

    ## Scale for fill is already present.
    ## Adding another scale for fill, which will replace the existing scale.

![](README_files/figure-gfm/questoin_13-3.png)<!-- -->

``` r
# weighted
nal_q13_weight<- inner_join(question_13, experience_of_each_expert)
```

    ## Joining with `by = join_by(crop, expert_ID, expert_in)`

``` r
nal_q13_weight<- nal_q13_weight %>%
  group_by(expert_in) %>%
  mutate(numeric_answer=as.numeric(numeric_answer)) %>%
  summarise(average_weighted= weighted.mean(numeric_answer, weights)) %>% 
  group_by(average_weighted) %>%
  mutate(cat_weighted= category_by_mean_by_question(language = "en", mean = average_weighted, question =13)) %>%
  rename(EKE.expert.in=expert_in)
```

    ## Warning: There was 1 warning in `mutate()`.
    ## ℹ In argument: `cat_weighted = category_by_mean_by_question(...)`.
    ## ℹ In group 0: .
    ## Caused by warning:
    ## ! There was 1 warning in `filter()`.
    ## ℹ In argument: `number == question & number_to_category == mean`.
    ## Caused by warning in `number_to_category == mean`:
    ## ! longer object length is not a multiple of shorter object length

``` r
nal_q13_weight<- full_join(codes_department, nal_q13_weight)
```

    ## Joining with `by = join_by(EKE.expert.in)`

``` r
nal_q13_weight$cat_weighted<- factor(nal_q13_weight$cat_weighted, levels = c("Every 1 or 2 cycles", "Every 3 to 4 cycles", "Every 5 to 6 cycles",  "Every 7 or more cycles", "Not Sure"))
colmap(departamentos, data = nal_q13_weight, data_id = "id_depto", var = "cat_weighted")+
  scale_fill_manual(values = palette_soil(length(unique(nal_q13_weight$cat))-1), na.value = "#eeeeee")
```

    ## Scale for fill is already present.
    ## Adding another scale for fill, which will replace the existing scale.

![](README_files/figure-gfm/questoin_13-4.png)<!-- -->
