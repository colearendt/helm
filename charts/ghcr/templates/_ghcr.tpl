{{- /*
    Base64 Encode the essential "username:password" key

    Required keys:
      username
      password
*/ -}}
{{- define "ghcr.b64Base" -}}
  {{- printf "%s:%s" .username .password | b64enc }}
{{- end }}

{{- define "ghcr.jsonBase" -}}
  {{- printf "{\"auths\":{\"ghcr.io\":{\"auth\": \"%s\"}}}" . | b64enc }}
{{- end }}

{{- define "ghcr.authSecret" -}}
    {{- $secret := include "ghcr.b64Base" . -}}
    {{- include "ghcr.jsonBase" $secret }}
{{- end }}
