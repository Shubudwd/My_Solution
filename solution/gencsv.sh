#!/bin/bash

#Function for Creating inputFile content with random numbers

#Set "NoOfValue" variable to Generate n number of entries in the inputFile

NoOfValue=9

function RandomNumberGenerator {

for (( i=0; i<=$NoOfValue; i++ ))
        do
		echo $i, $RANDOM
        done
}

#Writing the value in inputFile

RandomNumberGenerator > inputFile

 

