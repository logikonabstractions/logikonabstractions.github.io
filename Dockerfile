FROM ruby:slim-buster as jekyll

# build stuff for jekyll
RUN apt-get update && apt-get install -y build-essential gcc bash cmake git && rm -rf /var/lib/lists/*


RUN gem install jekyll bundler
RUN gem install jekyll-theme-leaf

EXPOSE 4000

WORKDIR /site

ENTRYPOINT [ "jekyll" ]

CMD [ "--help" ]


FROM jekyll as jekyll-serve

COPY docker-entrypoint.sh /usr/local/bin/

# on every container start, check if Gemfile exists and warn if it's missing
ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]
