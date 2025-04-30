library(dplyr)
source("exploration/helper_functions.R")


####### WHO Data #######
# data dictionary
dict <- read.csv("datasets/who_data_dictionary.csv")

# Diphtheria-tetanus-pertussis (DTP3) immunization coverage among 1 year olds (%)
vaccines <- read.csv("datasets/Access to affordable medicines and vaccines/dataset.csv")
vaccines <- vaccines |> drop_one_value_col_except_IND_NAME()
vaccines <- vaccines |> rename("Year" = DIM_TIME,
                               "%" = RATE_PER_100_N) |> arrange(Year)

# Age-standardized prevalence of tobacco use among persons 15 years and older (%)
tobacco <- read.csv("datasets/Age-standardized prevalence of tobacco use/dataset.csv")
tobacco <- tobacco |> drop_one_value_col_except_IND_NAME()
tobacco <- tobacco |> rename("Year" = DIM_TIME,
                             "%" = PERCENT_POP_N,
                             "% (Lower Bound)" = PERCENT_POP_NL,
                             "% (Upper Bound)" = PERCENT_POP_NU) |> arrange(Year)

# Total alcohol per capita (>= 15 years of age) consumption (litres of pure alcohol)
alcohol <- read.csv("datasets/Alcohol/dataset.csv")
alcohol <- alcohol |> drop_one_value_col_except_IND_NAME()
alcohol <- alcohol |> rename("Year" = DIM_TIME,
                             "Litres of Pure Alcohol" = RATE_PER_CAPITA_N,
                             "Litres (Lower Bound)" = RATE_PER_CAPITA_NL,
                             "Litres (Upper Bound)" = RATE_PER_CAPITA_NU) |> arrange(Year)

# Proportion of births attended by skilled health personnel (%)
births_attended <- read.csv("datasets/Births attended by skilled health personnel/dataset.csv")
births_attended <- births_attended |> drop_one_value_col_except_IND_NAME()
births_attended <- births_attended |> rename("Year" = DIM_TIME,
                                             "%" = RATE_PER_100_N) |> arrange(Year)

# Probability of premature mortality from NCDs
diseases <- read.csv("datasets/cardiovascular disease, cancer, diabetes or chronic respiratory disease/dataset.csv")
diseases <- diseases |> drop_one_value_col_except_IND_NAME()
diseases <- diseases |> rename("Year" = DIM_TIME,
                               "%" = RATE_PER_100_N,
                               "% (Lower Bound)" = RATE_PER_100_NL,
                               "% (Upper Bound)" = RATE_PER_100_NU) |> arrange(Year)

# Proportion of population with primary reliance on clean fuels (%)
# all 100%, no need to clean
fuels <- read.csv("datasets/Clean fuels/dataset.csv")

# Road traffic mortality rate (per 100 000 population)
# only one observation
traffic_deaths <- read.csv("datasets/Deaths due to road traffic injuries/dataset.csv")
traffic_deaths <- traffic_deaths |> select(IND_NAME, DIM_TIME, RATE_PER_100000_N) |>
  rename("Year" = DIM_TIME,
         "Rate per 100,000 population" = RATE_PER_100000_N)

# Density of physicians (per 10 000 population)
doctors <- read.csv("datasets/Doctor density and distribution/dataset.csv")
doctors <- doctors |> drop_one_value_col_except_IND_NAME()
doctors <- doctors |> rename("Year" = DIM_TIME,
                             "Rate per 10000 population" = RATE_PER_10000_N) |> arrange(Year)

# Annual mean concentrations of fine particulate matter (PM2.5) in urban areas (µg/m3)
matter <- read.csv("datasets/Fine particulate matter/dataset.csv")
matter <- matter |> drop_one_value_col_except_IND_NAME()
matter <- matter |> rename("Year" = DIM_TIME,
                           "Degree of Urbanization" = Degree.of.urbanization,
                           "µg/m^3" = RATE_N,
                           "µg/m^3 (Lower Bound)" = RATE_NL,
                           "µg/m^3 (Upper Bound)" = RATE_NU) |> arrange(Year)

# Domestic general government health expenditure (GGHE-D) as percentage of general government expenditure (GGE) (%)
gov_spending <- read.csv("datasets/Government spending essential services/dataset.csv")
gov_spending <- gov_spending |> drop_one_value_col_except_IND_NAME()
gov_spending <- gov_spending |> rename("Year" = DIM_TIME,
                                       "% of General Government Expenditure" = RATE_PER_100_N)

# Hepatitis B surface antigen (HBsAg) prevalence among children under 5 years (%)
# only one observation
hep_b <- read.csv("datasets/Hepatitis B/dataset.csv")
hep_b <- hep_b |> select(IND_NAME, DIM_TIME, RATE_PER_100_N, RATE_PER_100_NL, RATE_PER_100_NU) |>
  rename("Year" = DIM_TIME,
         "%" = RATE_PER_100_N,
         "% (Lower Bound)" = RATE_PER_100_NL,
         "% (Upper Bound)" = RATE_PER_100_NU)

# New HIV infections (per 1000 uninfected population)
hiv <- read.csv("datasets/HIV infections/dataset.csv")
hiv <- hiv |> drop_one_value_col_except_IND_NAME()
hiv <- hiv |> rename("Year" = DIM_TIME,
                     "Rate per 1000 uninfected population" = RATE_PER_1000_N,
                     "Rate per 1000 uninfected population (Lower Bound)" = RATE_PER_1000_NL,
                     "Rate per 1000 uninfected population (Upper Bound)" = RATE_PER_1000_NU) |> arrange(Year)

# Age-standardized mortality rate attributed to household and ambient air pollution (per 100 000 population)
pollution <- read.csv("datasets/Household and ambient air pollution/dataset.csv")
pollution <- pollution |> drop_one_value_col_except_IND_NAME()
pollution <- pollution |> rename("Year" = DIM_TIME,
                                 "Rate per 100,000 population" = RATE_PER_100000_N,
                                 "Rate per 100,000 population (Lower Bound)" = RATE_PER_100000_NL,
                                 "Rate per 100,000 population (Upper Bound)" = RATE_PER_100000_NU) |> arrange(Year)

# Age-standardized prevalence of hypertension among adults aged 30 to 79 years (%)
hypertension <- read.csv("datasets/Hypertension/dataset.csv")
hypertension <- hypertension |> drop_one_value_col_except_IND_NAME()
hypertension <- hypertension |> rename("Year" = DIM_TIME,
                                       "%" = RATE_PER_100_N,
                                       "% (Lower Bound)" = RATE_PER_100_NL,
                                       "% (Upper Bound)" = RATE_PER_100_NU) |> arrange(Year)

# Mortality rate due to homicide (per 100 000 population)
homicide <- read.csv("datasets/Intentional homicide/dataset.csv")
homicide <- homicide |> drop_one_value_col_except_IND_NAME()
homicide <- homicide |> rename("Year" = DIM_TIME,
                               "Rate per 100,000 population" = RATE_PER_100000_N,
                               "Rate per 100,000 population (Lower Bound)" = RATE_PER_100000_NL,
                               "Rate per 100,000 population (Upper Bound)" = RATE_PER_100000_NU) |> arrange(Year)

# Prevalence of wasting in children under 5 (%)
malnutrition <- read.csv("datasets/Malnutrition/dataset.csv")
malnutrition <- malnutrition |> drop_one_value_col_except_IND_NAME()
malnutrition <- malnutrition |> mutate(Year = 2012) |> rename("%" = RATE_PER_100_N,
                                                              "% (Lower Bound)" = RATE_PER_100_NL,
                                                              "% (Upper Bound)" = RATE_PER_100_NU) |> arrange(Year)

# Maternal mortality ratio (per 100 000 live births)
maternal <- read.csv('./datasets/Maternal mortality ratio/dataset.csv')
maternal <- maternal |> drop_one_value_col_except_IND_NAME()
maternal <- maternal |> rename("Year" = DIM_TIME,
                               "Rate per 100,000 live births" = RATE_PER_100000_N,
                               "Rate per 100,000 live births (Lower Bound)" = RATE_PER_100000_NL,
                               "Rate per 100,000 live births (Upper Bound)" = RATE_PER_100000_NU) |> arrange(Year)

# Reported number of people requiring interventions against Neglected Tropical Diseases (NTDs)
trop_diseases <- read.csv("datasets/Neglected tropical diseases/dataset.csv")
trop_diseases <- trop_diseases |> drop_one_value_col_except_IND_NAME()
trop_diseases <- trop_diseases |> rename("Year" = DIM_TIME,
                                         "# of people" = COUNT_N) |> arrange(Year)

# Neonatal mortality rate (per 1000 live births)
infant <- read.csv("./datasets/Neonatal mortality rate/dataset.csv")
infant <- infant |> drop_one_value_col_except_IND_NAME()
infant <- infant |> rename("Year" = DIM_TIME,
                           "Rate per 1000 live births" = RATE_PER_1000_N,
                           "Rate per 1000 live births (Lower Bound)" = RATE_PER_1000_NL,
                           "Rate per 1000 live births (Upper Bound)" = RATE_PER_1000_NU) |> arrange(Year)
  
# Density of nursing and midwifery personnel (per 10 000 population)
nurse_midwife <- read.csv("datasets/Nurses and midwives density and distribution/dataset.csv")
nurse_midwife <- nurse_midwife |> drop_one_value_col_except_IND_NAME()
nurse_midwife <- nurse_midwife |> rename("Year" = DIM_TIME,
                                         "Rate per 10,000 population" = RATE_PER_10000_N) |> arrange(Year)

# Age-standardized prevalence of obesity among adults (18+ years)
obesity_adult <- read.csv("datasets/Obesity in adults/dataset.csv")
obesity_adult <- obesity_adult |> drop_one_value_col_except_IND_NAME()
obesity_adult <- obesity_adult |> rename("Year" = DIM_TIME,
                                         "%" = RATE_PER_100_N,
                                         "% (Lower Bound)" = RATE_PER_100_NL,
                                         "% (Upper Bound)" = RATE_PER_100_NU) |> arrange(Year)

# Prevalence of obesity among children and adolescents aged 5 to 19 years
obesity_child <- read.csv("datasets/Obesity in children/dataset.csv")
obesity_child <- obesity_child |> drop_one_value_col_except_IND_NAME()
obesity_child <- obesity_child |> rename("Year" = DIM_TIME,
                                         "%" = RATE_PER_100_N,
                                         "% (Lower Bound)" = RATE_PER_100_NL,
                                         "% (Upper Bound)" = RATE_PER_100_NU) |> arrange(Year)

# Density of pharmaceutical personnel (per 10 000 population)
pharms <- read.csv("datasets/Pharmacists density and distribution/dataset.csv")
pharms <- pharms |> drop_one_value_col_except_IND_NAME()
pharms <- pharms |> rename("Year" = DIM_TIME,
                           "Rate per 10,000 population" = RATE_PER_10000_N) |> arrange(Year)

# Proportion of population using a hand-washing facility with soap and water
sanitation <- read.csv("datasets/Safely managed sanitation & hand-washing/dataset.csv")
sanitation <- sanitation |> select(IND_NAME, DIM_TIME, PERCENT_POP_N)
sanitation <- sanitation |> rename("Year" = DIM_TIME,
                                   "%" = PERCENT_POP_N)

# Prevalence of stunting in children under 5 (%)
stunting <- read.csv("datasets/Stunting/dataset.csv")
stunting <- stunting |> drop_one_value_col_except_IND_NAME()
stunting <- stunting |> rename("Year" = DIM_TIME,
                               "%" = RATE_PER_100_N,
                               "% (Lower Bound)" = RATE_PER_100_NL,
                               "% (Upper Bound)" = RATE_PER_100_NU) |> arrange(Year)

# Suicide mortality rate (per 100 000 population)
suicide <- read.csv("datasets/Suicide/dataset.csv")
suicide <- suicide |> drop_one_value_col_except_IND_NAME()
suicide <- suicide |> rename("Year" = DIM_TIME,
                             "Rate per 100,000 population" = RATE_PER_100000_N,
                             "Rate per 100,000 population (Lower Bound)" = RATE_PER_100000_NL,
                             "Rate per 100,000 population (Upper Bound)" = RATE_PER_100000_NU) |> arrange(Year)

# Tuberculosis incidence (per 100 000 population)
tb <- read.csv("datasets/Tuberculosis/dataset.csv")
tb <- tb |> drop_one_value_col_except_IND_NAME()
tb <- tb |> rename("Year" = DIM_TIME,
                   "Rate per 100,000 population" = RATE_PER_100000_N,
                   "Rate per 100,000 population (Lower Bound)" = RATE_PER_100000_NL,
                   "Rate per 100,000 population (Upper Bound)" = RATE_PER_100000_NU) |> arrange(Year)

# Under-five mortality rate (per 1000 live births)
under5_mortality <- read.csv("datasets/Under-five mortality rate/dataset.csv")
under5_mortality <- under5_mortality |> drop_one_value_col_except_IND_NAME()
under5_mortality <- under5_mortality |> rename("Year" = DIM_TIME,
                                               "Rate per 1000 live births" = RATE_PER_1000_N,
                                               "Rate per 1000 live births (Lower Bound)" = RATE_PER_1000_NL,
                                               "Rate per 1000 live births (Upper Bound)" = RATE_PER_1000_NU) |> arrange(Year)

# Mortality rate from unintentional poisoning (per 100 000 population)
poisoning <- read.csv("datasets/Unintentional poisoning/dataset.csv")
poisoning <- poisoning |> drop_one_value_col_except_IND_NAME()
poisoning <- poisoning |> rename("Year" = DIM_TIME,
                                 "Rate per 100,000 population" = RATE_PER_100000_N,
                                 "Rate per 100,000 population (Lower Bound)" = RATE_PER_100000_NL,
                                 "Rate per 100,000 population (Upper Bound)" = RATE_PER_100000_NU) |> arrange(Year)

# Mortality rate attributed to exposure to unsafe WASH services (per 100 000 population)
unsafe_water <- read.csv("datasets/Unsafe water, unsafe sanitation and lack of hygiene/dataset.csv")
unsafe_water <- unsafe_water |> select(IND_NAME, DIM_TIME, Sex, RATE_PER_100000_N)
unsafe_water <- unsafe_water |> rename("Year" = DIM_TIME,
                                       "Rate per 100,000 population" = RATE_PER_100000_N) |> arrange(Year)

# Proportion of women of reproductive age who have their need for family planning satisfied with modern methods (%)
# only one observation
women_methods <- read.csv("datasets/Women satisfied with modern methods/dataset.csv")
women_methods <- women_methods |> select(IND_NAME, DIM_TIME, Sex, RATE_PER_100_N) |>
  rename("Year" = DIM_TIME,
         "%" = RATE_PER_100_N)


# Top causes of death - Female
female_deaths <- read.csv("datasets/Top causes of death/female_deaths.csv") 
female_deaths <- female_deaths |> filter(DIM_COUNTRY_CODE == "BRB") |> arrange(desc(VAL_DTHS_RATE100K_NUMERIC)) |> 
  rename("Cause" = DIM_GHECAUSE_TITLE,
         "Sex" = DIM_SEX_CODE,
         "Rate" = VAL_DTHS_RATE100K_NUMERIC) |> 
  select(-DIM_COUNTRY_CODE, -DIM_YEAR_CODE)
top_female_deaths <- female_deaths[1:10,]

# Top causes of death - Male
male_deaths <- read.csv("datasets/Top causes of death/male_deaths.csv")
male_deaths <- male_deaths |> filter(DIM_COUNTRY_CODE == "BRB") |> arrange(desc(VAL_DTHS_RATE100K_NUMERIC)) |> 
  rename("Cause" = DIM_GHECAUSE_TITLE,
         "Sex" = DIM_SEX_CODE,
         "Rate" = VAL_DTHS_RATE100K_NUMERIC) |> 
  select(-DIM_COUNTRY_CODE, -DIM_YEAR_CODE)
top_male_deaths <- male_deaths[1:10,]

# Top causes of death - Both
total_deaths <- read.csv("datasets/Top causes of death/both_deaths.csv")
total_deaths <- total_deaths |> filter(DIM_COUNTRY_CODE == "BRB") |> arrange(desc(VAL_DTHS_RATE100K_NUMERIC)) |> 
  rename("Cause" = DIM_GHECAUSE_TITLE,
         "Sex" = DIM_SEX_CODE,
         "Rate" = VAL_DTHS_RATE100K_NUMERIC) |> 
  select(-DIM_COUNTRY_CODE, -DIM_YEAR_CODE)
top_total_deaths <- total_deaths[1:10,]

# Causes of deaths combined
combined_21 <- rbind(top_female_deaths, top_male_deaths, top_total_deaths)
