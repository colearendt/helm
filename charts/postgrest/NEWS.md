# 0.3.3

- Bump PostgREST version to v11.1.0

# 0.3.2

- Update ingress to use newer template, api version, etc.

# 0.3.1

- Add `extraObjects` value for deploying other kubernetes objects.

# 0.3.0

- Fix issue with `strategy` being defined at the wrong scope ([#28](https://github.com/colearendt/helm/issues/28))
    - now the default values should work

# 0.2.1

- Update maintainer

# 0.2.0

- BREAKING: move `podAnnotations` and `podSecurityContext` to `pod.annotations` and `pod.securityContext`
- Add `strategy`, `initContainer`, `command`, and `args` values  
- Make replicas automatically restart when secret changes
- Add liveness and readiness probes

# 0.1.1

- Make readiness probe configurable
- Change `.Values.containerPort` to 9000 (80 gives "permission denied")
- Add `.Values.pod.env` configuration option for generic environment variables
- Switch "secrets" (`dbUri` and `jwtSecret`) to be treated as secrets

# 0.1.0

- Initial version of helm chart!
