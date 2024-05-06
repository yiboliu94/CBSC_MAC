# -*- coding: utf-8 -*-
"""
Created on Tue Apr 30 18:46:28 2024

@author: liuyi
"""

from CBSC import *
import random
import statistics
#%%
#cbsc accuracy
testcase=10000
sum_error=0
for i in range (testcase):
    rand1=random.randrange(start=0, stop=256, step=1)
    rand2=random.randrange(start=0, stop=256, step=1)
    x=max(rand1, rand2)
    w=min(rand2, rand2)
    fixed_result=x*w/255/255
    test_result=CBSC_mul(x,w)/255
    sum_error+=abs(fixed_result-test_result)
#%%
#cbsc mac accuracy
testcase=1000
error_history=[]
sum_error=0
sqr_sum_error=0
for i in range (testcase):
    rand1=random.randrange(start=0, stop=256, step=1)
    rand2=random.randrange(start=0, stop=256, step=1)
    rand3=random.randrange(start=0, stop=256, step=1)
    rand4=random.randrange(start=0, stop=256, step=1)
    rand5=random.randrange(start=0, stop=256, step=1)
    rand6=random.randrange(start=0, stop=256, step=1)
    rand7=random.randrange(start=0, stop=256, step=1)
    rand8=random.randrange(start=0, stop=256, step=1)
    x1=max(rand1, rand2)
    w1=min(rand1, rand2)
    x2=max(rand3, rand4)
    w2=min(rand3, rand4)
    x3=max(rand5, rand6)
    w3=min(rand5, rand6)
    x4=max(rand7, rand8)
    w4=min(rand7, rand8)
    fixed_result=x1*w1/255/255 + x2*w2/255/255 + x3*w3/255/255 + x4*w4/255/255
    test_result=CBSC_mul(x1,w1)/255 + CBSC_mul(x2,w2)/255 + CBSC_mul(x3,w3)/255 + CBSC_mul(x3,w3)/255
    error=abs(fixed_result-test_result)
    error_history.append(error)
    sum_error+=error
    sqr_sum_error +=  error**2
    
   
#%%
std=statistics.stdev(error_history)

    
    
    