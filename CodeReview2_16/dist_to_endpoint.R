##Code to summarize some other beta diversity scripts. Creating a figure similar to Figure 2a in Baxter et al 2014. 

#Calculate the following distances by thetaYC for each donor then summarize in dot plot with standard error

# Inoculum vs D1
# Inoculum vs endpoint
# D1 vs endpoint

#change to cloned repo
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

#Calculate mean thetaYC distance and standard error between inoculum and endpoint in each donor




mean.donor.endpoint <- 

#Inoculum vs Day 1



#Day 1 vs Endpoint

#Plot distance in each donor

donor.palette <- c("hotpink","red","orange3", "yellow3", "forestgreen", "blue", "purple","brown", "black", "skyblue3")

change <- ggplot(mean.donor.endpoint, aes(x=, y=, color=)) +
  ylab(expression(paste("Mean ", theta["YC"], " distance per donor", sep=" ")))+
  xlab("") +
  theme_bw() +
  ylim(range(0,1))+
  scale_color_manual(values=donor.palette)+
  ggtitle("Community change over course of experiment")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position='none') 





