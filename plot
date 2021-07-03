#!/usr/bin/python

import matplotlib.pyplot as plt
import csv
import matplotlib.ticker as mticker

x = []
y = []

#Uncomment this line if wanted graphs in seconds
with open('data_rates_sec.csv','r') as csvfile:
    
#Uncomment this line if wanted graphs in microseconds
# with open('data_rates.csv','r') as csvfile:

    plots = csv.reader(csvfile, delimiter=',')
    for row in plots:
        x.append(row[0])
        y.append(int(row[1]))

plt.scatter(x, y, label='1024 Bytes = 8192 bits\nPlots are as (No. of bits) per (time taken)')

#Uncomment this line if wanted graphs in seconds
plt.axis([0.0000101,0.000052,8150,8200])

#Uncomment this line if wanted graphs in microseconds
# plt.axis([0,60,8150,8200])

plt.xlabel('Time')
plt.ylabel('bits')
plt.title('BITRATE\npackets(bits) Vs Time')
plt.legend()
plt.show()
