flower_plot2 <- function(sample, value, start, a, b,
ellipse_col = c("#004529", "#006837", "#238443", "#08306b", "#08519c", "#2171b5", "#3690c0", "#4292c6", "#6baed6", "#9ebcda", "#bfd3e6", "#fc8d59", "#fdbb84", "#feb24c", "#fed976", "#ccece6", "#e5f5e0", "#c7e9c0", "#a1d99b", "#74c476", "#41ab5d", "#238b45", "#78c679", "#006d2c"),
circle_col = rgb(0, 162, 214, max = 255),
circle_text_cex = 1, labels=labels) {
par( bty = "n", ann = F, xaxt = "n", yaxt = "n", mar = c(1,1,1,1))
plot(c(0,10),c(0,10),type="n")
n   <- length(sample)
deg <- 360 / n
res <- lapply(1:n, function(t){
ellipse_col <- ellipse_col[t]
plotrix::draw.ellipse(x = 5 + cos((start + deg * (t - 1)) * pi / 180),
y = 5 + sin((start + deg * (t - 1)) * pi / 180),
col = ellipse_col,
border = ellipse_col,
a = a, b = b, angle = deg * (t - 1))
text(x = 5 + 2.5 * cos((start + deg * (t - 1)) * pi / 180),
y = 5 + 2.5 * sin((start + deg * (t - 1)) * pi / 180),
value[t]
)
if (deg * (t - 1) < 180 && deg * (t - 1) > 0 ) {
text(x = 5 + 3.3 * cos((start + deg * (t - 1)) * pi / 180),
y = 5 + 3.3 * sin((start + deg * (t - 1)) * pi / 180),
sample[t],
srt = deg * (t - 1) - start,
adj = 1,
cex = circle_text_cex
)
} else {
text(x = 5 + 3.3 * cos((start + deg * (t - 1)) * pi / 180),
y = 5 + 3.3 * sin((start + deg * (t - 1)) * pi / 180),
sample[t],
srt = deg * (t - 1) + start,
adj = 0,
cex = circle_text_cex
)
}
})
plotrix::draw.circle(x = 5, y = 5, r = 1.5, col = circle_col, border = circle_col )
# tune location by x and y.
text(x = 4.7, y = 5, labels=labels)
}

colors_flower <-c("#004529", "#006837", "#238443", "#08306b", "#08519c", "#2171b5", "#3690c0", "#4292c6", "#6baed6", "#9ebcda", "#bfd3e6", "#fc8d59", "#fdbb84", "#feb24c", "#fed976", "#ccece6", "#e5f5e0", "#c7e9c0", "#a1d99b", "#74c476", "#41ab5d", "#238b45", "#78c679", "#006d2c")
flower_plot2 (c("ATCC 19377", "MELgDNAI", "ATCC 8085", "DSM 14366", "Licanantay", "ATCC 15494", "No-26", "MELgDNAIII", "CLST", "ATCC 21835", "BC-51", "GG1-14", "MELgDNAIV", "MELgDNAII", "ATCC 19703", "RW2", "A01", "JYC-17", "DMC", "ZBY", "BY02", "A02", "DXS-W", "GD1-3"),
c(239,122,199,510,774,553,443,363,564,680,360,555,408,452,506,612,203,301,257,210,411,200,520,540 ), 90, 0.5, 2, labels="      1318",
ellipse_col = adjustcolor(colors_flower,alpha=0.5),
circle_col = topo.colors(1, alpha = 0) )