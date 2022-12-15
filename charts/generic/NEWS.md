# 0.2.5

- Fix bug in `rbac` `RoleBinding` creation

# 0.2.4

- Add `mountConfig`, `mountSecret` and `secretEnv` values sections. ([#45](https://github.com/colearendt/helm/pull/45))
  - Allows defining a ConfigMap and mounting individual files into the pod
  - Allows defining a secret and mounting individual files into the pod
  - Allows defining a secret and including the secrets as environment variables
  - Note that values are evaluated as templates and file mode for mounted files is configurable (in a wholesale fashion)
  - Close [#16](https://github.com/colearendt/helm/issues/16)
  - (Note that this functionality is possible today with `extraObjects` and such, but should be made easier by these
    helpers)
- Add `rbac` configuration section ([#45](https://github.com/colearendt/helm/pull/45))
  - This allows defining rbac rules inline for both `role` and `clusterRole` (using `role.rules` and `clusterRole.rules`)
  - It defaults to the release namespace (for `role`), but allows multiple `role.targetNamespaces`. NOTE: the default is only
    used when _no_ `targetNamespaces` are defined.

# 0.2.3

- Update ingress to use newer template, api version, etc.

# 0.2.2

- Update maintainer

# 0.2.1

- Add customization for `command` and `args`

# 0.2.0

- BREAKING: move `podAnnotations` into `pod.annotations`
- BREAKING: move `podSecurityContext` into `pod.securityContext`
- Add proper mounting for `storage` (fixes a shortcoming in 0.1.3+)
  - Add `storage.mountPath` value for customizing the mount path. Defaults to `/mnt/storage`
- Add values for arbitrary `pod.volumes` and `pod.volumeMounts`
- Add values for `pod.labels`

# 0.1.5

- Add values for `readinessProbe`, `livenessProbe` and `startupProbe`
  - This allows customization of probes
  - Previously, `readinessProbe` was hardcoded

# 0.1.4

- Add `extraObjects` for arbitrary deployment possibilities!

# 0.1.3

- Add `storage` values for setting a PersistentVolumeClaim
  - It is best when we do not need to use this, but alas, it is often necessary

# 0.1.2

- Add `pod.env` values for setting pod environment variables

# 0.1.1

- Update maintainer

# 0.1.0

- Initial release
