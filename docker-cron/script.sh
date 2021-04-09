touch /logs/cron.log 
echo "starting a new run" > /logs/cron.log
rsync -a --no-i-r --partial --inplace --info=COPY2,DEL2,NAME,BACKUP2,REMOVE2,SKIP2 -e "ssh -i /root/.ssh/id_rsa" /src/* $DEST --log-file=/logs/cron.log  >> /logs/cron.log 2>&1
echo "the deed is done" >> /logs/cron.log
