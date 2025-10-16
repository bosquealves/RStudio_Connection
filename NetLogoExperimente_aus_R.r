# Starte NetLogo (ab Version 7.00) Experimente aus RStudio
# https://forum.netlogo.org/t/logolink-an-interface-for-running-netlogo-simulations-from-r/648

library(logolink)

netlogo_path <- file.path("", "Applications", "NetLogo 7.0.0", "NetLogo 7.0.0.app")

model_path <- file.path(
  "", "Applications", "NetLogo 7.0.0", "models", "IABM Textbook", "chapter 4",
  "Wolf Sheep Simple 5.nlogox"
)

setup_file <- create_experiment(
  name = "Wolf Sheep Simple Model Analysis",
  repetitions = 10,
  sequential_run_order = TRUE,
  run_metrics_every_step = TRUE,
  setup = "setup",
  go = "go",
  time_limit = 1000,
  metrics = c(
    'count wolves',
    'count sheep'
  ),
  run_metrics_condition = NULL,
  constants = list(
    "number-of-sheep" = 500,
    "number-of-wolves" = list(
      first = 5,
      step = 1,
      last = 15
    ),
    "movement-cost" = 0.5,
    "grass-regrowth-rate" = 0.3,
    "energy-gain-from-grass" = 2,
    "energy-gain-from-sheep" = 5
  )
)

results <- run_experiment(
  netlogo_path = netlogo_path,
  model_path = model_path,
  setup_file = setup_file
)

# brings error message while trying to write a temporrary file in MacOS
# Link to potential solution: 
# ask google: "var/folders cannot be found Rstudio MacOS"
# https://github.com/ocaml/opam/issues/3576

#PROBLEM!!!! headless mode läuft auch nicht von Console aus!
# https://ccl.northwestern.edu/netlogo/behaviorspace.html

./NetLogo_Console --headless \
--model "models/Wolf_Sheep_Simple_5.nlogo" \
--experiment "Wolf Sheep Simple model analysis" \
--table -

  
  '/Applications/NetLogo 7.0.0/models/IABM Textbook/chapter 4/Wolf Sheep Simple 5.nlogox'
