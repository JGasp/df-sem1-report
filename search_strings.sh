
DIR=$1
OUTPUT=$2

SEARCH_STRING="XXXX"
if [ $3 -z 0 ]
then
	echo "Searching for default string $SEARCH_STRING"
else
	SEARCH_STRING=$3
	echo "Searching for string $SEARCH_STRING"
fi



for filename in $DIR/*; do
	strings < "$filename" | grep "$SEARCH_STRING" > /dev/null
	if [ $? -eq 0 ]
	then
		echo "Found in $filename"
		echo "$filename" >> $OUTPUT
	fi
done
