library(dplyr)
source("exploration/helper_functions.R")

# make sure i make good use of shiny
# data analysis
# clean code
# clean repo


####### Downloading Data #######

# demographics, contains all UN country data
demographics <- read.csv("datasets/WPP2024_Demographic_Indicators_Medium.csv.gz")

# filtering to get all Barbados information
demographics <- demographics |> filter(Location == "Barbados")
demographics <- demographics |> drop_one_value_col()

# filtering further since lots of data
population <- demographics |> select(Time, TPopulation1Jan, TPopulation1July, 
                                     TPopulationMale1July, TPopulationFemale1July,
                                     PopDensity, PopSexRatio, MedianAgePop, 
                                     NatChange, NatChangeRT, PopChange, PopGrowthRate,
                                     DoublingTime)
births <- demographics |> select(Time, Births, Births1519, CBR, TFR, NRR, MAC, SRB)
deaths <- demographics |> select(Time, Deaths, DeathsMale, DeathsFemale, CDR)
life_expectancy <- demographics |> select(Time, LEx, LExMale, LExFemale, LE15, LE15Male, 
                                          LE15Female, LE65, LE65Male, LE65Female, LE80,
                                          LE80Male, LE80Female)
mortality <- demographics |> select(Time, InfantDeaths, IMR, LBsurvivingAge1, Under5Deaths, 
                                    Q5, Q0040, Q0040Male, Q0040Female, Q0060, Q0060Male,
                                    Q0060Female, Q1550, Q1550Male, Q1550Female, Q1560,
                                    Q1560Male, Q1560Female)
migrations <- demographics |> select(Time, NetMigrations, CNMR)




####### Cleaning `population` #######
population <- population |> rename("Year" = Time,
                                  "TotalPop1Jan" = TPopulation1Jan,
                                  "TotalPop1July" = TPopulation1July,
                                  "TotalPopMale1July" = TPopulationMale1July,
                                  "TotalPopFemale1July" = TPopulationFemale1July)



####### Cleaning `births` #######
births <- births |> rename("Year" = Time,
                           "Births age 15-19" = Births1519)






####### Cleaning `deaths` #######
deaths <- deaths |> rename("Year" = Time)





####### Cleaning `life_expectancy` #######
life_expectancy <- life_expectancy |> rename("Year" = Time,
                                             "at Birth" = LEx,
                                             "at Birth, Male" = LExMale,
                                             "at Birth, Female" = LExFemale,
                                             "at age 15" = LE15,
                                             "at age 15, Male" = LE15Male,
                                             "at age 15, Female" = LE15Female,
                                             "at age 65" = LE65,
                                             "at age 65, Male" = LE65Male,
                                             "at age 65, Female" = LE65Female,
                                             "at age 80" = LE80,
                                             "at age 80, Male" = LE80Male,
                                             "at age 80, Female" = LE80Female)






####### Cleaning `mortality` #######
mortality <- mortality |> rename("Year" = Time,
                                 "LiveBirthsSurvivingAge1" = LBsurvivingAge1,
                                 "Under5MR" = Q5,
                                 "age 0-40, Total" = Q0040,
                                 "age 0-40, Male" = Q0040Male,
                                 "age 0-40, Female" = Q0040Female,
                                 "age 0-60, Total" = Q0060,
                                 "age 0-60, Male" = Q0060Male,
                                 "age 0-60, Female" = Q0060Female,
                                 "age 15-50, Total" = Q1550,
                                 "age 15-50, Male" = Q1550Male,
                                 "age 15-50, Female" = Q1550Female,
                                 "age 15-60, Total" = Q1560,
                                 "age 15-60, Male" = Q1560Male,
                                 "age 15-60, Female" = Q1560Female)






####### Cleaning `migrations` #######
migrations <- migrations |> rename("Year" = Time)








