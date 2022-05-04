# about

this is a repo to manage my business site. build with githubpages/jekyll, with local dev on docker-compose.

# building a site
> mkdir tests && cd tests
> docker run -v $(pwd):/site franckit/githubpage-jekyll new .

# update the image
> docker build -t franckit/githubpage-jekyll .
> docker push franckit/githubpage-jekyll

# local dev
Both of those give you watch/live reload (need to manually refresh the page however)

> docker run -p 4000:4000 -v $(pwd):/site bretfisher/jekyll-serve

Or using docker-compose:
> docker-compose up

