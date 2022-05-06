# Jekyll in a Docker Container

## Building the image

> docker build -t franckit/githubpage-jekyll .
> docker push franckit/githubpage-jekyll

## building a new site from the image
> docker run -v $(pwd):/site franckit/githubpage-jekyll jekyll new --force .

Note: this requires a valid Gemfile. Either use the base one from Jekyll or the one in the repo

## serving locally with bind mount for dev

> docker-compose up

# Known issues
## Webrick
Must add those to Gemfile if using recent jekyll versions
gem "sdbm"
gem "webrick"
gem "net-telnet"
gem "xmlrpc"
