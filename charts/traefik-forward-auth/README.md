# traefik-forward-auth

![Version: 0.0.15](https://img.shields.io/badge/Version-0.0.15-informational?style=flat-square)

## Installing the Chart

To install the chart with the release name `my-release` at version 0.0.15:

```bash
helm repo add colearendt https://colearendt.github.io/helm
helm install my-release colearendt/traefik-forward-auth --version=0.0.15
```

#### _Deploy traefik-forward-auth_

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| args[0] | string | `"--config=/config/config.ini"` |  |
| command[0] | string | `"./traefik-forward-auth"` |  |
| config.default-provider | string | `"oidc"` |  |
| config.insecure-cookie | bool | `false` |  |
| config.log-level | string | `"warn"` |  |
| extraObjects | list | `[]` | Extra kubernetes objects to deploy (value evaluted as a template) |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"thomseddon/traefik-forward-auth"` |  |
| image.tag | int | `2` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe | object | `{}` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| pod.env | list | `[]` |  |
| pod.volumeMounts | list | `[]` |  |
| pod.volumes | list | `[]` |  |
| podAnnotations | object | `{}` |  |
| readinessProbe | object | `{}` |  |
| replicas | int | `1` |  |
| resources | object | `{}` |  |
| service.port | int | `80` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. -- If not set and create is true, a name is generated using the fullname template |
| serviceAnnotations | object | `{}` |  |
| startupProbe | object | `{}` |  |
| strategy | object | `{}` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
