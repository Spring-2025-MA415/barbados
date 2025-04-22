library(dplyr)


####### WHO Data #######
# data dictionary
dict <- read.csv("datasets/who_data_dictionary.csv")

# vaccination access
vaccines <- read.csv("datasets/Access to affordable medicines and vaccines/dataset.csv")

# tobacco usage
tobacco <- read.csv("datasets/Age-standardized prevalence of tobacco use/dataset.csv")

# alcohol usage
alcohol <- read.csv("datasets/Alcohol/dataset.csv")

# attended births
births_attended <- read.csv("datasets/Births attended by skilled health personnel/dataset.csv")

# diseases
diseases <- read.csv("datasets/cardiovascular disease, cancer, diabetes or chronic respiratory disease/dataset.csv")

# clean fuels
fuels <- read.csv("datasets/Clean fuels/dataset.csv")

# road traffic deaths
traffic_deaths <- read.csv("datasets/Deaths due to road traffic injuries/dataset.csv")

# doctor density and distribution
doctors <- read.csv("datasets/Doctor density and distribution/dataset.csv")

# fine particulate matter
matter <- read.csv("datasets/Fine particulate matter/dataset.csv")

# government spending on essential services
gov_spending <- read.csv("datasets/Government spending essential services/dataset.csv")

# hepatitis b
hep_b <- read.csv("datasets/Hepatitis B/dataset.csv")

# HIV infections
hiv <- read.csv("datasets/HIV infections/dataset.csv")

# air pollution
pollution <- read.csv("datasets/Household and ambient air pollution/dataset.csv")

# hypertension
hypertension <- read.csv("datasets/Hypertension/dataset.csv")

# homicide
homicide <- read.csv("datasets/Intentional homicide/dataset.csv")

# malnutrition
malnutrition <- read.csv("datasets/Malnutrition/dataset.csv")

# maternal mortality rates
maternal <- read.csv('./data/Maternal mortality ratio/dataset.csv')

# neglected tropical diseases
trop_diseases <- read.csv("datasets/Neglected tropical diseases/dataset.csv")

# neonatal mortality rates
infant <- read.csv("./data/Neonatal mortality rate/dataset.csv")

# nurses and midwives density
nurse_midwife <- read.csv("datasets/Nurses and midwives density and distribution/dataset.csv")

# obesity in adults
obesity_adult <- read.csv("datasets/Obesity in adults/dataset.csv")

# obesity in children
obesity_child <- read.csv("datasets/Obesity in children/dataset.csv")

# pharmacists density
pharms <- read.csv("datasets/Pharmacists density and distribution/dataset.csv")

# sanitation and hand-washing
sanitation <- read.csv("datasets/Safely managed sanitation & hand-washing/dataset.csv")

# stunting
stunting <- read.csv("datasets/Stunting/dataset.csv")

# suicide
suicide <- read.csv("datasets/Suicide/dataset.csv")

# tuberculosis
tb <- read.csv("datasets/Tuberculosis/dataset.csv")

# under-5 mortality rate
under5_mortality <- read.csv("datasets/Under-five mortality rate/dataset.csv")

# unintentional poisoning
poisoning <- read.csv("datasets/Unintentional poisoning/dataset.csv")

# unsafe water
unsafe_water <- read.csv("datasets/Unsafe water, unsafe sanitation and lack of hygiene/dataset.csv")

# women satisfied with modern methods
women_methods <- read.csv("datasets/Women satisfied with modern methods/dataset.csv")