Analisis of individual Questions EKE Colombia - Banano and Plantain 2023
================
Jacobo Robledo
2023-12-29

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
#Global variables
  #set the color palette for bananas and plantains
  palette_banana <- colorRampPalette(c("#FFDA00","#FFF2CC" ))
  palette_plantain <- colorRampPalette(c("#28B463","#BEF4BE"))
  #data set: individual questions:
  #read individual surveys from GitHub
  num_cols <- length(read.csv("https://raw.githubusercontent.com/jrobledob/R2M_Colombia_banana_and_plantain/main/Data/DATA_Individual_surveys_Banana_and_Plantain_Colombia_Clean_surveys_2023-12-28.csv", nrows = 1, header = TRUE))
  # Create a colClasses vector with "character" for each column
  col_classes <- rep("character", num_cols)
  individual_surveys<- read.csv("https://raw.githubusercontent.com/jrobledob/R2M_Colombia_banana_and_plantain/main/Data/DATA_Individual_surveys_Banana_and_Plantain_Colombia_Clean_surveys_2023-12-28.csv", colClasses = col_classes)
  #reformat columns
  individual_surveys$question_number<- as.integer(individual_surveys$question_number)

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

## Question 2: How many years of experience do you have in each department?

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
