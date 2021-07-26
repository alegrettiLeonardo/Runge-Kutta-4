#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Mar  2 16:15:14 2021

@author: leonardo
"""
import numpy as np
import os
import matplotlib.pyplot as plt

# load from data file
Data = os.path.join('/home/leonardo/Documentos/Leonardo/MCAE/RungeKutta4/results.txt')
with open(Data, 'r') as infile:
    data = np.loadtxt(infile, dtype=float, unpack=True)
    
x=data[0,:]
y=data[1,:]
z=data[2,:]

plt.plot(x,y,label='f(x,y,z)')
plt.plot(x,z,label='g(x,y,z)')
plt.xlabel("x",fontsize=15)
plt.ylabel("f(x,y,z),g(x,y,z)",fontsize=15)
plt.xlim(0,2); plt.ylim(0,4);plt.legend(loc=1, prop={'size': 14})
plt.grid(True)
plt.show()