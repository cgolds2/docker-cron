FROM ubuntu:latest
ARG PERIOD
ARG DEST

# Install cron
RUN apt-get update
RUN apt-get install cron
RUN apt-get -y install rsync
RUN apt-get -y install openssh-client
RUN apt-get -y install vim

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/simple-cron

# Replace the period var with our's defined in the compose file
RUN sed -i 's/$PERIOD/'"$PERIOD"'/' /etc/cron.d/simple-cron

# Add shell script and grant execution rights
ADD script.sh /script.sh
RUN chmod +x /script.sh

# Replace the dest var with our's defined in the compose file
RUN sed -i 's%$DEST%'"$DEST"'%' /script.sh

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/simple-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /dev/null
