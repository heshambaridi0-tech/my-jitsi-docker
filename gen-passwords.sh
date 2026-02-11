#!/bin/bash
set -e

function generatePassword() {
    openssl rand -hex 16
}

if [ ! -f .env ]; then
    echo ".env file not found! Please copy env.example to .env first."
    exit 1
fi

sed -i.bak \
    -e "s#JICOFO_COMPONENT_SECRET=.*#JICOFO_COMPONENT_SECRET=$(generatePassword)#g" \
    -e "s#JICOFO_AUTH_PASSWORD=.*#JICOFO_AUTH_PASSWORD=$(generatePassword)#g" \
    -e "s#JVB_AUTH_PASSWORD=.*#JVB_AUTH_PASSWORD=$(generatePassword)#g" \
    -e "s#JIGASI_XMPP_PASSWORD=.*#JIGASI_XMPP_PASSWORD=$(generatePassword)#g" \
    -e "s#JIBRI_RECORDER_PASSWORD=.*#JIBRI_RECORDER_PASSWORD=$(generatePassword)#g" \
    -e "s#JIBRI_XMPP_PASSWORD=.*#JIBRI_XMPP_PASSWORD=$(generatePassword)#g" \
    .env

echo "Passwords generated in .env"
