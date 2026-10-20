library(factoextra)
library(ggplot2)

obesity = read.csv2("Documents/GM3/Semestre2/projet/MSRO/Obesity Classification.csv",sep = ",",dec=".")
obesity_quant=obesity[, c("Age", "Height", "Weight", "BMI")]  


h=hclust(dist(obesity_quant),method="ward.D2")
cluster=cutree(h,k=5)
plot(h)
partition = list()
partition[[1]]=names(which(cluster==1))
partition[[2]]=names(which(cluster==2))
partition[[3]]=names(which(cluster==3))
partition[[4]]=names(which(cluster==4))
partition[[5]]=names(which(cluster==5))
fviz_dend(h,k=5, main="Dendrogramme de la CAH")
library(FactoMineR)
res_pca=PCA(obesity_quant)
res_hcpc=HCPC(res_pca$ind$coord[,1:2]A,consol=F)

