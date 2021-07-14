#!/usr/bin/python

from matplotlib import mlab
import matplotlib.pyplot as plt
import numpy as np
import csv

x = []

with open('/Users/sunny/datarates_calculator/convShaper2_convSrc3/week_27/results_tue_09_00.csv','r') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    for row in plots:
        #Time in us
        x.append(row[1])
     

d = np.array(x, dtype='S32')
d = d.astype('float64')
d = np.sort(d)

# Percentile values
p = np.array([0.0, 25.0, 50.0, 75.0])

perc = mlab.prctile(d, p=p)

plt.plot(d, color='green', linewidth=2)
# Place red dots on the percentiles
plt.plot((len(d)-1) * p/100., perc, 'ro')

# Set tick locations and labels
plt.xticks((len(d)-1) * p/100., map(str, p))
plt.gcf().axes[0].yaxis.get_major_formatter().set_scientific(False)
plt.savefig('./convShaper2_convSrc3/week_27/results_tue_09_00.png')
plt.show()
