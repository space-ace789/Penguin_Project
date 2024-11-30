#CLEANING CODE

#Turned raw code into clean code.

library(tidyverse)
library(palmerpenguins)
library(here)
library(janitor)

#here::here() #used to check that R is running the right project path, this is 

#Penguins raw comes from the palmer penguins package, has already created a file
#path to the data sets.

#WRITE DATA TO CSV USING HERE

#Column names are badly formatted, but shouldn't edit in excel

#write.csv(penguins_raw, here ("data", "penguins_raw.csv"))

#Write.csv creates a csv file of the data, then use here to create the desired file
#path, folder you want to save it in and the name of the thing you want to save in it.
#Here stops you from doing a raw file path, this is not reproducible. 

#This can be done in the console ?? Don't need to redo everytime as have the safe
#version saved to the penguins project. 

#USE SELECT AND HYPHEN TO REMOVE COMMENTS COLUMN

#colnames(penguins_raw) #used to see column names

#penguins_raw <- select(penguins_raw, -(Comments)) #
#THIS IS BAD CODE - if you run again complains you are doing something to a variable
#that doesnt exist, you have overwritten the variable. 
#Need the -before comments or will remove everything except comments

penguins_raw <- read.csv(here("data", "penguins_raw.csv"))
#this brings back the nice clean file of the raw data if you accidentally overwrite.

#new object (so OG not overwritten)
#penguins_clean <- select(penguins_raw, -Comments)
#but we also want to removed the delta columns, dont want to overwrite penguins clean.

#USING PIPING TO REMOVE COMMENTS AND DELTA COLUMNS

#penguins_clean <- penguins_raw %>% #Ctrl Shift M adds piping character quickly.
  select(-Comments) %>%
  select(-starts_with("Delta")) %>% 
  clean_names() #used to make the column names nice, must be at the end or -Comments
#will throw an error as will now be comments NOT Comments. This has changed them to 
#snake case. Things need to be computer AND human readable. 

#Piping character basically says do this and then this and then this to the same thing
#this means it does not overwrite code. 

#Save it
#write_csv(penguins_clean, here ("Data", "penguins_clean.csv"))

#CREATING REUSEABLE FUNCTIONS

#Copy and pasting code is bad practice, want to keep a safe copy of code in case
#transferring to other anlyses goes wrong. 

#cleaning_penguin_columns <- function(raw_data) { #raw data is the thing we want to input into the function
  #it is the thing we want to do stuff too
  #raw_data %>% 
   # clean_names() %>% 
    #select (-comments) %>% 
   # select (-starts_with("delta"))
#}

#penguins_clean <- cleaning_penguin_columns(penguins_raw)

#Stuff in the function should be generic, saves a raw version of a set of commands. 

source(here("Functions", "Cleaning.R"))

#use renv::init() to initialise renv
#use renv::snapshot() #Creates a snapshot of current R packages
#use renv::restore() #loads everything from what you were using in the past/lets you load
  #what someone else was using if they have an renv file.

  print("hello")
  