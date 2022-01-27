{{- /*
    Base64 Encode the essential "username:password" key

    Required keys:
      username
      password
*/ -}}
{{- define "regcred.b64Base" -}}
  {{- printf "%s:%s" .username .password | b64enc }}
{{- end }}

{{- define "regcred.jsonBase" -}}
  {{- printf "{\"auths\":{\"ghcr.io\":{\"auth\": \"%s\"}}}" . | b64enc }}
{{- end }}

{{- define "regcred.authSecret" -}}
    {{- $secret := include "regcred.b64Base" . -}}
    {{- include "regcred.jsonBase" $secret }}
{{- end }}
