Analisis of individual Questions EKE Colombia - Banano and Plantain 2023
================
Jacobo Robledo
2024-07-12

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

#### `summarise_frequencies` Function

**Description:**  
This function is designed to calculate and summarize frequencies within
a dataset. It groups the data based on a set of primary columns,
computes the total count per group, then groups the data again using a
second set of columns to calculate the frequency and the average
frequency. Finally, it averages these frequencies to derive a mean
frequency for each unique combination in the second group.

**Parameters:**

- `data`: A data frame containing the dataset to be analyzed.
- `first_group_cols`: A vector of column names from the data frame used
  for the initial grouping.
- `second_group_cols`: A vector of column names from the data frame used
  for the subsequent grouping and frequency calculation.

**Details:**  
The function utilizes `dplyr` functions for data manipulation. It first
groups the data with `first_group_cols` and computes a total count for
each group. The data is then regrouped using `second_group_cols`, where
it calculates both the frequency and average frequency. The final
operation is summarizing these results to find the mean of average
frequencies for each group combination.

**Returns:**  
A data frame containing the mean of average frequencies for each unique
combination of `second_group_cols`.

**Example Usage:**  
`summarise_frequencies(question_12_long, c(\"crop\", \"expert_in\"), c(\"crop\", \"expert_in\", \"Add_parameters_english\"))`

#### `create_sankey` Function

**Description:**  
This function creates a Sankey diagram from a given dataset. It prepares
the data by selecting necessary columns and restructuring them for use
in the Sankey diagram. Nodes are created from the source and target
columns, and a Sankey diagram is generated using the `networkD3`
package.

**Parameters:**

- `data`: A data frame containing the data for the Sankey diagram.
- `source`: The name of the column in ‘data’ to be used as the source of
  the links.
- `target`: The name of the column in ‘data’ to be used as the target of
  the links.
- `value`: The name of the column in ‘data’ that provides values for the
  link widths.
- `ColourScal`: A character string representing the JavaScript command
  for D3 color scale.

**Details:**  
The function first selects the specified source, target, and value
columns from the data. Then, it creates a set of nodes based on the
unique values from the source and target columns. The source and target
columns are mapped to these nodes, and the `sankeyNetwork` function from
the `networkD3` package is used to create and print the Sankey diagram.

**Returns:**  
A Sankey diagram visualizing the flow between different nodes as
specified by the source and target, with the link widths proportional to
the specified value.

**Example Usage:**  
`# Assuming 'question_12_long_frequencies' is your dataset and 'ColourScal' is defined sankey <- create_sankey(   data = question_12_long_frequencies,   source = "expert_in",   target = "Add_parameters_english",   value = "freq_unique",   ColourScal = 'd3.scaleOrdinal().range(["#FDE725FF","#B4DE2CFF","#6DCD59FF","#35B779FF","#1F9E89FF","#26828EFF","#31688EFF","#3E4A89FF","#482878FF","#440154FF"])' )`

## Question 1: How many years of experience do you have in each department?

![](README_files/figure-gfm/question_1-1.png)<!-- -->![](README_files/figure-gfm/question_1-2.png)<!-- -->

#### Descriptive statistics:

Total number of experts that answer this question= 101

Mode in all the surveys= 5 to 9

Mean in all the surveys=5 to 9

Descriptive statistics by crop=

## Question 2: Which category or categories best describe your experience? Please check all that apply.

![](README_files/figure-gfm/question_2-1.png)<!-- -->![](README_files/figure-gfm/question_2-2.png)<!-- -->

## Question 3: Do you work in a public or private institution/company?

![](README_files/figure-gfm/queestion_3-1.png)<!-- -->![](README_files/figure-gfm/queestion_3-2.png)<!-- -->

## Question 4: What is your level of education?

![](README_files/figure-gfm/question_4-1.png)<!-- -->![](README_files/figure-gfm/question_4-2.png)<!-- -->

## Question 5: What are the most prevalent pests and diseases of bananas in the regions where you have experience? Please check all that apply.

![](README_files/figure-gfm/question_5-1.png)<!-- -->![](README_files/figure-gfm/question_5-2.png)<!-- -->![](README_files/figure-gfm/question_5-3.png)<!-- -->![](README_files/figure-gfm/question_5-4.png)<!-- -->![](README_files/figure-gfm/question_5-5.png)<!-- -->

## Question 6: What level of knowledge do producers have about the phytosanitary status of the banana planting material they use?

![](README_files/figure-gfm/question_6-1.png)<!-- -->![](README_files/figure-gfm/question_6-2.png)<!-- -->![](README_files/figure-gfm/question_6-3.png)<!-- -->![](README_files/figure-gfm/question_6-4.png)<!-- -->

## Question 7: What is the likelihood of each region reporting an outbreak of a pest or disease in banana plantations?

![](README_files/figure-gfm/question_7-1.png)<!-- -->![](README_files/figure-gfm/question_7-2.png)<!-- -->![](README_files/figure-gfm/question_7-3.png)<!-- -->![](README_files/figure-gfm/question_7-4.png)<!-- -->

## Question 8: What is the perceived effectiveness of the policies implemented by the government to ensure phytosanitary safety in banana production systems?

![](README_files/figure-gfm/question_8-1.png)<!-- -->![](README_files/figure-gfm/question_8-2.png)<!-- -->![](README_files/figure-gfm/question_8-3.png)<!-- -->![](README_files/figure-gfm/question_8-4.png)<!-- -->

## Question 9: What is the level of training of producers on phytosanitary issues associated with banana production?

![](README_files/figure-gfm/question_9-1.png)<!-- -->![](README_files/figure-gfm/question_9-2.png)<!-- -->![](README_files/figure-gfm/question_9-3.png)<!-- -->![](README_files/figure-gfm/question_9-4.png)<!-- -->

## Question 10: What are the sources where banana planting materials are acquired, and in what percentage? Ensure that the contents of each row add up to 100%.

![](README_files/figure-gfm/question_10-1.png)<!-- -->![](README_files/figure-gfm/question_10-2.png)<!-- -->![](README_files/figure-gfm/question_10-3.png)<!-- -->![](README_files/figure-gfm/question_10-4.png)<!-- -->![](README_files/figure-gfm/question_10-5.png)<!-- -->![](README_files/figure-gfm/question_10-6.png)<!-- -->![](README_files/figure-gfm/question_10-7.png)<!-- -->![](README_files/figure-gfm/question_10-8.png)<!-- -->![](README_files/figure-gfm/question_10-9.png)<!-- -->![](README_files/figure-gfm/question_10-10.png)<!-- -->

## Question 11: What is the proportion of formal and informal trade of banana planting material?

![](README_files/figure-gfm/questoin_11-1.png)<!-- -->![](README_files/figure-gfm/questoin_11-2.png)<!-- -->![](README_files/figure-gfm/questoin_11-3.png)<!-- -->![](README_files/figure-gfm/questoin_11-4.png)<!-- -->

## Question 12: Where and in what percentages does each place obtain its planting material? Ensure that the contents of each row add up to 100%.

![](README_files/figure-gfm/question_12-1.png)<!-- -->![](README_files/figure-gfm/question_12-2.png)<!-- -->![](README_files/figure-gfm/question_12-3.png)<!-- -->![](README_files/figure-gfm/question_12-4.png)<!-- -->![](README_files/figure-gfm/question_12-5.png)<!-- -->![](README_files/figure-gfm/question_12-6.png)<!-- -->

## Question 13: How frequent is the use of new planting material to renew the production system?

![](README_files/figure-gfm/questoin_13-1.png)<!-- -->![](README_files/figure-gfm/questoin_13-2.png)<!-- -->![](README_files/figure-gfm/questoin_13-3.png)<!-- -->![](README_files/figure-gfm/questoin_13-4.png)<!-- -->

## Question 14: What procedures do producers follow to ensure the quality of banana planting material after acquisition? Please indicate all that apply.

![](README_files/figure-gfm/question_14-1.png)<!-- -->![](README_files/figure-gfm/question_14-2.png)<!-- -->![](README_files/figure-gfm/question_14-3.png)<!-- -->![](README_files/figure-gfm/question_14-4.png)<!-- -->![](README_files/figure-gfm/question_14-5.png)<!-- -->![](README_files/figure-gfm/question_14-6.png)<!-- -->![](README_files/figure-gfm/question_14-7.png)<!-- -->![](README_files/figure-gfm/question_14-8.png)<!-- -->![](README_files/figure-gfm/question_14-9.png)<!-- -->![](README_files/figure-gfm/question_14-10.png)<!-- -->

## Question 15: What are the current practices for pest and disease management that banana producers are implementing in your areas of expertise?

![](README_files/figure-gfm/question_15-1.png)<!-- -->![](README_files/figure-gfm/question_15-2.png)<!-- -->![](README_files/figure-gfm/question_15-3.png)<!-- -->![](README_files/figure-gfm/question_15-4.png)<!-- -->![](README_files/figure-gfm/question_15-5.png)<!-- -->![](README_files/figure-gfm/question_15-6.png)<!-- -->![](README_files/figure-gfm/question_15-7.png)<!-- -->![](README_files/figure-gfm/question_15-8.png)<!-- -->![](README_files/figure-gfm/question_15-9.png)<!-- -->![](README_files/figure-gfm/question_15-10.png)<!-- -->

## Question 16: What percentage of chemical control practices (insecticides, fungicides, etc.) are implemented correctly in banana production systems in the places where you are an expert?

![](README_files/figure-gfm/questoin_16-1.png)<!-- -->![](README_files/figure-gfm/questoin_16-2.png)<!-- -->![](README_files/figure-gfm/questoin_16-3.png)<!-- -->![](README_files/figure-gfm/questoin_16-4.png)<!-- -->

## Question 17: What percentage of biological control practices (beneficial insects, microbial controls) are implemented correctly in banana production systems where you have experience?

![](README_files/figure-gfm/question_17-1.png)<!-- -->![](README_files/figure-gfm/question_17-2.png)<!-- -->![](README_files/figure-gfm/question_17-3.png)<!-- -->![](README_files/figure-gfm/question_17-4.png)<!-- -->

## Question 18: What percentage of cultural control practices (crop rotation, sanitation) are implemented correctly in banana production systems in the areas where you are an expert?

![](README_files/figure-gfm/question_18-1.png)<!-- -->![](README_files/figure-gfm/question_18-2.png)<!-- -->![](README_files/figure-gfm/question_18-3.png)<!-- -->![](README_files/figure-gfm/question_18-4.png)<!-- -->

## Question 19: What percentage of physical control practices (traps, barriers) are implemented correctly in banana production systems in the areas where you are an expert?

![](README_files/figure-gfm/question_19-1.png)<!-- -->![](README_files/figure-gfm/question_19-2.png)<!-- -->![](README_files/figure-gfm/question_19-3.png)<!-- -->![](README_files/figure-gfm/question_19-4.png)<!-- -->

## Question 20: What percentage of biosecurity management practices (quarantine, disinfection) are implemented correctly in banana production systems in the areas where you are an expert?

![](README_files/figure-gfm/question_20-1.png)<!-- -->![](README_files/figure-gfm/question_20-2.png)<!-- -->![](README_files/figure-gfm/question_20-3.png)<!-- -->![](README_files/figure-gfm/question_20-4.png)<!-- -->

## Question 21: What is the average frequency of monitoring for pests and diseases in banana production systems in the areas where you have experience?

![](README_files/figure-gfm/question_21-1.png)<!-- -->![](README_files/figure-gfm/question_21-2.png)<!-- -->![](README_files/figure-gfm/question_21-3.png)<!-- -->![](README_files/figure-gfm/question_21-4.png)<!-- -->

## Question 22: What is the efficacy perceived by producers of chemical control (pesticides, fungicides) in the prevention or management of banana diseases in the areas where you have experience?

![](README_files/figure-gfm/question_22-1.png)<!-- -->![](README_files/figure-gfm/question_22-2.png)<!-- -->![](README_files/figure-gfm/question_22-3.png)<!-- -->![](README_files/figure-gfm/question_22-4.png)<!-- -->

## Question 23: What is the efficacy perceived by producers of biological control (beneficial insects, microbial controls) in the prevention or management of banana diseases in the areas where you are an expert?

![](README_files/figure-gfm/question_23-1.png)<!-- -->![](README_files/figure-gfm/question_23-2.png)<!-- -->![](README_files/figure-gfm/question_23-3.png)<!-- -->![](README_files/figure-gfm/question_23-4.png)<!-- -->

## Question 24: What is the efficacy perceived by producers of cultural control (crop rotation, sanitation) in the prevention or management of banana diseases in the areas where you are an expert?

![](README_files/figure-gfm/question_24-1.png)<!-- -->![](README_files/figure-gfm/question_24-2.png)<!-- -->![](README_files/figure-gfm/question_24-3.png)<!-- -->![](README_files/figure-gfm/question_24-4.png)<!-- -->

## Question 25: What is the efficacy perceived by producers of biosecurity measures (quarantine, disinfection) in the prevention or management of banana diseases in the areas where you are an expert?

![](README_files/figure-gfm/question_25-1.png)<!-- -->![](README_files/figure-gfm/question_25-2.png)<!-- -->![](README_files/figure-gfm/question_25-3.png)<!-- -->![](README_files/figure-gfm/question_25-4.png)<!-- -->

## Question 26: What is the efficacy perceived by producers about surveillance and reporting in the prevention or management of banana diseases in the areas where you are an expert?

![](README_files/figure-gfm/question_26-1.png)<!-- -->![](README_files/figure-gfm/question_26-2.png)<!-- -->![](README_files/figure-gfm/question_26-3.png)<!-- -->![](README_files/figure-gfm/question_26-4.png)<!-- -->

## Question 27: What are the most limiting factors to ensure the adequate implementation of management practices that can maintain an adequate phytosanitary status of banana plantations in the areas where you are an expert?

![](README_files/figure-gfm/question_27-1.png)<!-- -->![](README_files/figure-gfm/question_27-2.png)<!-- -->![](README_files/figure-gfm/question_27-3.png)<!-- -->![](README_files/figure-gfm/question_27-4.png)<!-- -->![](README_files/figure-gfm/question_27-5.png)<!-- -->![](README_files/figure-gfm/question_27-6.png)<!-- -->![](README_files/figure-gfm/question_27-7.png)<!-- -->![](README_files/figure-gfm/question_27-8.png)<!-- -->![](README_files/figure-gfm/question_27-9.png)<!-- -->![](README_files/figure-gfm/question_27-10.png)<!-- -->

## Question 28: How important do you believe the role of migrant or itinerant workers is in the spread of pests and diseases in banana plantations in your areas of specialization?

![](README_files/figure-gfm/question_28-1.png)<!-- -->![](README_files/figure-gfm/question_28-2.png)<!-- -->![](README_files/figure-gfm/question_28-3.png)<!-- -->![](README_files/figure-gfm/question_28-4.png)<!-- -->

## Question 29: To what extent are migrant or itinerant workers implementing biosecurity measures to reduce the possible spread of pests and diseases in the areas where you are an expert?

![](README_files/figure-gfm/question_29-1.png)<!-- -->![](README_files/figure-gfm/question_29-2.png)<!-- -->![](README_files/figure-gfm/question_29-3.png)<!-- -->![](README_files/figure-gfm/question_29-4.png)<!-- -->

## Question 30: What degree of restriction does each area successfully apply to the movement of personnel and visitors within and between plantations?

![](README_files/figure-gfm/question_30-1.png)<!-- -->![](README_files/figure-gfm/question_30-2.png)<!-- -->![](README_files/figure-gfm/question_30-3.png)<!-- -->![](README_files/figure-gfm/question_30-4.png)<!-- -->

## Question 31: What degree of limitation does each area successfully apply to the movement of vehicles and equipment within and between plantations?

![](README_files/figure-gfm/question_31-1.png)<!-- -->![](README_files/figure-gfm/question_31-2.png)<!-- -->![](README_files/figure-gfm/question_31-3.png)<!-- -->![](README_files/figure-gfm/question_31-4.png)<!-- -->

## Question 32: What irrigation system is used in each area? Please check all that apply.

![](README_files/figure-gfm/queestion_32-1.png)<!-- -->![](README_files/figure-gfm/queestion_32-2.png)<!-- -->![](README_files/figure-gfm/queestion_32-3.png)<!-- -->![](README_files/figure-gfm/queestion_32-4.png)<!-- -->![](README_files/figure-gfm/queestion_32-5.png)<!-- -->![](README_files/figure-gfm/queestion_32-6.png)<!-- -->![](README_files/figure-gfm/queestion_32-7.png)<!-- -->![](README_files/figure-gfm/queestion_32-8.png)<!-- -->![](README_files/figure-gfm/queestion_32-9.png)<!-- -->![](README_files/figure-gfm/queestion_32-10.png)<!-- -->

## Question 33: What is the source of water for each region in the area where you are an expert? Please check all that apply.

![](README_files/figure-gfm/queestion_33-1.png)<!-- -->![](README_files/figure-gfm/queestion_33-2.png)<!-- -->![](README_files/figure-gfm/queestion_33-3.png)<!-- -->![](README_files/figure-gfm/queestion_33-4.png)<!-- -->![](README_files/figure-gfm/queestion_33-5.png)<!-- -->![](README_files/figure-gfm/queestion_33-6.png)<!-- -->![](README_files/figure-gfm/queestion_33-7.png)<!-- -->![](README_files/figure-gfm/queestion_33-8.png)<!-- -->![](README_files/figure-gfm/queestion_33-9.png)<!-- -->![](README_files/figure-gfm/queestion_33-10.png)<!-- -->

## Question 34: What regions and in what percentage share a water source for irrigation? Ensure that the contents of each row add up to 100%.

![](README_files/figure-gfm/question_34-1.png)<!-- -->![](README_files/figure-gfm/question_34-2.png)<!-- -->![](README_files/figure-gfm/question_34-3.png)<!-- -->![](README_files/figure-gfm/question_34-4.png)<!-- -->![](README_files/figure-gfm/question_34-5.png)<!-- -->![](README_files/figure-gfm/question_34-6.png)<!-- -->

## Question 35: How is the water for irrigation treated in the areas where you are an expert? Please check all that apply.

![](README_files/figure-gfm/questoin_35-1.png)<!-- -->![](README_files/figure-gfm/questoin_35-2.png)<!-- -->![](README_files/figure-gfm/questoin_35-3.png)<!-- -->![](README_files/figure-gfm/questoin_35-4.png)<!-- -->![](README_files/figure-gfm/questoin_35-5.png)<!-- -->![](README_files/figure-gfm/questoin_35-6.png)<!-- -->![](README_files/figure-gfm/questoin_35-7.png)<!-- -->![](README_files/figure-gfm/questoin_35-8.png)<!-- -->![](README_files/figure-gfm/questoin_35-9.png)<!-- -->![](README_files/figure-gfm/questoin_35-10.png)<!-- -->

## Question 36: What percentage of banana producers are engaged in the production of their own planting material?

![](README_files/figure-gfm/question_36-1.png)<!-- -->![](README_files/figure-gfm/question_36-2.png)<!-- -->![](README_files/figure-gfm/question_36-3.png)<!-- -->![](README_files/figure-gfm/question_36-4.png)<!-- -->

## Question 37: If cost were not a concern, what is the likelihood that these regions would implement biosecurity strategies to mitigate or prevent Foc R4T?

![](README_files/figure-gfm/question_37-1.png)<!-- -->![](README_files/figure-gfm/question_37-2.png)<!-- -->![](README_files/figure-gfm/question_37-3.png)<!-- -->![](README_files/figure-gfm/question_37-4.png)<!-- -->

## Question 38: What regions and in what percentage communicate with each other about managing Foc-R4T? Ensure that the contents of each row add up to 100%.

![](README_files/figure-gfm/question_38-1.png)<!-- -->![](README_files/figure-gfm/question_38-2.png)<!-- -->![](README_files/figure-gfm/question_38-3.png)<!-- -->![](README_files/figure-gfm/question_38-4.png)<!-- -->![](README_files/figure-gfm/question_38-5.png)<!-- -->![](README_files/figure-gfm/question_38-6.png)<!-- -->

## Question 39: What are the risks associated with the introduction or reintroduction of TR4 through any of Colombia’s borders?

![](README_files/figure-gfm/question_39-1.png)<!-- -->![](README_files/figure-gfm/question_39-2.png)<!-- -->![](README_files/figure-gfm/question_39-3.png)<!-- -->![](README_files/figure-gfm/question_39-4.png)<!-- -->

## Question 40: Considering the economic, social, and environmental characteristics of each sub-region, how feasible would it be to contain future outbreaks of R4T in these areas?

![](README_files/figure-gfm/questions_40-1.png)<!-- -->![](README_files/figure-gfm/questions_40-2.png)<!-- -->![](README_files/figure-gfm/questions_40-3.png)<!-- -->![](README_files/figure-gfm/questions_40-4.png)<!-- -->

## Question 41: What risk-associated factor do you believe is significant for the spread of Foc R4T but has not received sufficient efforts to mitigate it? Please check all that apply

![](README_files/figure-gfm/question_41-1.png)<!-- -->![](README_files/figure-gfm/question_41-2.png)<!-- -->![](README_files/figure-gfm/question_41-3.png)<!-- -->![](README_files/figure-gfm/question_41-4.png)<!-- -->![](README_files/figure-gfm/question_41-5.png)<!-- -->![](README_files/figure-gfm/question_41-6.png)<!-- -->![](README_files/figure-gfm/question_41-7.png)<!-- -->![](README_files/figure-gfm/question_41-8.png)<!-- -->![](README_files/figure-gfm/question_41-9.png)<!-- -->![](README_files/figure-gfm/question_41-10.png)<!-- -->

## Preparing Questions for HeatMap:

![](README_files/figure-gfm/heatmap-1.png)<!-- -->
