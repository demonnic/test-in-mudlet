if [[ "$1" == "LATEST" ]]; then
  VERSION=`curl --silent "https://api.github.com/repos/mudlet/mudlet/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")'`
else
  VERSION="$1"
fi

echo "Using Mudlet version: $VERSION"

echo "MUDLET_VERSION=$VERSION" >> $GITHUB_ENV
