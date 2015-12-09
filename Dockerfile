FROM 288971733297.dkr.ecr.us-east-1.amazonaws.com/micro-image:master.4

# this folder must be created in the base images
ADD . /root/micro-api/

#now run set up
RUN /bin/bash /root/micro-api/setup.sh

ENTRYPOINT ["/root/micro-api/boot.sh"]
