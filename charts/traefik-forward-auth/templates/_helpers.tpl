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
