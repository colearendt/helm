{{- define "traefik-forward-auth.annotations" -}}
{{- range $key,$value := $.Values.serviceAnnotations -}}
{{ $key }}: {{ $value | quote }}
{{ end }}
{{- end -}}

{{- define "traefik-forward-auth.pod.annotations" -}}
{{- range $key,$value := $.Values.podAnnotations -}}
{{ $key }}: {{ $value | quote }}
{{ end }}
{{- end -}}

{{/* thanks to https://github.com/bitnami/charts/blob/master/bitnami/common/templates/_tplvalues.tpl */}}
{{/*
Renders a value that contains template.
Usage:
{{ include "traefik-forward-auth.tplvalues.render" ( dict "value" .Values.path.to.the.Value "context" $) }}
*/}}
{{- define "traefik-forward-auth.tplvalues.render" -}}
    {{- if typeIs "string" .value }}
        {{- tpl .value .context }}
    {{- else }}
        {{- tpl (.value | toYaml) .context }}
    {{- end }}
{{- end -}}
