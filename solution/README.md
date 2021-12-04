Steps for Part 1 

1:- Installed Docker on my CentOS 8 stream server

Command ---->   sudo yum install docker-ce docker-ce-cli containerd.io

2:- Started Docker on Server

Command ---->   sudo systemctl start docker

3:- Pulled Docker Image as per the provided Document

Command ---->   sudo docker pull infracloudio/csvserver:latest

4:- Cloned the repository from Github to my root directory

Command ---->   sudo git clone https://github.com/infracloudio/csvserver

5:- Ran the Docker Image "infracloudio/csvserver:latest" but it failed because the to run the image "inputdata" file which was required to be attached as a volume. I found the error via logs

Command ---->   sudo docker logs <My_Container_id>

6:- Created the "gencsv.sh" script to create the "inputFile" with 10 entries. the script can be edited to create n number of entries. For the script kindly refer to gencsv.sh file.

7:- After running the gencsv.sh script "inputFile" will be created in the same diectory. I have mounted the "inputFile" file to the "inputdata" file inside /csvserver/ Directory. then i ran the Docker image and it ran successfully

Command ---->   sudo docker run -d -v $PWD/inputFile:/csvserver/inputdata 8cb989ef80b5

8:- After running the image succesfully i got inside the shell of the container using below command

Command ---->   sudo docker exec -it <My_Containeer_name> /bin/bash

9: Found out that application was running on port 9300 from netstat comand

Command ---->   netstat -nlp

10: Then according to the assignment we have to bind the application to the localhost port 9393. So used -p option in the docker run command for port binding

Command ---->   sudo docker run -d -v $PWD/inputFile:/csvserver/inputdata -p 9393:9300 8cb989ef80b5

11: lastly for the environment variable was required to be set as "Orange" so i used -e option below is the final Docer run command.

Command ---->   sudo docker run -d -v $PWD/inputFile:/csvserver/inputdata -p 9393:9300 -e CSVSERVER_BORDER='Orange' 8cb989ef80b5


12: After running the Docker image with the above command application was accessible on http://localhost:9393 

**************************************************************************************************************************************************************************************************************************************************

Part Steps for Part 2

1:- Run the Docker-compose up command to deploy the csvserver for the see the compose file kindly refer to "docker-compose.yaml" file in the solution directory.

Command ----> sudo docker-compose up

2:- After running the command the csvserver image will run succesfully.

**************************************************************************************************************************************************************************************************************************************************

Steps for Part 3

1:- Added "prom/prometheus:v2.22.0" to the docker-compose.yaml file . Run Docker-compose up command to deploy the csvserver and prometheus image from new docker-compose.yaml file.

Command ---->  sudo docker-compose up

Note :- Also added the prometheus.yml file for Prometheus to collect data from our application at <application>:<port> . Kindly refer to prometheus.yml for target configuration.

For looking csvserver merics data on the host machine open http://localhost:9393/metrics. Access the Prometheus on http://localhost:9090 and execute "csvserver_records" in query section you will see straigt line graph.

Thanks.......

**************************************************************************************************************************************************************************************************************************************************






