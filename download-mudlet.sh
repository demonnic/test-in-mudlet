echo "Requested download of Mudlet version: $1"
cd /tmp
VERSION=$1

curl -L "https://www.mudlet.org/wp-content/files/$VERSION-linux-x64.AppImage.tar" --output Mudlet.tar &&\
tar xf Mudlet.tar
