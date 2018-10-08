#!/bin/sh

# SSH setup for deployment
cd /var/www/html/emoncms/Modules/assessment/
openssl aes-256-cbc -K $encrypted_d561feca5f1b_key -iv $encrypted_d561feca5f1b_iv -in deploy_key.enc -out ./deploy_key -d
chmod 600 ./deploy_key
echo -e "Host $PRODUCTION_SERVER\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
ssh -i ./deploy_key $PRODUCTION_SERVER_USER@$PRODUCTION_SERVER

# Run deployment script
#sh deployer.sh 