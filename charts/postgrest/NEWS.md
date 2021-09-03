# 0.1.1

- Make readiness probe configurable
- Change `.Values.containerPort` to 9000 (80 gives "permission denied")
- Add `.Values.pod.env` configuration option for generic environment variables
- Switch "secrets" (`dbUri` and `jwtSecret`) to be treated as secrets

# 0.1.0

- Initial version of helm chart!
