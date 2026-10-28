#1bin/bash
for file in *.csv
do
	echo "processing $file"
	python_analysis.py "$file"
done

