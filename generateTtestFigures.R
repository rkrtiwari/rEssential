### Generate figure for unpaird observation
jpeg("figures/ttest/unpaired.jpg")
boxplot(extra ~ group, data = sleep, col="green", xlab="Drug Type", 
        ylab = "Increase in Sleep Hours", main = "Unpaired")
dev.off()

### Generate figure for paired observation
g1 <- sleep[sleep$group==1,]
g1$group <- as.numeric(g1$group)
g2 <- sleep[sleep$group==2,]
g2$group <- as.numeric(g2$group)

jpeg("figures/ttest/paired.jpg")
col <- 1:10
plot(as.numeric(sleep$group), sleep$extra, type = "p", cex = 2, xlim=c(0.5,2.5),
     xlab="Drug Type", ylab = "Increase in Sleep Hours", pch = 16, 
     col = col, xaxt = "n", main = "Paired")
axis(side =1, at = c(1,2))
for (i in 1:nrow(g1)){
  segments(g1$group[i], g1$extra[i], g2$group[i], g2$extra[i], col = col[i])
}
dev.off()
