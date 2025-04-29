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
est_population <- demographics |> select(Time, TPopulation1Jan, TPopulation1July, 
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




####### Cleaning `est_population` #######
est_population <- est_population |> rename("Year" = Time,
                                  "Total Population, as of 1 January" = TPopulation1Jan,
                                  "Total Population, as of 1 July" = TPopulation1July,
                                  "Total Male Population, as of 1 July" = TPopulationMale1July,
                                  "Total Female Population, as of 1 July" = TPopulationFemale1July,
                                  "Population Density, as of 1 July" = PopDensity,
                                  "Population Sex Ratio, as of 1 July" = PopSexRatio,
                                  "Median Age, as of 1 July" = MedianAgePop,
                                  "Natural Change, Births minus Deaths" = NatChange,
                                  "Rate of Natural Change" = NatChangeRT,
                                  "Population Change" = PopChange,
                                  "Population Growth Rate" = PopGrowthRate,
                                  "Population Annual Doubling Time" = DoublingTime)



####### Cleaning `births` #######
births <- births |> rename("Year" = Time,
                           "Births by women aged 15-19" = Births1519,
                           "Crude Birth Rate" = CBR,
                           "Total Fertility Rate" = TFR,
                           "Net Reproduction Rate" = NRR,
                           "Mean Age Childbearing" = MAC,
                           "Sex Ratio at Birth" = SRB)






####### Cleaning `deaths` #######
deaths <- deaths |> rename("Year" = Time,
                           "Total Deaths" = Deaths,
                           "Male Deaths" = DeathsMale,
                           "Female Deaths" = DeathsFemale,
                           "Crude Death Rate" = CDR)





####### Cleaning `life_expectancy` #######
life_expectancy <- life_expectancy |> rename("Year" = Time,
                                             "Total Life Expectancy at Birth" = LEx,
                                             "Male Life Expectancy at Birth" = LExMale,
                                             "Female Life Expectancy at Birth" = LExFemale,
                                             "Total Life Expectancy at age 15" = LE15,
                                             "Male Life Expectancy at age 15" = LE15Male,
                                             "Female Life Expectancy at age 15" = LE15Female,
                                             "Total Life Expectancy at age 65" = LE65,
                                             "Male Life Expectancy at age 65" = LE65Male,
                                             "Female Life Expectancy at age 65" = LE65Female,
                                             "Total Life Expectancy at age 80" = LE80,
                                             "Male Life Expectancy at age 80" = LE80Male,
                                             "Female Life Expectancy at age 80" = LE80Female)






####### Cleaning `mortality` #######
mortality <- mortality |> rename("Year" = Time,
                                 "Infant Deaths, under age 1" = InfantDeaths,
                                 "Infant Mortality Rate" = IMR,
                                 "Live births surviving to Age 1" = LBsurvivingAge1,
                                 "Deaths under age 5" = Under5Deaths,
                                 "Under-5 Mortality Rate" = Q5,
                                 "Total Mortality before age 40" = Q0040,
                                 "Male Mortality before age 40" = Q0040Male,
                                 "Female Mortality before age 40" = Q0040Female,
                                 "Total Mortality before age 60" = Q0060,
                                 "Male Mortality before age 60" = Q0060Male,
                                 "Female Mortality before age 60" = Q0060Female,
                                 "Total Mortality between age 15 and 50" = Q1550,
                                 "Male Mortality between age 15 and 50" = Q1550Male,
                                 "Female Mortality between age 15 and 50" = Q1550Female,
                                 "Total Mortality between age 15 and 60" = Q1560,
                                 "Male Mortality between age 15 and 60" = Q1560Male,
                                 "Female Mortality between age 15 and 60" = Q1560Female)






####### Cleaning `migrations` #######
migrations <- migrations |> rename("Year" = Time,
                                   "Met Number of Migrants" = NetMigrations,
                                   "Net Migration Rate" = CNMR)




####### Adding a unit table ######
unit_lookup <- list(
  "Total Population, as of 1 January" = "thousands",
  "Total Population, as of 1 July" = "thousands",
  "Total Male Population, as of 1 July" = "thousands",
  "Total Female Population, as of 1 July" = "thousands",
  "Population Density, as of 1 July" = "persons per square km",
  "Population Sex Ratio, as of 1 July" = "males per 100 females",
  "Median Age, as of 1 July" = "years",
  "Natural Change, Births minus Deaths" = "thousands",
  "Rate of Natural Change" = "per 1000 population",
  "Population Change" = "thousands",
  "Population Growth Rate" = "%",
  "Population Annual Doubling Time" = "years",
  "Births" = "thousands",
  "Births by women aged 15-19" = "thousands",
  "Crude Birth Rate" = "births per 1000 population",
  "Total Fertility Rate" = "live births per woman",
  "Net Reproduction Rate" = "surviving daughters per woman",
  "Mean Age Childbearing" = "years",
  "Sex Ratio at Birth" = "males per 100 female births",
  "Total Deaths" = "thousands",
  "Male Deaths" = "thousands",
  "Female Deaths" = "thousands",
  "Crude Death Rate" = "deaths per 1000 population",
  "Total Life Expectancy at Birth" = "years",
  "Male Life Expectancy at Birth" = "years",
  "Female Life Expectancy at Birth" = "years",
  "Total Life Expectancy at age 15" = "years",
  "Male Life Expectancy at age 15" = "years",
  "Female Life Expectancy at age 15" = "years",
  "Total Life Expectancy at age 65" = "years",
  "Male Life Expectancy at age 65" = "years",
  "Female Life Expectancy at age 65" = "years",
  "Total Life Expectancy at age 80" = "years",
  "Male Life Expectancy at age 80" = "years",
  "Female Life Expectancy at age 80" = "years",
  "Infant Deaths, under age 1" = "thousands",
  "Infant Mortality Rate" = "infant deaths per 1000 live births",
  "Live births surviving to Age 1" = "thousands",
  "Deaths under age 5" = "thousands",
  "Under-5 Mortality Rate" = "deaths under age 5 per 1000 live births",
  "Total Mortality before age 40" = "deaths under age 40 per 1000 live births",
  "Male Mortality before age 40" = "deaths under age 40 per 1000 male live births",
  "Female Mortality before age 40" = "deaths under age 40 per 1000 female live births",
  "Total Mortality before age 60" = "deaths under age 60 per 1000 live births",
  "Male Mortality before age 60" = "deaths under age 60 per 1000 male live births",
  "Female Mortality before age 60" = "deaths under age 60 per 1000 female live births",
  "Total Mortality between age 15 and 50" = "deaths under age 50 per 1000 alive at age 15",
  "Male Mortality between age 15 and 50" = "deaths under age 50 per 1000 males alive at age 15",
  "Female Mortality between age 15 and 50" = "deaths under age 50 per 1000 females alive at age 15",
  "Total Mortality between age 15 and 60" = "deaths under age 60 per 1000 alive at age 15",
  "Male Mortality between age 15 and 60" = "deaths under age 60 per 1000 males alive at age 15",
  "Female Mortality between age 15 and 60" = "deaths under age 60 per 1000 females alive at age 15",
  "Net Number of Migrants" = "thousands",
  "Net Migration Rate" = "per 1000 population"
)



