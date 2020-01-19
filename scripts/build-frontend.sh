#!/bin/bash

cd /usr/src/app/frontend
npm install
npm run build

cp -a /usr/src/app/frontend/dist/js/. /usr/src/app/app/assets/javascripts/frontend
cp -a /usr/src/app/frontend/dist/css/. /usr/src/app/app/assets/stylesheets/frontend

if [ -d /usr/src/app/frontend/dist/img/ ] ;then
  # ディレクトリないとcpでエラーになるからなければ作る
  if [ ! -d /usr/src/app/public/static/img ] ;then
    mkdir -p /usr/src/app/public/static/img
  fi
  cp -a /usr/src/app/frontend/dist/img/. /usr/src/app/public/static/img/
fi