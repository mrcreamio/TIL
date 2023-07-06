#!/bin/python3
# Ahmed Waheed
# https://www.hackerrank.com/challenges/breaking-best-and-worst-records/problem?isFullScreen=true

import math
import os
import random
import re
import sys

#
# Complete the 'breakingRecords' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts INTEGER_ARRAY scores as parameter.
#

def breakingRecords(scores):
    # Write your code here
    highest = 0
    highest_score = 0
    lowest = 0
    lowest_score = 0
    for i in range(len(scores)):
        current_score = scores[i]
        if i == 0:
            highest_score = current_score
            lowest_score = current_score
        else:
            if current_score > highest_score:
                highest += 1
                highest_score = current_score
            if current_score < lowest_score:
                lowest += 1
                lowest_score = current_score
    
    return [highest, lowest]
        
            
        
        

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    n = int(input().strip())

    scores = list(map(int, input().rstrip().split()))

    result = breakingRecords(scores)

    fptr.write(' '.join(map(str, result)))
    fptr.write('\n')

    fptr.close()
