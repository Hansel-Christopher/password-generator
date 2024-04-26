VERSION="v$1"
docker build -t password-generator:$VERSION .
docker tag password-generator:$VERSION hanselchristopher001/password-generator:$VERSION
docker push hanselchristopher001/password-generator:$VERSION
