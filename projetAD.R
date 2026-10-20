# Chargement des bibliothèques nécessaires
library(FactoMineR)      # Pour ACP et HCPC
library(factoextra)      # Pour visualisation 

# Importation et sélection des données
Obesity = read.csv("Obesity Classification.csv", sep = ",")
Obesity_brute = Obesity[, c(2,4,5,6)]  #  Age, Taille, Poids, IMC

age=Obesity[,2]
Taille=Obesity[,4]
Poids=Obesity[,5]
IMC=Obesity[,6]

summary(age)
summary(Taille)
summary(Poids)
summary(IMC)

boxplot(age)
boxplot(Taille)
boxplot(Poids)
boxplot(IMC)

vars=names(Obesity_brute)
n=length(Obesity_brute)

for (i in 1:(n-1)) {
  for (j in (i+1):n) {
    var1 <- vars[i]
    var2 <- vars[j]
    
    corr <- cor(Obesity_brute[[var1]], Obesity_brute[[var2]], use = "complete.obs")  # ou "pairwise.complete.obs"
    
    cat("Corrélation entre", var1, "et", var2, ":", round(corr, 3), "\n")
  }
}

reg = lm(Obesity_brute$Weight ~Obesity_brute$BMI )
names(reg)
summary(reg)
plot(Obesity_brute$BMI,Obesity_brute$Weight)
abline(reg)

# Standardisation des données 
n = nrow(Obesity_brute)
X = scale(Obesity_brute) * sqrt(n / (n - 1))  # Standardisation corrigée (Bessel)
Obesity_stand = data.frame(X)

# CAH sur données brutes (non standardisées)
resultat = hclust(dist(Obesity_brute), method = "ward.D2")
plot(resultat, main = "Dendrogramme - Données brutes")

# 4. CAH sur données standardisées
resultat_stand = hclust(dist(Obesity_stand), method = "ward.D2")

plot(resultat_stand, main = "Dendrogramme - Données standardisées")
fviz_dend(resultat_stand, k = 5, main = "CAH - Données standardisées (k=5)")

# ACP non normée sur données non standardisées
res_pca_non_normee = PCA(Obesity_brute, scale.unit = FALSE)
data=as.matrix(Obesity_brute)
data=data%*%res_pca_non_normee$ind$coord[,1:2]
plot(data,col=resultat)

res_hcpc_non_normee = HCPC(res_pca_non_normee, nb.clust = 5, consol = FALSE)


fviz_dend(res_hcpc_non_normee, main = "Dendrogramme HCPC - ACP non normée")
fviz_cluster(res_hcpc_non_normee, main = "Projection - ACP non normée", geom = "point")

# ACP normée sur données standardisées 
res_pca = PCA(Obesity_stand)  # ACP standardisée (par défaut)
res_hcpc = HCPC(res_pca, nb.clust = 5, consol = FALSE)

fviz_dend(res_hcpc, main = "Dendrogramme HCPC - ACP normée")
fviz_cluster(res_hcpc, main = "Projection - ACP normée", geom = "point")

# Analyse des inerties (qualité du clustering)
res_hcpc$call$bw.before.consol / res_hcpc$call$t$within[1]  # Rapport inter / intra sans consolidation

# Consolidation de la methode CAH
res_hcpc_consol = HCPC(res_pca, nb.clust = 5, consol = TRUE)
res_hcpc_consol$call$bw.after.consol / res_hcpc_consol$call$t$within[1]  # Rapport inter / intra avec consolidation
fviz_cluster(res_hcpc_consol, main = "Projection - ACP normée + Consolidation", geom = "point")


