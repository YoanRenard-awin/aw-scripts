#! /bin/sh

@ var
user=yoann
github_account=YoanRenard-awin
vm=yoannr


sudo mkdir /home/sites/
sudo chown $user /home/sites/
cd /home/sites

git clone git@github.com:$github_account/awin-darwin.git
git clone git@github.com:$github_account/awin-services.git
git clone git@github.com:$github_account/awin-localization.git
git clone git@github.com:$github_account/awin-images.git
git clone git@github.com:$github_account/awin-site2.git

awin-darwin/composer install
awin-services/composer install

#rsync -atv --progress --cvs-exclude awin-darwin/ admin@yoannr.dev.affiliatewindow.com:/home/sites/darwin.affiliatewindow.com/
#rsync -atv --progress --cvs-exclude awin-localization/ admin@yoannr.dev.affiliatewindow.com:/home/sites/localization/
#rsync -atv --progress --cvs-exclude awin-services/ admin@yoannr.dev.affiliatewindow.com:/home/sites/awin-services

