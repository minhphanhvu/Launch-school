counter=0
max=10

while [ $counter -le $max ]
do
  echo $counter
  ((counter++))
done

echo ----

counter=0
max=10

until [ $counter -gt $max ]
do
  echo $counter
  ((counter++))
done

echo ----

numbers='1 2 3 4 5 6 7 8 9 10'

for number in $numbers
do
  echo $number
done
