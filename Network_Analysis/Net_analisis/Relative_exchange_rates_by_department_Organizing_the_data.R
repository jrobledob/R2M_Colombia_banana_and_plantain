# Upload the network of panting material from github
net_plant_mat<- read.csv("https://raw.githubusercontent.com/jrobledob/R2M_Colombia_banana_and_plantain/main/Data/DATA_MAP_Network_of_Planting_Material_2023_12_08.csv", header = TRUE, row.names = 1)
head(net_plant_mat)

#SUP_Proportion_of_movement_of_planting_materials_by_departments.csv and then change all the elements that contain the letter "B" to "Banana" and all the elements that contain P to "Plantain"
prob_exchange_PM <- read.csv("c:/Users/jrobl/OneDrive - University of Florida/Documents/TA_2023_R2M/R2M_Colombia_banana_and_plantain/Data/SUP_Proportion_of_movement_of_planting_materials_by_departments.csv")

prob_exchange_PM <- prob_exchange_PM %>%
  mutate(Cultivo = ifelse(grepl("B", Value), "Banana", "Plantain"))
#delete the column Value from the prob_exchange_PM data set
prob_exchange_PM <- prob_exchange_PM %>%
  select(-Value)
# The rows are duplicated so select the rows that are not duplicated
prob_exchange_PM <- prob_exchange_PM[!duplicated(prob_exchange_PM),]

#filter the data set prob_exchange_PM so that Crop == "Banana"
prob_exchange_banana <- prob_exchange_PM %>%
  filter(Cultivo == "Banana")
# the first column of prob_exchange_banana need to be changed to "To" and the second column to "From"
colnames(prob_exchange_banana) <- c("To", "From", "Proportion", "Crop")
# # In the filter data multiply the value of the 'Proportion' column by the value of the 'Banano' column in the eva_filteres data set when the column Departamento is equal to the value of the 'To' column in the filter data set
# for (i in 1:nrow(prob_exchange_banana)){
#   prob_exchange_banana[i, "Proportion"] <- prob_exchange_banana[i, "Proportion"] * eva_filteres[eva_filteres$Departamento == prob_exchange_banana[i, "To"], "Banano"]
# }
#SUP_Proportion_of_movement_of_planting_materials_by_departments.csv and then change all the elements that contain the letter "B" to "Banana" and all the elements that contain P to "Plantain"
prob_exchange_PM <- read.csv("c:/Users/jrobl/OneDrive - University of Florida/Documents/TA_2023_R2M/R2M_Colombia_banana_and_plantain/Data/SUP_Proportion_of_movement_of_planting_materials_by_departments.csv")





prob_exchange_PM <- prob_exchange_PM %>%
  mutate(Cultivo = ifelse(grepl("B", Value), "Banana", "Plantain"))
#delete the column Value from the prob_exchange_PM data set
prob_exchange_PM <- prob_exchange_PM %>%
  select(-Value)
# The rows are duplicated so select the rows that are not duplicated
prob_exchange_PM <- prob_exchange_PM[!duplicated(prob_exchange_PM),]


#filter the data set prob_exchange_PM so that Crop == "Banana"
prob_exchange_banana <- prob_exchange_PM %>%
  filter(Cultivo == "Banana")
# the first column of prob_exchange_banana need to be changed to "To" and the second column to "From"
colnames(prob_exchange_banana) <- c("To", "From", "Proportion", "Crop")
# # In the filter data multiply the value of the 'Proportion' column by the value of the 'Banano' column in the eva_filteres data set when the column Departamento is equal to the value of the 'To' column in the filter data set
# for (i in 1:nrow(prob_exchange_banana)){
#   prob_exchange_banana[i, "Proportion"] <- prob_exchange_banana[i, "Proportion"] * eva_filteres[eva_filteres$Departamento == prob_exchange_banana[i, "To"], "Banano"]
# }




#filter the data set prob_exchange_PM so that Crop == "Plantain"
prob_exchange_plantain <- prob_exchange_PM %>%
  filter(Cultivo == "Plantain")
#Change "Norte De Santander" to "Norte de Santander" in the uni_deptos_plantain to maintain the same name as in the eva_filteres data set
prob_exchange_plantain$To[prob_exchange_plantain$To == "Norte De Santander"] <- "Norte de Santander"
#chage "Valle Del Cauca" to "Valle del Cauca" in the uni_deptos_plantain to maintain the same name as in the eva_filteres data set
prob_exchange_plantain$To[prob_exchange_plantain$To == "Valle Del Cauca"] <- "Valle del Cauca"
colnames(prob_exchange_plantain) <- c("From", "To", "Proportion", "Crop")
#change "Caqueta" to "Caquetá" in the uni_deptos_plantain to maintain the same name as in the eva_filteres data set
prob_exchange_plantain$To[prob_exchange_plantain$To == "Caqueta"] <- "Caquetá"

#Change "Norte De Santander" to "Norte de Santander" in the uni_deptos_plantain to maintain the same name as in the eva_filteres data set
prob_exchange_plantain$From[prob_exchange_plantain$From == "Norte De Santander"] <- "Norte de Santander"
#chage "Valle Del Cauca" to "Valle del Cauca" in the uni_deptos_plantain to maintain the same name as in the eva_filteres data set
prob_exchange_plantain$From[prob_exchange_plantain$From == "Valle Del Cauca"] <- "Valle del Cauca"
colnames(prob_exchange_plantain) <- c("From", "To", "Proportion", "Crop")
#change "Caqueta" to "Caquetá" in the uni_deptos_plantain to maintain the same name as in the eva_filteres data set
prob_exchange_plantain$From[prob_exchange_plantain$From == "Caqueta"] <- "Caquetá"




# Identify the unique values of the columns 'From' and 'To'
unique_values <- colnames(net_plant_mat)
# Create an empty matrix with the unique values of the columns 'From' and 'To'
adjacency_matrix_banana <- matrix(NA, nrow = length(unique_values), ncol = length(unique_values))
# Add names to the matrix
rownames(adjacency_matrix_banana) <- unique_values
colnames(adjacency_matrix_banana) <- unique_values

# Replace '.' with ' ' in column names and row names of the matrix
colnames(adjacency_matrix_banana) <- gsub("\\.", " ", colnames(adjacency_matrix_banana))
rownames(adjacency_matrix_banana) <- gsub("\\.", " ", rownames(adjacency_matrix_banana))


# Fill the matrix with the values of the column 'Proportion' so that the rows are the values of the column 'From' and the columns are the values of the column 'To'
for (i in 1:nrow(prob_exchange_banana)){
  from <- as.character(prob_exchange_banana[i, "From"])
  to <- as.character(prob_exchange_banana[i, "To"])
  proportion <- prob_exchange_banana %>% slice(i) %>% pull(Proportion)
  print(i)
  adjacency_matrix_banana[from, to] <- proportion
}





#save the adjacency matrix as a csv file
#write.csv(adjacency_matrix, "./adjacency_matrix_prob_movement.csv", row.names = FALSE)




adjacency_matrix_plantain <- matrix(NA, nrow = length(unique_values), ncol = length(unique_values))
# Add names to the matrix
rownames(adjacency_matrix_plantain) <- unique_values
colnames(adjacency_matrix_plantain) <- unique_values

# Replace '.' with ' ' in column names and row names of the matrix
colnames(adjacency_matrix_plantain) <- gsub("\\.", " ", colnames(adjacency_matrix_plantain))
rownames(adjacency_matrix_plantain) <- gsub("\\.", " ", rownames(adjacency_matrix_plantain))


# Fill the matrix with the values of the column 'Proportion' so that the rows are the values of the column 'From' and the columns are the values of the column 'To'
for (i in 1:nrow(prob_exchange_plantain)){
  from <- as.character(prob_exchange_plantain[i, "From"])
  to <- as.character(prob_exchange_plantain[i, "To"])
  proportion <- prob_exchange_plantain %>% slice(i) %>% pull(Proportion)
  print(i)
  adjacency_matrix_plantain[from, to] <- proportion
}


# 
# write.csv(adjacency_matrix_banana, "C:/Users/jrobl/OneDrive - University of Florida/Documents/TA_2023_R2M/R2M_Colombia_banana_and_plantain/Data/DATA_MAP_Rel_Prop_banana_Network_of_Planting_Material.csv", row.names = TRUE)
# write.csv(adjacency_matrix_plantain, "C:/Users/jrobl/OneDrive - University of Florida/Documents/TA_2023_R2M/R2M_Colombia_banana_and_plantain/Data/DATA_MAP_Rel_Prop_plantain_Network_of_Planting_Material.csv", row.names = TRUE)
