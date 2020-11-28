integer=4

if [[ $integer -lt 10 ]]
then
  echo $integer is less than 10

  if [[ $integer -lt 5 ]]
  then
    echo $integer is also less than 5
  fi
fi

integer=15

if [[ $integer -le 10 ]]
then
  echo $integer is less than 10
else
  echo $integer is not less than 10
fi

if [[ -f ./if_statement.sh ]]
then
  echo File exists
else
  echo there is no such file
fi