#Cleaning Data
raw_elections_data <-
  read_csv(
    file = "table_tableau11.csv",
    show_col_types = FALSE
  )

# Make the names easier to type
cleaned_elections_data <-
  clean_names(raw_elections_data)

# Have a look at the first six rows
head(cleaned_elections_data)

cleaned_elections_data <-
  cleaned_elections_data |>
  select(
    Electoral District Number/Numéro de circonscription,
    Elected Candidate/Candidat élu
  )
head(cleaned_elections_data)

names(cleaned_elections_data)

cleaned_elections_data <-
  cleaned_elections_data |>
  rename(
    division = Elected Candidate/Candidat élu,
    elected_party = Elected Candidate/Candidat élu
  )

head(cleaned_elections_data)

cleaned_elections_data$elected_party |>
  unique()

cleaned_elections_data <-
  cleaned_elections_data |>
  mutate(
    elected_party =
      case_match(
        elected_party,
        "Liberal" ~ "Liberal",
        "The Nationals" ~ "Nationals",
        "The Greens" ~ "Greens",
        "Independent" ~ "Other",
        "Katter's Australian Party (KAP)" ~ "Other",
        "Centre Alliance" ~ "Other"
      )
  )

head(cleaned_elections_data)