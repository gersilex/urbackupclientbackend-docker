FROM ubuntu

RUN apt-get update && \
	apt-get install -y wget && \
	rm -rf /var/lib/apt/lists/*

RUN TF=`mktemp` && wget "https://hndl.urbackup.org/Client/2.2.5/UrBackup%20Client%20Linux%202.2.5.sh" -O $TF && sh $TF; rm $TF

# Settings and keypairs are stored here
VOLUME /usr/local/var/urbackup

# Sending files during file backups (file server)
EXPOSE 35621/tcp

# UDP broadcasts for discovery
EXPOSE 35622/udp

# Commands and image backups
EXPOSE 35623/tcp

CMD /usr/local/sbin/urbackupclientbackend --restore server-confirms
