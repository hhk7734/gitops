{{- define "wiki.frontend.fullname" -}}
{{ include "wiki.fullname" . }}-frontend
{{- end }}

{{- define "wiki.frontend.matchLabels" -}}
app.kubernetes.io/name: {{ include "wiki.frontend.fullname" . }}
app: {{ include "wiki.frontend.fullname" . }}
{{- end }}

{{- define "wiki.frontend.labels" }}
{{- include "wiki.labels" . }}
{{ include "wiki.frontend.matchLabels" . }}
{{- end }}