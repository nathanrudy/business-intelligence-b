listings <- readr::read_csv("data/listings.csv") # you need to set up the path correctly
str(listings)    # inspect the structure
readr::write_rds(listings, "data/listings.rds") # see https://readr.tidyverse.org/reference/read_rds.html
