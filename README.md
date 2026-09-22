# Desarrollo de un dashboard inteligente para la gestión basada en datos: aplicación al rendimiento de corredores

Trabajo de Fin de Grado **aplicado** · Grado en Ingeniería Informática · Escuela Politécnica Superior, Universidad de Córdoba (2025)

**Autor:** Jorge Soriano Pijuan · **Tutor:** Javier Pérez Barea

## Descripción

Aplicación de análisis de datos orientada al rendimiento en carrera. A partir de las actividades registradas por el corredor —ritmo, frecuencia cardiaca, potencia, distancia y cadencia—, el proyecto construye:

- Un **dashboard interactivo** que integra datos de plataformas y dispositivos deportivos y permite la visualización dinámica de métricas individuales y grupales.
- Un **modelo de análisis** que detecta patrones de evolución en ritmo, frecuencia cardiaca, potencia y distancia mediante técnicas estadísticas y de ingeniería de datos.
- Un **módulo predictivo** basado en regresión lineal y modelos de series temporales, orientado a estimar la progresión del rendimiento a corto y medio plazo.
- Una **interfaz visual adaptable** que facilita la interpretación de los indicadores tanto a deportistas individuales como a entrenadores y equipos.
- Un **sistema de gestión de datos estructurados** que permite comparar resultados entre distintos corredores y hacer seguimiento personalizado del progreso.

## Estado del proyecto

Fase inicial. El repositorio contiene por ahora la definición del proyecto, las convenciones de trabajo y las habilidades de dominio; **todavía no hay código ejecutable**.

El desarrollo sigue un orden orientado al riesgo: primero el *tooling* (entorno, dependencias y batería de pruebas) y después una primera rebanada vertical completa —datos de muestra → una métrica → una visualización— antes de profundizar en cualquier capa.

## Stack

| Área | Tecnología |
| --- | --- |
| Lenguaje | Python |
| Tratamiento de datos | pandas |
| Análisis y predicción | scikit-learn, statsmodels |
| Visualización | Plotly |
| Dashboard | Dash |
| Persistencia | SQLite en desarrollo, con esquema portable a PostgreSQL |
| Origen de datos | API de Strava; conjuntos de datos simulados como alternativa |
| Pruebas | pytest |

## Metodología

- **Desarrollo guiado por pruebas (TDD)**: ciclo *Red → Green → Refactor*, con pruebas unitarias centradas en lógica con modos de fallo reales.
- **Trazabilidad de las métricas**: cada fórmula implementada documenta en su *docstring* la fuente bibliográfica (autor, año), de modo que cualquier cifra de la memoria pueda rastrearse hasta su origen.
- **Reproducibilidad**: ninguna cifra de la memoria se edita a mano; todas se generan mediante scripts de este repositorio.
- **Validación temporal**: los modelos predictivos se evalúan con particiones temporales, nunca aleatorias, para evitar fugas de información.

## Estructura del repositorio

```text
src/
  data/        # ingesta (Strava), almacenamiento y validación
  metrics/     # definición única de las fórmulas de métricas
  analysis/    # estadística, patrones y alertas de desviación
  models/      # modelos predictivos (regresión y series temporales)
  dashboard/   # aplicación Dash
notebooks/     # exploración
tests/         # pruebas con pytest y datos de ejemplo
data/          # datos locales (no versionados)
docs/          # memoria y figuras
```

## Datos y privacidad

Los datos de actividad reales y las credenciales de la API **no se versionan**. Las claves se gestionan mediante variables de entorno y los datos brutos permanecen en local. El repositorio incluye únicamente conjuntos de datos de ejemplo, anonimizados y de tamaño reducido, bajo `tests/fixtures/`.

## Fases de desarrollo

El trabajo se desarrolla a lo largo de 12 semanas, en cinco fases:

| Fase | Semanas | Contenido |
| --- | --- | --- |
| 1 | 1–3 | Estudio de requisitos, recopilación de conjuntos de datos y diseño del modelo de datos |
| 2 | 4–6 | Desarrollo del dashboard base e integración con las fuentes de datos |
| 3 | 7–8 | Implementación del módulo analítico y predictivo |
| 4 | 9–10 | Validación, pruebas de usuario y documentación técnica |
| 5 | 11–12 | Redacción final de la memoria y defensa del proyecto |

Este repositorio acompaña a la memoria del trabajo: el código aquí publicado es la implementación de la que proceden sus resultados.
