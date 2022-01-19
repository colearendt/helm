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
