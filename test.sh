trap "kill 0 && exit" SIGINT SIGTERM EXIT
TEST_CFG=$1
TIMEOUT=0
echo "Test: $TEST_CFG" 
./rexster-server-2.3.0-SNAPSHOT/bin/rexster.sh -s -d -c $TEST_CFG &> rexster.log &
echo "Sleeping while server $SERVER comes up"
sleep 5
TEST_LOG=`echo -n $TEST_CFG | sed -e 's/xml/log/g'`
echo "Logging test to $TEST_LOG"
while [ $TIMEOUT == 0 ]
do 
	echo "BOOP"
	curl -m 5 -s localhost:8182/graphs/titanexample >> $TEST_LOG
	TIMEOUT=$?
	echo >> $TEST_LOG
	echo $TIMEOUT
done
echo "Timed out."
TIMEOUT=0

