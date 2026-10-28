#!/bin/bash

for i in {1..5}; do
    echo "This is iteration number $i"
    for j in {1..2}; do
        echo "This is a nested iteration number $j within main loop $i"
    done
done

