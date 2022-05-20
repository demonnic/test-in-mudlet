echo "Requested download of Mudlet version: $1"
cd /tmp
if [[ "$1" == "LATEST" ]]; then
  VERSION=`curl --silent "https://api.github.com/repos/mudlet/mudlet/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")'`
else
  VERSION="$1"
fi

echo "Using Mudlet version: $VERSION"
curl -L "https://www.mudlet.org/wp-content/files/$VERSION-linux-x64.AppImage.tar" --output Mudlet.tar &&\
tar xf Mudlet.tar