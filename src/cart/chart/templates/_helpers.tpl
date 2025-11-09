{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the chart.
*/}}
{{- define "retail-store-cart.name" -}}
{{- default "retail-store-cart" .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
Truncate at 63 chars because some Kubernetes name fields are limited to this (by DNS spec).
*/}}
{{- define "retail-store-cart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "retail-store-cart" .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by chart label.
*/}}
{{- define "retail-store-cart.chart" -}}
{{- printf "%s-%s" "retail-store-cart" .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "retail-store-cart.labels" -}}
helm.sh/chart: {{ include "retail-store-cart.chart" . }}
{{ include "retail-store-cart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "retail-store-cart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "retail-store-cart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: service
app.kubernetes.io/owner: retail-store-sample
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "retail-store-cart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "retail-store-cart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the config map to use
*/}}
{{- define "retail-store-cart.configMapName" -}}
{{- if .Values.configMap.create }}
{{- default (include "retail-store-cart.fullname" .) .Values.configMap.name }}
{{- else }}
{{- default "default" .Values.configMap.name }}
{{- end }}
{{- end }}

{{/* podAnnotations */}}
{{- define "retail-store-cart.podAnnotations" -}}
{{- if or .Values.metrics.enabled .Values.podAnnotations }}
{{- $podAnnotations := .Values.podAnnotations }}
{{- $metricsAnnotations := .Values.metrics.podAnnotations }}
{{- $allAnnotations := merge $podAnnotations $metricsAnnotations }}
{{- toYaml $allAnnotations }}
{{- end }}
{{- end }}

{{- define "retail-store-cart.dynamodb.fullname" -}}
{{- include "retail-store-cart.fullname" . }}-dynamodb
{{- end }}

{{/*
Common labels for dynamodb
*/}}
{{- define "retail-store-cart.dynamodb.labels" -}}
helm.sh/chart: {{ include "retail-store-cart.chart" . }}
{{ include "retail-store-cart.dynamodb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for dynamodb
*/}}
{{- define "retail-store-cart.dynamodb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "retail-store-cart.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: dynamodb
app.kubernetes.io/owner: retail-store-sample
{{- end }}

