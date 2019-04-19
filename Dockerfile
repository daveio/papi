FROM ruby:2.6-alpine
ARG RAILS_ENV=production
ARG RAILS_MASTER_KEY
ARG RAILS_SECRET_KEY_BASE
ARG RAILS_SERVE_STATIC_FILES=1
ARG PAPI_ADDTASK_TODOIST_API_KEY
ARG PAPI_ADDTASK_RECAPTCHA_SECRET
RUN apk update
RUN apk upgrade
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
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY:-}
ENV RAILS_SECRET_KEY_BASE ${RAILS_SECRET_KEY_BASE:-}
ENV RAILS_SERVE_STATIC_FILES ${RAILS_SERVE_STATIC_FILES:-1}
ENV PAPI_ADDTASK_TODOIST_API_KEY ${PAPI_ADDTASK_TODOIST_API_KEY:-}
ENV PAPI_ADDTASK_RECAPTCHA_SECRET ${PAPI_ADDTASK_RECAPTCHA_SECRET:-}

EXPOSE 3000

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bundle", "exec", "foreman", "start"]
