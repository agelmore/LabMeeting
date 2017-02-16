#Calculate the following distances by thetaYC for each donor then summarize in dot plot with standard error

# Inoculum vs endpoint


#change to local repo
setwd("/users/amanda/documents/Schloss/Lab meeting/LabMeeting/CodeReview2_16/")

source('functions.R')

load_Libraries(c("ggplot2","gridExtra","dplyr","tidyr"))


#input files
metadata_file<- "colonization.metadata.final.txt"
dist.col_file <- "colonization.thetayc.column.ave.dist"


#Load files
metadata<- read.table(file=metadata_file, header=T, stringsAsFactors = FALSE)
dist.col <- read.table(file=dist.col_file, header=F, row.names=NULL, stringsAsFactors = FALSE) #column distances summary file
colnames(dist.col) <- c("label", "comparison", "thetayc")


#Summarize data
eartags <- unique(metadata$eartag_un[metadata$type=='sample'& metadata$treatment=='none' &metadata$strain=='C57Bl/6']) #vector of unique eartags
donors <- unique(metadata$donor[metadata$type=='sample'&metadata$treatment=='none'&metadata$strain=='C57Bl/6']) #vector of unique donor names

#Sample id vectors
donor.id <- unique(metadata$donor.id[metadata$type=='sample'& metadata$treatment=='none' &metadata$strain=='C57Bl/6'])
end.id <- get_endpoints(eartags, metadata)
d1.id <- get_day1(eartags, metadata)



##use dists file to subset to all distances to each donor
dist.donors <- rbind(merge(metadata, dist.col, by.x=c("id", "donor.id"), by.y=c("comparison", "label")), merge(metadata, dist.col, by.x=c("id", "donor.id"), by.y=c("label", "comparison"))) #merge files to get donors to only their experiment. Have to rbind because donorid could be in right or left column of comparison


# Inoculum vs endpoint
dist.end <- dist.donors[dist.donors$id %in% end.id,]

mean.end.donor <- dist.end %>% 
  group_by(donor) %>% 
  summarise(mean.inoc.vs.end = mean(thetayc), se.inoc.vs.end =sd(thetayc)/sqrt(n())) %>%  
  unite("mean.inoc.vs.end_se.inoc.vs.end", mean.inoc.vs.end,se.inoc.vs.end) %>% 
  gather(key="calc_error", value, 2) %>% 
  separate(calc_error, c("calc", "error"), "_") %>%  
  separate(value, c("mean.value", "error.value"), "_")



#Plot distance in each donor

dodge <- position_dodge(.5)
donor.palette <- c("hotpink","red","orange3", "yellow3", "forestgreen", "blue", "purple","brown", "black", "lightblue")

#Convert numbers back to numeric
mean.end.donor$mean.value <- as.numeric(mean.end.donor$mean.value)
mean.end.donor$error.value <- as.numeric(mean.end.donor$error.value)


ggplot(mean.end.donor, aes(x=calc, y=mean.value, color=donor)) +
  geom_point(position=dodge, size=2) +
  geom_errorbar(aes( ymax=mean.value+error.value, ymin=mean.value-error.value), position=dodge)+    
  ylab(expression(paste("Mean ", theta["YC"], " distance per donor", sep=" ")))+
  xlab("") +
  theme_bw() +
  ylim(range(0,1))+
  scale_color_manual(values=donor.palette)+
  ggtitle("Change over time")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position='none') 



