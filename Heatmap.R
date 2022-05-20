#Install libraries just it if necesarry
#install.packages("ggplot2")
#install.packages("RColorBrewer")
#install.packages("gplots")

#upload libraries
library(RColorBrewer)
library(ggplot2)
library(gplots)

#upload Tabulated table
Table_example <- read.csv("/Users/anarosamoyabeltran/Documents/Matriz_example.txt", sep= "\t", header = T)

#Define names
Exnames <-Table_example[,1]

#Define data matrix
ExData <-data.matrix(Table_example[,2:ncol(Table_example)])

#add names
row.names(ExData) <-Exnames


#Define Pallette colors breaks. You can aggregatte more depending of breaks. https://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3
my_palette_Ocurr <- c("#f6eff7", "#a6bddb", "#1c9099")


#Define breaks. Depending of the nature of the data. For example, numbers of genes, % identity, etc.
myBreaks <- c(0,1,2,3)

#Create a PDF, optional
#pdf("heatmap.pdf",12,7)

#Compile a Heatmap
heatmap.2(ExData,
          # same data set for cell labels
          # heat map titl      # change font color of cell lab
          density.info="none",  # turns off density plot inside color legend
          trace="none",         # turns off trace lines inside the heat map
          margins =c(9,9),     # widens margins around plot
          col=my_palette_Ocurr,       # use on color palette defined earlier
          # enable color transition at specified limits
          dendrogram="none",     # only draw a row dendrogram
          breaks = myBreaks)
#save plot

#clean the Viewer
dev.off()


