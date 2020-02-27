FROM ruby:2.7.0-alpine3.11
ARG RAILS_ENV=production
RUN apk add --no-cache build-base gcc wget git --virtual deps-build-common
RUN apk add --no-cache sqlite-dev sqlite --virtual deps-sqlite
RUN apk add --no-cache postgresql-client postgresql-dev --virtual deps-postgres

COPY scripts/docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
COPY scripts/docker-bundle.sh /usr/bin/
RUN chmod +x /usr/bin/docker-bundle.sh

RUN mkdir /papi
COPY . /papi

WORKDIR /papi
RUN /usr/bin/docker-bundle.sh ${RAILS_ENV:-production}

ENV RAILS_ENV ${RAILS_ENV:-production}

EXPOSE 3000

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bundle", "exec", "foreman", "start"]
