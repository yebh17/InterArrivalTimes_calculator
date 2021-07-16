#!/usr/local/bin/python3

from matplotlib import mlab
import matplotlib.pyplot as plt
import numpy as np
import csv
import glob
import os

def graph_plot():
    x = []
    myFiles = glob.glob('*.csv')
    a=0
    for i in range(len(myFiles)):
        with open(myFiles[a],'r') as csvfile:
            plots = csv.reader(csvfile, delimiter=',')
            for row in plots:
                #Time in us
                x.append(row[1])
            

        d = np.array(x, dtype='S32')
        d = d.astype('float64')
        d = np.sort(d)

        # Percentile values
        p = np.array([0.0, 25.0, 50.0, 75.0])

        perc = np.percentile(d, p)

        plt.plot(d, color='green', linewidth=2)
        # Place red dots on the percentiles
        plt.plot((len(d)-1) * p/100., perc, 'ro')

        # Set tick locations and labels
        plt.xticks((len(d)-1) * p/100., map(str, p))
        plt.gcf().axes[0].yaxis.get_major_formatter().set_scientific(False)
        plt.xlabel('Percentiles')
        plt.ylabel('Inter-arrival times')
        plt.savefig(f'{myFiles[a]}_percentile.png')
        plt.clf()
        a+=1
os.chdir('convShaper2_cerberus')
p=os.listdir(os.getcwd())
c=0
for i in range(len(p)):
    try:
        os.chdir(p[c])
        c=c+1
        graph_plot()
    except NotADirectoryError:
        pass
    except FileNotFoundError:
        pass
    os.chdir('..')

os.chdir('..')
os.chdir('convShaper2_convSrc3')
p=os.listdir(os.getcwd())
d=0
for i in range(len(p)):
    try:
        os.chdir(p[d])
        d+=1
        graph_plot()
    except NotADirectoryError:
        pass
    except FileNotFoundError:
        pass
    os.chdir('..')

os.chdir('..')
os.chdir('convSrc3_cerberus')

p=os.listdir(os.getcwd())
e=0
for i in range(len(p)):
    try:
        os.chdir(p[e])
        e+=1
        graph_plot()
    except NotADirectoryError:
        pass
    except FileNotFoundError:
        pass
    os.chdir('..')
print("INFO: Done with the Percentile graphs, check them in the respective directories")
