{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "traefik-forward-auth.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "traefik-forward-auth.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


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
