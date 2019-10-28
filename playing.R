#install.packages('RedditExtractoR')
library(RedditExtractoR)
# devtools::install_github(repo = 'BiologicalRecordsCentre/plantnet')
library(plantnet)
source('toms_key.R')

# get a post
rget <- get_reddit(subreddit = 'whatplantisthis',
                   sort_by = 'new')

# Sorted the wrong way 
rget <- rget[rev(1:nrow(rget)),]
head(rget)

# Get just the first post in each
uget <- rget[!duplicated(rget$title), ]

# Identify the first one
id <- plantnet::identify(toms_key(), imageURL = uget$link[1])

top <- id[1,]

# Confident?
top$score > 80

# Post a response
