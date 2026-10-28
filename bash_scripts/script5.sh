#!/bin/bash

# Define the grading scale using conditional operators from your notes
get_grade() {
    local marks=$1
    if [ "$marks" -ge 70 ]; then
        echo "A"
    elif [ "$marks" -ge 50 ]; then
        echo "B"
    else
        echo "C"
    fi
}

# Array representing the data from your table (List 2)
# Format: "Name:Marks"
students=("Max:75" "Alex:69")

echo "--- Grading Process ---"

# Loop through each student record
for student in "${students[@]}"; do
    # Extract name and marks from the string
    name=$(echo "$student" | cut -d':' -f1)
    marks=$(echo "$student" | cut -d':' -f2)
    
    # Calculate the grade using our function
    grade=$(get_grade "$marks")
    
    # Print the required output format from your notes
    echo "$name has grade $grade"
done

