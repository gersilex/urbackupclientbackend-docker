FROM ubuntu

RUN apt-get update && apt-get install -y wget 
RUN TF=`mktemp` && wget "https://hndl.urbackup.org/Client/2.2.5/UrBackup%20Client%20Linux%202.2.5.sh" -O $TF && sh $TF; rm $TF

VOLUME /usr/local/var/urbackup
CMD /usr/local/sbin/urbackupclientbackend --restore server-confirms
