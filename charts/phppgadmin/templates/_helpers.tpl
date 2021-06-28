{{/* vim: set filetype=mustache: */}}

{{/*
Return the proper phppgadmin image name
*/}}
{{- define "phppgadmin.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper image name (for the metrics image)
*/}}
{{- define "phppgadmin.metrics.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.metrics.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "phppgadmin.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image .Values.metrics.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "phppgadmin.mariadb.fullname" -}}
{{- printf "%s-%s" .Release.Name "mariadb" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a fully qualified database name if the database is part of the same release than phppgadmin.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "phppgadmin.dbfullname" -}}
{{- printf "%s-%s" .Release.Name .Values.db.chartName | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Compile all warnings into a single message, and call fail.
*/}}
{{- define "phppgadmin.validateValues" -}}
{{- $messages := list -}}
{{- $messages := append $messages (include "phppgadmin.validateValues.db.ssl" .) -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message | fail -}}
{{- end -}}
{{- end -}}

{{/* Validate values of phppgadmin - must provide a valid database ssl configuration */}}
{{- define "phppgadmin.validateValues.db.ssl" -}}
{{- if and .Values.db.enableSsl (empty .Values.db.ssl.clientKey) (empty .Values.db.ssl.clientCertificate) (empty .Values.db.ssl.caCertificate) -}}
phppgadmin: db.ssl
    Invalid database ssl configuration. You enabled SSL for the connection
    between phppgadmin and the database but no key/certificates were provided
    (--set db.ssl.clientKey="xxxx", --set db.ssl.clientCertificate="yyyy")
{{- end -}}
{{- end -}}

{{/*
Check if there are rolling tags in the images
*/}}
{{- define "phppgadmin.checkRollingTags" -}}
{{- include "common.warnings.rollingTag" .Values.image }}
{{- include "common.warnings.rollingTag" .Values.metrics.image }}
{{- end -}}
