#!/bin/sh

# configure zipcall
if ! [[ -z "${TWILIO_ACCOUNT_SID}" ]]; then
	echo "TWILIO_ACCOUNT_SID=${TWILIO_ACCOUNT_SID} >> .env
fi
if ! [[ -z "${LOCAL_AUTH_TOKEN}" ]]; then
	echo "LOCAL_AUTH_TOKEN=${LOCAL_AUTH_TOKEN} >> .env
fi

npm start
