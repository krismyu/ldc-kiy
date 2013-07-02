Time-stamp: <2013-06-18 12:14:52 amoebe>
  
# Load ggplot2 plotting library
library(ggplot2)

# Read in f0 extraction data from RAPT
rapt1.dat <- read.table('espsData-1.txt', header = FALSE, col.names = c("fname", "time", "f0", "prob.voi", "rms", "ac.peak"))
rapt2.dat <- read.table('espsData-2.txt', header = FALSE, col.names = c("fname", "time", "f0", "prob.voi", "rms", "ac.peak"))

rowBind(rapt-1.dat,rapt-2.dat)

# Remove rows where f0 undefined (voicing detection p.voi = 0)
rapt.dat1 = rapt.dat[rapt.dat$prob.voi != 0,]

ggplot(rapt.dat1, aes(x = time, y = f0, group = fname)) + geom_line() + labs(y = "f0 (Hz)", x = "Time (ms)") + opts(panel.background = theme_rect(), axis.text.x = theme_text(size=12,vjust=1), axis.text.y = theme_text(size=12,hjust=1), axis.title.x = theme_text(size = 14, vjust=-0.3,), axis.title.y = theme_text(size = 14, angle=90, vjust=0.4, hjust=0.5),panel.grid.major = theme_line(colour="gray"))

