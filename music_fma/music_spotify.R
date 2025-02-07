library(ggplot2)
base_mu_data_uri <- paste(getwd(),"\\datasets\\fma",sep = "",collapse = "")
genres <- read.csv(paste(base_mu_data_uri,"\\genres.csv",sep='', collapse = ''))
head(genres)
echonest <- read.csv(paste(base_mu_data_uri,"\\echonest.csv", sep="",collapse = ""))
head(echonest)
names(echonest)
features <- read.csv(paste(base_mu_data_uri,"\\features.csv",sep='', collapse = ''))
head(features)
names(features)
tracks <- read.csv(paste(base_mu_data_uri,"\\tracks.csv", sep = "", collapse=""))
head(tracks)
names(tracks)
#echonest[2:3,3:48]
uniq_tracks <- unique(tracks)
#TODO reshape echonests column names
#row.names(echonest) <-c("track_id",echonest[2:3,3:48]) 
gen_names <- c("Classical","Pop")
gen_ids <- genres[genres$title %in% gen_names,]$genre_id
mu_by_genre <- uniq_tracks[uniq_tracks$track.7 %in% gen_names,]
#plot genres of first 100 tracks
ggplot(uniq_tracks[2:100,], aes(x=uniq_tracks[2:100,]$track.7)) + geom_bar()
#get random tracks
rnd_music = tracks[sample(1:nrow(tracks),854),]
#plot random tracks by genre, add some colors
ggplot(rnd_music[2:50,], aes(color = track.7,x=rnd_music[2:50,]$track.7)) +labs(
  title = "Tracks By Genre", color="Genre",
  x = "Genre", y="Songs") + geom_bar()

