# Helm Charts

This repo houses a bunch of helm charts that I find useful.

## Generally Useful

- [`generic`](./charts/generic): As the name suggests, this chart can be used
  to deploy a "generic" application. 
    - i.e. an application that needs a helm
      chart, and does not need lots of customization. The goal is to have "most"
      things available as values to customize. (Trying to reduce the number of
      bespoke helm charts I need to maintain. I use this often for microservices,
      etc.)
- [`regcred`](./charts/regcred): A chart to generate "registry credentials"
  (i.e. pull secrets for Kubernetes) easily from values

## Specific Applications

- [`traefik-forward-auth`](./charts/traefik-forward-auth): A chart for
  deploying
  [`traefik-forward-auth`](https://github.com/thomseddon/traefik-forward-auth) (a
  service for adding OIDC to a generic traefik installation)
- [`postgrest`](./charts/postgrest): A chart for deploying
  [PostgREST](https://postgrest.org/) (a fast and performant way to build an
  API backend on top of a PostgreSQL database)
- [`training-ns`](./charts/training-ns): A chart I like to use for generating
  throw-away namespaces and users for training others on Kubernetes

## Other

- [`example](./charts/example): This example chart is just boilerplate for
  reference. It should not be used.
- [`matomo`](./charts/matomo): This chart is useful for deploying
  [matomo](https://matomo.org/), but is maintained elsewhere. I would like for
  my fork to go away eventually.
