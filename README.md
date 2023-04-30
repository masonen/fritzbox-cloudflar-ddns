# Fritzbox Cloudflare-DDNS

Fritz!Box provides the service *.myfritz.net offering a way of accessing your home network via a cryptic url. [MyFritzDocs](https://avm.de/service/wissensdatenbank/dok/FRITZ-Box-7490/1018_MyFRITZ-Adresse-fur-direkten-Internetzugriff-auf-FRITZ-Box-und-Heimnetz-ermitteln/)

This set of containers aims to utilize this provided URL, extract the A Record of it and push it to your cloudflare DNS record. The current myfritz.net A recored will be polled every 5 minutes and pushed to cloudflare.

## Configuration

Copy the contents of `.env.dist` to a new file called `.env` in the main directory of this repo and fill out the provided enviroment variables as needed. You can find needed information what to fill in as comments in the `.env` file.

## Starting

run `docker compose up -d` to start the service


## FAQ

> Why don't you use XYZ and run this in your home network? it's much easier!

Simple answer: I don't want to. I want to run this on an externally hosted server because i don't want to have this running at home all the time. 