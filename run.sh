trap "kill 0 && exit" SIGINT SIGTERM EXIT
pkgin in sun-jdk6
pkgin in unzip
unzip rexster-server-2.3.0-SNAPSHOT-distribution.zip
unzip titan-0.2.0.zip 
mkdir rexster-server-2.3.0-SNAPSHOT/ext/titan
cp titan-0.2.0/lib/*.* rexster-server-2.3.0-SNAPSHOT/ext/titan
echo -e "g = TitanFactory.open('/tmp/titan')\ng.loadGraphML('titan-0.2.0/data/graph-of-the-gods.xml')" | ./titan-0.2.0/bin/gremlin.sh
./rexster-server-2.3.0-SNAPSHOT/bin/rexster.sh -s -d -c rexster.xml &> rexster.log &
echo
echo "Sleeping while server comes up"
sleep 5
while true; do curl localhost:8182/graphs/titanexample/vertices; done

