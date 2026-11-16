# Importancia de las Pruebas de Performance en Proyectos

El equipo de automatización de pruebas en una empresa fintech ha identificado la necesidad de realizar pruebas no funcionales para garantizar la calidad del software. Las pruebas de carga, rendimiento, volumen, estrés, estabilidad, línea base, tolerancia a fallas y robustez son cruciales para asegurar que el sistema pueda manejar las demandas del negocio. Como automatizador de pruebas, tu rol es entender la importancia de estas pruebas y cómo integrarlas en el ciclo de desarrollo.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Importancia de las pruebas de performance |
| **Nivel** | advanced-l2 |
| **Tipo** | theoretical |
| **Tiempo estimado** | 2 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: JDK 17+, Maven 3.9+, IDE con soporte Java.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Ejecuta `mvn compile` en la raíz. Si no hay errores, estás listo.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Exploración de Tipos de Pruebas No Funcionales

**Objetivo:** Comprender los diferentes tipos de pruebas no funcionales y su importancia.

**Tiempo estimado:** 30 minutos

**Instrucciones:**

- Identifica y describe brevemente cada tipo de prueba no funcional mencionada.
- Explica por qué cada tipo de prueba es importante para el éxito del proyecto.

**Entregable:** Un resumen escrito que describe cada tipo de prueba no funcional y su importancia.

<details>
<summary>Pistas de conocimiento</summary>

- Considera cómo cada tipo de prueba afecta la calidad del software.
- Piensa en ejemplos concretos donde cada tipo de prueba podría ser crucial.

</details>

### Fase 2: Evaluación de la Importancia de las Pruebas No Funcionales

**Objetivo:** Evaluar y discutir la importancia de realizar pruebas no funcionales en proyectos.

**Tiempo estimado:** 1 hora

**Instrucciones:**

- Analiza cómo la falta de pruebas no funcionales puede afectar negativamente un proyecto.
- Discute las mejores prácticas para integrar pruebas no funcionales en el ciclo de desarrollo.

**Entregable:** Un informe que evalúa la importancia de las pruebas no funcionales y propone mejores prácticas para su integración.

<details>
<summary>Pistas de conocimiento</summary>

- Considera los riesgos asociados con la omisión de pruebas no funcionales.
- Investiga sobre metodologías ágiles y cómo pueden apoyar la integración de pruebas no funcionales.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué son las pruebas no funcionales y por qué son importantes?
- **paraQueSirve**: ¿Cuál es el propósito de realizar pruebas no funcionales en un proyecto?
- **queDecisionesImplica**: ¿Qué decisiones clave deben tomarse al integrar pruebas no funcionales en el ciclo de desarrollo?

## Criterios de Evaluacion

- Identificación y descripción de los diferentes tipos de pruebas no funcionales.
- Explicación de la importancia de cada tipo de prueba no funcional.
- Análisis de los riesgos asociados con la omisión de pruebas no funcionales.
- Propuesta de mejores prácticas para la integración de pruebas no funcionales en el ciclo de desarrollo.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
mvn -q -B -DskipTests -Dspring-boot.repackage.skip=true package
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
