"""
author: daniel walther
bio392: day 11 (python refresher)
"""

# %% warmup exercises

import numpy as np


#%% exercise 1 badly described sorting function

# only sort odd numbers ascendingly in a given array (write a function), like this: sort_array([5,3,2,8,1,4])==[1,3,2,8,5,4]

def sort_odd(a=np.array([5, 3, 2, 8, 1, 4])):
    """
    only sorts the odd numbers of a given array, only using the positions of the odd numbers as well
    :param a: input array
    :return: a, same array but with sorted odd numbers
    """
    odd = []
    for x in a:
        odd.append(x) if x % 2 != 0 else None
    odd = sorted(odd)

    j = 0
    for i, target in enumerate(a):
        if target % 2 != 0:
            a[i] = odd[j]
            j += 1

    return a


b = sort_odd(np.array([5, 3, 2, 8, 1, 4]))
print(b == np.array([1, 3, 2, 8, 5, 4]))


#%% exercise 2 check for valid input

print('been there, done that.')


#%% exercise 3 string handling


#%% 
