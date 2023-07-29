{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "generic.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "generic.fullname" -}}
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

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "generic.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "generic.labels" -}}
helm.sh/chart: {{ include "generic.chart" . }}
{{ include "generic.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "generic.selectorLabels" -}}
app.kubernetes.io/name: {{ include "generic.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "generic.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "generic.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- /*
Define the image. This is helpful in case the tag has a sha in it

Should be passed values directly
 */ -}}
{{- define "generic.image" -}}
{{- $tag := .Values.image.tag | default .Chart.AppVersion }}
{{- if hasPrefix "sha256:" $tag -}}
"{{ .Values.image.repository }}@{{ $tag }}"
{{- else -}}
"{{ .Values.image.repository }}:{{ $tag }}"
{{- end }}
{{- end }}

{{/* thanks to https://github.com/bitnami/charts/blob/master/bitnami/common/templates/_tplvalues.tpl */}}
{{/*
Renders a value that contains template.
Usage:
{{ include "generic.tplvalues.render" ( dict "value" .Values.path.to.the.Value "context" $) }}
*/}}
{{- define "generic.tplvalues.render" -}}
    {{- if typeIs "string" .value }}
        {{- tpl .value .context }}
    {{- else }}
        {{- tpl (.value | toYaml) .context }}
    {{- end }}
{{- end -}}


{{- /*
  Determines the key given a "config" object and an "index"
    Optional key "filePrefix" defaults to "config-file"
    Optional key "fileExt" defaults to ".txt"
  Usage:
    {{ include "generic.config.key" (dict "index" 1 "content" (dict "name" "hi") }}
 */ -}}
{{- define "generic.config.key" -}}
  {{- $filePrefix := default .filePrefix "config-file" }}
  {{- $fileExt := default .fileExt ".txt" }}
  {{- if hasKey .content "name" }}
    {{- print (get .content "name") }}
  {{- else }}
    {{- printf "%s-%d%s" $filePrefix .index $fileExt }}
  {{- end}}
{{- end -}}

{{- /*
  Given a:
    - value: list of maps with mountPath and "content" keys
    - volumeName: optional name of the volume. Defaults to "config-volume"
  Generate:
    - a list of "volumeMount:" configurations that:
      - reference the named `volume`
      - choose a `subPath` based on the naming convention (i.e. either the name in the "content" key or the index)
      - choose a `mountPath` based on the "mountPath" key
  Usage: {{ include "generic.config.volumeMount" (dict "value" .Values.configMount "volumeName" "config-volume" ) }}
 */ -}}
{{- define "generic.config.volumeMount" }}
  {{- $volumeName := default .volumeName "config-volume" }}
  {{- range $i, $config := .value }}
    {{- if not (and (hasKey $config "mountPath") (hasKey $config "content")) }}
      {{- fail "keys 'mountPath' and 'content' are required for mountConfig entries" }}
    {{- end }}
    {{- printf "- name: %s" $volumeName | nindent 0 }}
    {{- printf "mountPath: %s" (get $config "mountPath") | nindent 2 }}
    {{- print "subPath: " | nindent 2 }}
    {{- include "generic.config.key" (dict "index" $i "content" $config ) | nindent 4 }}
  {{- end }}
{{- end }}

{{- /*
  Given a:
    - value: a list of maps with "mountPath" and "content" keys (along with recommended "name" key)
    - context: the context for templating to be evaluated within. Usually global
  Generate a:
    - ConfigMap "spec" / "data"
    - map of entries
    - evaluate each "content" key as a template

  Usage: {{ include "generic.config.configmap" (dict "value" .Values.configMount "context" . )}}
*/ -}}
{{- define "generic.config.configmap" -}}
  {{- if or (not (hasKey . "context")) (not (hasKey . "value")) }}
    {{- fail "generic.config requires both a context and a value key" }}
  {{- end }}
  {{- $global := .context }}
  {{- /* TODO: find a way to ensure names are unique...? */ -}}
  {{- range $i, $config := .value }}
    {{- if not (and (hasKey $config "mountPath") (hasKey $config "content")) }}
      {{- fail "keys 'mountPath' and 'content' are required for mountConfig entries" }}
    {{- end }}
  {{- /* name */ -}}
  {{- include "generic.config.key" (dict "index" $i "content" $config ) | nindent 0 }}: |
    {{- /* contents */ -}}
    {{- $content := get $config "content" }}
    {{- include "generic.tplvalues.render" (dict "value" $content "context" $global ) | nindent 2 }}
  {{- end }}
{{- end }}
