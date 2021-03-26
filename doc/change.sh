LIST=`ls *.yml | sort`
TOCHANGE=$1

if [ -z $TOCHANGE ]; then
  echo "an argument is required"
  exit 1
fi

for i in $LIST 
do
  sed -i 's/object:Dawn::Kb::'`basename $i .yml`'/object:Dawn::Kb::'$TOCHANGE'/g' $i
done

