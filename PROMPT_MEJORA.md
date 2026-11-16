# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `src/test/java/com/fintech/performance/PerformanceTestPlan.java` — La fase "Exploración de Tipos de Pruebas No Funcionales" se implementa aqui: este archivo es el ejercicio.
- `src/test/java/com/fintech/performance/BasePerformanceTest.java` — La fase "Evaluación de la Importancia de las Pruebas No Funcionales" se implementa aqui: este archivo es el ejercicio.
- `src/main/java/XSteps.java` — La fase "Exploración de Tipos de Pruebas No Funcionales" ya venia resuelta por el codigo base: este archivo pasa a ser el ejercicio.

## Como saber que terminaste

```bash
mvn -q -B -DskipTests -Dspring-boot.repackage.skip=true package
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Calidad de Software, Especialidad Automatizador, Tecnología Pruebas de Performance, Advanced L2

### Brecha de conocimiento
Reconoce la importancia de llevar a cabo pruebas no funcionales, como las pruebas de carga, rendimiento, volumen, estrés, estabilidad, linea base, tolerancia a fallas y robustez, dentro de los proyectos, Reconoce la importancia de llevar a cabo pruebas no funcionales, como las pruebas de carga, rendimiento, volumen, estrés, estabilidad, linea base, tolerancia a fallas y robustez, dentro de los proyectos

### Reto
- Tema: Importancia de las pruebas de performance
- Seniority: advanced-l2
- Tipo: theoretical
- Título: Importancia de las Pruebas de Performance en Proyectos
- Tiempo estimado: 2 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Exploración de Tipos de Pruebas No Funcionales — objetivo: Comprender los diferentes tipos de pruebas no funcionales y su importancia. — entregable (NO resolver): Un resumen escrito que describe cada tipo de prueba no funcional y su importancia.
- Fase 2: Evaluación de la Importancia de las Pruebas No Funcionales — objetivo: Evaluar y discutir la importancia de realizar pruebas no funcionales en proyectos. — entregable (NO resolver): Un informe que evalúa la importancia de las pruebas no funcionales y propone mejores prácticas para su integración.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: pom.xml ===
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.4.13</version>
        <relativePath/>
    </parent>

    <groupId>com.example</groupId>
    <artifactId>reto</artifactId>
    <version>1.0.0</version>
    <name>reto</name>

    <properties>
        <java.version>21</java.version>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.apache.jmeter</groupId>
            <artifactId>ApacheJMeter_core</artifactId>
            <version>5.6.3</version>
        </dependency>
        <dependency>
            <groupId>org.apache.jmeter</groupId>
            <artifactId>ApacheJMeter_http</artifactId>
            <version>5.6.3</version>
        </dependency>
        <dependency>
            <groupId>org.apache.jmeter</groupId>
            <artifactId>ApacheJMeter_java</artifactId>
            <version>5.6.3</version>
        </dependency>
        <dependency>
            <groupId>org.apache.jmeter</groupId>
            <artifactId>jorphan</artifactId>
            <version>5.6.3</version>
        </dependency>
        <dependency>
            <groupId>org.apache.logging.log4j</groupId>
            <artifactId>log4j-core</artifactId>
        </dependency>
        <dependency>
            <groupId>org.slf4j</groupId>
            <artifactId>slf4j-api</artifactId>
        </dependency>
        <dependency>
            <groupId>kg.apc</groupId>
            <artifactId>jmeter-plugins</artifactId>
            <version>1.4.0</version>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
</project>

// === ARCHIVO: src/main/java/XSteps.java ===
// TODO(reto): archivo stubbeado; implementa los cuerpos.
package com.fintech.performance;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.And;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.junit.runner.RunWith;

import static org.junit.Assert.*;

@RunWith(org.junit.runner.RunWith.class)
public class XSteps {

    private String testType;
    private String endpoint;
    private int users;
    private int rampUpPeriod;
    private int duration;
    private boolean testExecuted;
    private long responseTime;
    private int errorCount;
    private double throughput;

    @Given("que el sistema de pruebas de performance está configurado")
    public void queElSistemaDePruebasDePerformanceEstáConfigurado() {
      throw new UnsupportedOperationException("TODO(reto): Given");
    }

    @Given("se ha definido un plan de pruebas con el tipo de prueba {string}")
    public void seHaDefinidoUnPlanDePruebasConElTipoDePrueba(String tipoPrueba) {
      throw new UnsupportedOperationException("TODO(reto): Given");
    }

    @Given("el endpoint bajo prueba es {string}")
    public void elEndpointBajoPruebaEs(String endpoint) {
      throw new UnsupportedOperationException("TODO(reto): Given");
    }

    @Given("los parámetros de carga son {int} usuarios con {int} segundos de ramp-up por {int} segundos")
    public void losParámetrosDeCargaSonUsuariosConRampUpPor(int usuarios, int rampUp, int duracion) {
      throw new UnsupportedOperationException("TODO(reto): Given");
    }

    @When("se ejecuta la prueba de performance")
    public void seEjecutaLaPruebaDePerformance() {
      throw new UnsupportedOperationException("TODO(reto): When");
    }

    @Then("la prueba debe completarse sin errores críticos")
    public void laPruebaDebeCompletarseSinErroresCríticos() {
      throw new UnsupportedOperationException("TODO(reto): Then");
    }

    @Then("el tiempo de respuesta promedio debe ser menor a {int} ms")
    public void elTiempoDeRespuestaPromedioDebeSerMenorA(int umbralMs) {
      throw new UnsupportedOperationException("TODO(reto): Then");
    }

    @Then("el throughput debe ser mayor a {int} solicitudes por segundo")
    public void elThroughputDebeSerMayorA(int minThroughput) {
      throw new UnsupportedOperationException("TODO(reto): Then");
    }

    @Then("la tasa de error debe ser menor al {int}%")
    public void laTasaDeErrorDebeSerMenorAl(int porcentajeMaximo) {
      throw new UnsupportedOperationException("TODO(reto): Then");
    }

    @And("se registran las métricas de rendimiento")
    public void seRegistranLasMétricasDeRendimiento() {
      throw new UnsupportedOperationException("TODO(reto): And");
    }

    @And("se genera el reporte de resultados")
    public void seGeneraElReporteDeResultados() {
      throw new UnsupportedOperationException("TODO(reto): And");
    }

    @Given("que se ejecutará una prueba de estrés")
    public void queSeEjecutaráUnaPruebaDeEstrés() {
      throw new UnsupportedOperationException("TODO(reto): Given");
    }

    @Given("que se ejecutará una prueba de volumen")
    public void queSeEjecutaráUnaPruebaDeVolumen() {
      throw new UnsupportedOperationException("TODO(reto): Given");
    }

    @Given("que se ejecutará una prueba de estabilidad")
    public void queSeEjecutaráUnaPruebaDeEstabilidad() {
      throw new UnsupportedOperationException("TODO(reto): Given");
    }

    @When("se incrementa la carga gradualmente hasta superar el umbral máximo")
    public void seIncrementaLaCargaGradualmenteHastaSuperarElUmbralMáximo() {
      throw new UnsupportedOperationException("TODO(reto): When");
    }

    @Then("el sistema debe mostrar degradación controlada")
    public void elSistemaDebeMostrarDegradaciónControlada() {
      throw new UnsupportedOperationException("TODO(reto): Then");
    }

    @Then("los recursos del sistema deben alcanzar niveles críticos de uso")
    public void losRecursosDelSistemaDebenAlcanzarNivelesCríticosDeUso() {
      throw new UnsupportedOperationException("TODO(reto): Then");
    }

    private void simulateTestExecution() {
      throw new UnsupportedOperationException("TODO(reto): simulateTestExecution");
    }
}

// === ARCHIVO: src/main/java/README.md ===
# Proyecto de Pruebas de Performance - Fintech

## Descripción del Proyecto

Este proyecto implementa un framework de pruebas de performance automatizadas para una aplicación fintech. El objetivo es garantizar que el sistema pueda manejar las demandas del negocio bajo diferentes condiciones de carga, evaluando métricas críticas como tiempo de respuesta, throughput y tasa de errores.

## Estructura del Proyecto

```
reto/
├── src/
│   ├── main/
│   │   └── java/
│   │       ├── XSteps.java              # Step definitions de Cucumber
│   │       ├── RunCucumberTest.java     # Runner de pruebas Cucumber
│   │       └── README.md                # Este archivo
│   └── test/
│       ├── java/
│       │   └── com/fintech/performance/
│       │       ├── PerformanceTestPlan.java    # Plan de pruebas principal
│       │       └── BasePerformanceTest.java    # Clase base con configuración
│       └── resources/
│           └── performance/
│               ├── performance_test_plan.jmx   # Plan JMeter
│               ├── data/
│               │   └── load_test_data.csv      # Datos de prueba
│               └── scripts/
│                   └── setup_environment.sh    # Script de configuración
├── pom.xml
└── target/
```

## Tipos de Pruebas No Funcionales Implementadas

### 1. Pruebas de Carga (Load Testing)
Verifican el comportamiento del sistema bajo condiciones ожидаемые de carga. Se simula el número normal de usuarios concurrentes para validar que el sistema responde dentro de los umbrales establecidos.

### 2. Pruebas de Estrés (Stress Testing)
Determinan la capacidad máxima del sistema al incrementar la carga más allá de los límites operativos normales. Identifican el punto de ruptura y cómo se recupera el sistema.

### 3. Pruebas de Volumen (Volume Testing)
Evalúan el comportamiento del sistema con grandes volúmenes de datos. Verifican que la base de datos y los componentes de procesamiento manejen eficientemente cantidades masivas de información.

### 4. Pruebas de Estabilidad (Endurance Testing)
Ejecutan el sistema bajo carga sostenida durante períodos prolongados para detectar problemas de memoria, fugas de recursos y degradación progresiva.

### 5. Pruebas de Línea Base (Baseline Testing)
Establecen métricas de referencia para comparaciones futuras. Permiten detectar regresiones de rendimiento entre versiones.

### 6. Pruebas de Tolerancia a Fallas (Resilience Testing)
Validan la capacidad del sistema para recuperarse de fallos y mantener la disponibilidad.

## Configuración de Pruebas

### Parámetros Principales

Los parámetros de configuración se definen en `BasePerformanceTest.java`:

```java
// Umbrales de rendimiento
public static final int MAX_RESPONSE_TIME_MS = 500;
public static final double ERROR_RATE_THRESHOLD = 2.0;
public static final int MIN_THROUGHPUT_RPS = 100;
public static final int RAMP_UP_PERIOD_SECONDS = 30;
public static final int TEST_DURATION_SECONDS = 300;
```

### Ejecución de Pruebas

#### Pruebas con JMeter

Ejecutar el plan de pruebas desde línea de comandos:

```bash
cd src/test/resources/performance
jmeter -n -t performance_test_plan.jmx -l results.jtl -e -o html-report
```

Parámetros:
- `-n`: Modo no-GUI
- `-t`: Archivo del plan de pruebas
- `-l`: Archivo de resultados
- `-e`: Generar reporte después de la prueba
- `-o`: Carpeta de salida para el reporte HTML

#### Pruebas con Cucumber

Ejecutar los escenarios Gherkin:

```bash
mvn test -Dcucumber.filter.tags="@performance"
```

## Datos de Prueba

Los datos de prueba se encuentran en `src/test/resources/performance/data/load_test_data.csv`. El formato esperado es:

```csv
username,password,accountId,transactionType,amount
user001,pass123,ACC-001,TRANSFER,1000.00
user002,pass456,ACC-002,PAYMENT,500.00
```

## Análisis de Resultados

### Métricas Clave

1. **Tiempo de Respuesta**: Tiempo total desde la solicitud hasta la respuesta
2. **Throughput**: Número de solicitudes procesadas por segundo
3. **Tasa de Errores**: Porcentaje de solicitudes que fallan
4. **Percentiles**: P50, P90, P95, P99 del tiempo de respuesta

### Interpretación de Resultados

- **P50 (Mediana)**: Tiempo de respuesta típico
- **P95**: El 95% de las solicitudes responden dentro de este tiempo
- **P99**: Para aplicaciones críticas, el tiempo máximo aceptable

### Quality Gates

El pipeline de calidad incluye los siguientes criterios de paso:

| Métrica | Umbral | Acción |
|---------|--------|--------|
| Tiempo de respuesta P95 | < 500ms | Bloquea release si > |
| Tasa de errores | < 2% | Bloquea release si > |
| Throughput mínimo | > 100 RPS | Advertencia si < |
| Uso de memoria | < 80% | Advertencia si > |

## Integración con CI/CD

El framework está diseñado para integrarse en pipelines de Jenkins, GitLab CI o GitHub Actions:

```yaml
# Ejemplo de configuración en Jenkins
stage('Performance Tests') {
    steps {
        sh 'mvn test -Dtest=PerformanceTestPlan'
    }
    post {
        always {
            junit 'target/surefire-reports/*.xml'
            archiveArtifacts artifacts: 'target/reports/**'
        }
    }
}
```

## Mejores Prácticas

1. **Aislamiento**: Ejecutar pruebas en ambientes controlados y reproducibles
2. **Monitoreo**: Recolectar métricas del sistema durante las pruebas
3. **Datos**: Usar datos realistas y anonimizados para pruebas
4. **Iteración**: Ejecutar pruebas regularmente para detectar regresiones
5. **Documentación**: Mantener registro de resultados y análisis

## Tecnologías Utilizadas

- **JMeter 5.6**: Herramienta principal para pruebas de carga
- **Cucumber**: Framework BDD para especificación ejecutable
- **Spring Boot**: Framework de la aplicación bajo prueba
- **Maven**: Gestión de dependencias y build
- **Java 21**: Versión del lenguaje

## Contacto y Soporte

Para preguntas sobre el framework de pruebas, contactar al equipo de Quality Assurance.

// === ARCHIVO: src/test/java/resources/performance/performance_test_plan.jmx ===
<?xml version="1.0" encoding="UTF-8"?>
<jmeterTestPlan version="1.2" properties="5.0" jmeter="5.6.3">
    <hashTree>
        <TestPlan guiclass="TestPlanGui" testclass="TestPlan" testname="Plan de Pruebas de Performance - Fintech" enabled="true">
            <stringProp name="TestPlan.comments">Plan integral de pruebas no funcionales: carga, estrés y volumen</stringProp>
            <boolProp name="TestPlan.functional_mode">false</boolProp>
            <boolProp name="TestPlan.serialize_threadgroups">false</boolProp>
            <elementProp name="TestPlan.user_defined_variables" elementType="Arguments" guiclass="ArgumentsPanel" testclass="Arguments" testname="Variables Definidas por Usuario" enabled="true">
                <collectionProp name="Arguments.arguments">
                    <elementProp name="BASE_URL" elementType="Argument">
                        <stringProp name="Argument.name">BASE_URL</stringProp>
                        <stringProp name="Argument.value">http://localhost:8080</stringProp>
                        <stringProp name="Argument.metadata">=</stringProp>
                    </elementProp>
                    <elementProp name="API_ENDPOINT" elementType="Argument">
                        <stringProp name="Argument.name">API_ENDPOINT</stringProp>
                        <stringProp name="Argument.value">/api/v1</stringProp>
                        <stringProp name="Argument.metadata">=</stringProp>
                    </elementProp>
                    <elementProp name="THINK_TIME_MIN" elementType="Argument">
                        <stringProp name="Argument.name">THINK_TIME_MIN</stringProp>
                        <stringProp name="Argument.value">500</stringProp>
                        <stringProp name="Argument.metadata">=</stringProp>
                    </elementProp>
                    <elementProp name="THINK_TIME_MAX" elementType="Argument">
                        <stringProp name="Argument.name">THINK_TIME_MAX</stringProp>
                        <stringProp name="Argument.value">2000</stringProp>
                        <stringProp name="Argument.metadata">=</stringProp>
                    </elementProp>
                </collectionProp>
            </elementProp>
            <stringProp name="TestPlan.user_define_classpath"></stringProp>
        </TestPlan>
        <hashTree>
            <ThreadGroup guiclass="ThreadGroupGui" testclass="ThreadGroup" testname="TG-Carga-Baseline" enabled="true">
                <stringProp name="ThreadGroup.on_sample_error">continue</stringProp>
                <elementProp name="ThreadGroup.main_controller" elementType="LoopController" guiclass="LoopControllerGui" testclass="LoopController" testname="Loop Controller" enabled="true">
                    <boolProp name="LoopController.continue_forever">false</boolProp>
                    <stringProp name="LoopController.loops">-1</stringProp>
                    <boolProp name="LoopController.same_user_on_next_iteration">true</boolProp>
                </elementProp>
                <stringProp name="ThreadGroup.num_threads">10</stringProp>
                <stringProp name="ThreadGroup.ramp_time">30</stringProp>
                <boolProp name="ThreadGroup.scheduler">true</boolProp>
                <stringProp name="ThreadGroup.duration">300</stringProp>
                <stringProp name="ThreadGroup.delay"></stringProp>
                <boolProp name="ThreadGroup.same_user_on_next_iteration">true</boolProp>
                <boolProp name="ThreadGroup.delay">0</boolProp>
            </ThreadGroup>
            <hashTree>
                <HTTPSamplerProxy guiclass="HttpTestSampleGui" testclass="HTTPSamplerProxy" testname="GET-Health-Check" enabled="true">
                    <elementProp name="HTTPsampler.Arguments" elementType="Arguments" guiclass="HTTPArgumentsPanel" testclass="Arguments" testname="Variables de Request" enabled="true">
                        <collectionProp name="Arguments.arguments"/>
                    </elementProp>
                    <stringProp name="HTTPSampler.domain">${BASE_URL}</stringProp>
                    <stringProp name="HTTPSampler.port">8080</stringProp>
                    <stringProp name="HTTPSampler.protocol">http</stringProp>
                    <stringProp name="HTTPSampler.contentEncoding"></stringProp>
                    <stringProp name="HTTPSampler.path">/actuator/health</stringProp>
                    <stringProp name="HTTPSampler.method">GET</stringProp>
                    <boolProp name="HTTPSampler.follow_redirects">true</boolProp>
                    <boolProp name="HTTPSampler.auto_redirects">false</boolProp>
                    <boolProp name="HTTPSampler.use_keepalive">true</boolProp>
                    <boolProp name="HTTPSampler.DO_MULTIPART_POST">false</boolProp>
                    <stringProp name="HTTPSampler.embedded_url_re"></stringProp>
                    <stringProp name="HTTPSampler.connect_timeout"></stringProp>
                    <stringProp name="HTTPSampler.response_timeout"></stringProp>
                </HTTPSamplerProxy>
                <hashTree>
                    <ResponseAssertion guiclass="ResponseAssertionGui" testclass="ResponseAssertion" testname="Assert-Status-200" enabled="true">
                        <collectionProp name="Asserion.test_strings">
                            <stringProp name="Assertion.response_code">200</stringProp>
                        </collectionProp>
                        <stringProp name="Assertion.test_field">ResponseCode</stringProp>
                        <boolProp name="Assertion.assume_success">false</boolProp>
                        <intProp name="Assertion.test_type">8</intProp>
                    </ResponseAssertion>
                    <hashTree/>
                </hashTree>
                <hashTree>
                    <HTTPSamplerProxy guiclass="HttpTestSampleGui" testclass="HTTPSamplerProxy" testname="POST-Login-Usuario" enabled="true">
                        <boolProp name="HTTPSampler.postBodyRaw">true</boolProp>
                        <elementProp name="HTTPsampler.Arguments" elementType="Arguments">
                            <collectionProp name="Arguments.arguments">
                                <elementProp name="" elementType="HTTPArgument">
                                    <boolProp name="HTTPArgument.always_encode">false</boolProp>
                                    <stringProp name="Argument.value">{"username":"${username}","password":"${password}"}</stringProp>
                                    <stringProp name="Argument.metadata">=</stringProp>
                                </elementProp>
                            </collectionProp>
                        </elementProp>
                        <stringProp name="HTTPSampler.domain">${BASE_URL}</stringProp>
                        <stringProp name="HTTPSampler.port">8080</stringProp>
                        <stringProp name="HTTPSampler.protocol">http</stringProp>
                        <stringProp name="HTTPSampler.path">${API_ENDPOINT}/auth/login</stringProp>
                        <stringProp name="HTTPSampler.method">POST</stringProp>
                        <boolProp name="HTTPSampler.follow_redirects">true</boolProp>
                        <boolProp name="HTTPSampler.auto_redirects">false</boolProp>
                        <boolProp name="HTTPSampler.use_keepalive">true</boolProp>
                        <boolProp name="HTTPSampler.DO_MULTIPART_POST">false</boolProp>
                    </HTTPSamplerProxy>
                    <hashTree>
                        <ResponseAssertion guiclass="ResponseAssertionGui" testclass="ResponseAssertion" testname="Assert-Token-Presente" enabled="true">
                            <collectionProp name="Asserion.test_strings">
                                <stringProp name="Assertion.reference">token</stringProp>
                            </collectionProp>
                            <stringProp name="Assertion.test_field">ResponseBody</stringProp>
                            <boolProp name="Assertion.assume_success">false</boolProp>
                            <intProp name="Assertion.test_type">2</intProp>
                        </ResponseAssertion>
                        <hashTree/>
                    </hashTree>
                </hashTree>
                <hashTree>
                    <HTTPSamplerProxy guiclass="HttpTestSampleGui" testclass="HTTPSamplerProxy" testname="GET-Cuenta-Usuario" enabled="true">
                        <elementProp name="HTTPsampler.Arguments" elementType="Arguments" guiclass="HTTPArgumentsPanel" testclass="Arguments" testname="Variables de Request" enabled="true">
                            <collectionProp name="Arguments.arguments">
                                <elementProp name="Authorization" elementType="Argument">
                                    <stringProp name="Argument.name">Authorization</stringProp>
                                    <stringProp name="Argument.value">Bearer ${auth_token}</stringProp>
                                    <stringProp name="Argument.metadata">=</stringProp>
                                </elementProp>
                            </collectionProp>
                        </elementProp>
                        <stringProp name="HTTPSampler.domain">${BASE_URL}</stringProp>
                        <stringProp name="HTTPSampler.port">8080</stringProp>
                        <stringProp name="HTTPSampler.protocol">http</stringProp>
                        <stringProp name="HTTPSampler.path">${API_ENDPOINT}/accounts</stringProp>
                        <stringProp name="HTTPSampler.method">GET</stringProp>
                        <boolProp name="HTTPSampler.follow_redirects">true</boolProp>
                        <boolProp name="HTTPSampler.use_keepalive">true</boolProp>
                    </HTTPSamplerProxy>
                    <hashTree/>
                </hashTree>
                <hashTree>
                    <ConstantTimer guiclass="ConstantTimerGui" testclass="ConstantTimer" testname="Think-Time-Carga" enabled="true">
                        <stringProp name="ConstantTimer.delay">1000</stringProp>
                    </ConstantTimer>
                    <hashTree/>
                </hashTree>
            </hashTree>
            <hashTree>
                <ThreadGroup guiclass="ThreadGroupGui" testclass="ThreadGroup" testname="TG-Estres-Progresivo" enabled="true">
                    <stringProp name="ThreadGroup.on_sample_error">continue</stringProp>
                    <elementProp name="ThreadGroup.main_controller" elementType="LoopController" guiclass="LoopControllerGui" testclass="LoopController" testname="Loop Controller" enabled="true">
                        <boolProp name="LoopController.continue_forever">false</boolProp>
                        <stringProp name="LoopController.loops">-1</stringProp>
                    </elementProp>
                    <stringProp name="ThreadGroup.num_threads">50</stringProp>
                    <stringProp name="ThreadGroup.ramp_time">60</stringProp>
                    <boolProp name="ThreadGroup.scheduler">true</boolProp>
                    <stringProp name="ThreadGroup.duration">600</stringProp>
                    <stringProp name="ThreadGroup.delay"></stringProp>
                </ThreadGroup>
                <hashTree>
                    <HTTPSamplerProxy guiclass="HttpTestSampleGui" testclass="HTTPSamplerProxy" testname="POST-Transferencia" enabled="true">
                        <boolProp name="HTTPSampler.postBodyRaw">true</boolProp>
                        <elementProp name="HTTPsampler.Arguments" elementType="Arguments">
                            <collectionProp name="Arguments.arguments">
                                <elementProp name="" elementType="HTTPArgument">
                                    <boolProp name="HTTPArgument.always_encode">false</boolProp>
                                    <stringProp name="Argument.value">{"fromAccount":"${from_account}","toAccount":"${to_account}","amount":${amount},"currency":"USD"}</stringProp>
                                    <stringProp name="Argument.metadata">=</stringProp>
                                </elementProp>
                            </collectionProp>
                        </elementProp>
                        <stringProp name="HTTPSampler.domain">${BASE_URL}</stringProp>
                        <stringProp name="HTTPSampler.port">8080</stringProp>
                        <stringProp name="HTTPSampler.path">${API_ENDPOINT}/transfers</stringProp>
                        <stringProp name="HTTPSampler.method">POST</stringProp>
                        <boolProp name="HTTPSampler.follow_redirects">true</boolProp>
                        <boolProp name="HTTPSampler.use_keepalive">true</boolProp>
                    </HTTPSamplerProxy>
                    <hashTree>
                        <ResponseAssertion guiclass="ResponseAssertionGui" testclass="ResponseAssertion" testname="Assert-Status-201-201" enabled="true">
                            <collectionProp name="Asserion.test_strings">
                                <stringProp name="Assertion.response_code">201</stringProp>
                                <stringProp name="Assertion.response_code">200</stringProp>
                            </collectionProp>
                            <stringProp name="Assertion.test_field">ResponseCode</stringProp>
                            <boolProp name="Assertion.assume_success">false</boolProp>
                            <intProp name="Assertion.test_type">8</intProp>
                        </ResponseAssertion>
                        <hashTree/>
                    </hashTree>
                </hashTree>
                <hashTree>
                    <UniformRandomTimer guiclass="UniformRandomTimerGui" testclass="UniformRandomTimer" testname="Random-Think-Time" enabled="true">
                        <stringProp name="ConstantTimer.delay">${THINK_TIME_MIN}</stringProp>
                        <stringProp name="RandomTimer.range">${THINK_TIME_MAX}</stringProp>
                    </UniformRandomTimer>
                    <hashTree/>
                </hashTree>
            </hashTree>
            <hashTree>
                <ThreadGroup guiclass="ThreadGroupGui" testclass="ThreadGroup" testname="TG-Volumen-Masivo" enabled="true">
                    <stringProp name="ThreadGroup.on_sample_error">continue</stringProp>
                    <elementProp name="ThreadGroup.main_controller" elementType="LoopController" guiclass="LoopControllerGui" testclass="LoopController" testname="Loop Controller" enabled="true">
                        <boolProp name="LoopController.continue_forever">false</boolProp>
                        <stringProp name="LoopController.loops">100</stringProp>
                    </elementProp>
                    <stringProp name="ThreadGroup.num_threads">100</stringProp>
                    <stringProp name="ThreadGroup.ramp_time">120</stringProp>
                    <boolProp name="ThreadGroup.scheduler">false</boolProp>
                    <stringProp name="ThreadGroup.delay"></stringProp>
                </ThreadGroup>
                <hashTree>
                    <CSVDataSet guiclass="TestBeanGUI" testclass="CSVDataSet" testname="CSV-Data-Volumen" enabled="true">
                        <stringProp name="delimiter">,</stringProp>
                        <stringProp name="fileEncoding">UTF-8</stringProp>
                        <stringProp name="filename">data/load_test_data.csv</stringProp>
                        <boolProp name="ignoreFirstLine">true</boolProp>
                        <boolProp name="quotedData">false</boolProp>
                        <boolProp name="recycle">true</boolProp>
                        <stringProp name="shareMode">shareMode.all</stringProp>
                        <boolProp name="stopThread">false</boolProp>
                        <stringProp name="variableNames">username,password,from_account,to_account,amount,transaction_type</stringProp>
                    </CSVDataSet>
                    <hashTree/>
                </hashTree>
                <hashTree>
                    <HTTPSamplerProxy guiclass="HttpTestSampleGui" testclass="HTTPSamplerProxy" testname="POST-Transaccion-Masiva" enabled="true">
                        <boolProp name="HTTPSampler.postBodyRaw">true</boolProp>
                        <elementProp name="HTTPsampler.Arguments" elementType="Arguments">
                            <collectionProp name="Arguments.arguments">
                                <elementProp name="" elementType="HTTPArgument">
                                    <boolProp name="HTTPArgument.always_encode">false</boolProp>
                                    <stringProp name="Argument.value">{"accountId":"${from_account}","type":"${transaction_type}","amount":${amount}}</stringProp>
                                    <stringProp name="Argument.metadata">=</stringProp>
                                </elementProp>
                            </collectionProp>
                        </elementProp>
                        <stringProp name="HTTPSampler.domain">${BASE_URL}</stringProp>
                        <stringProp name="HTTPSampler.port">8080</stringProp>
                        <stringProp name="HTTPSampler.path">${API_ENDPOINT}/transactions</stringProp>
                        <stringProp name="HTTPSampler.method">POST</stringProp>
                        <boolProp name="HTTPSampler.follow_redirects">true</boolProp>
                        <boolProp name="HTTPSampler.use_keepalive">true</boolProp>
                    </HTTPSamplerProxy>
                    <hashTree/>
                </hashTree>
            </hashTree>
            <hashTree>
                <ResultCollector guiclass="ViewResultsFullVisualizer" testclass="ResultCollector" testname="Ver-Resultados-Detallados" enabled="true">
                    <boolProp name="ResultCollector.error_logging">false</boolProp>
                    <objProp>
                        <name>saveConfig</name>
                        <value class="SampleSaveConfiguration">
                            <time>true</time>
                            <latency>true</latency>
                            <timestampFormat>ms</timestampFormat>
                            <responseData>false</responseData>
                            <samplerData>false</samplerData>
                            <xml>false</xml>
                            <fieldNames>true</fieldNames>
                            <responseHeaders>false</responseHeaders>
                            <requestHeaders>false</requestHeaders>
                            <url>true</url>
                            <responseDataOnError>false</responseDataOnError>
                            <saveAssertionResultsFailureMessage>false</saveAssertionResultsFailureMessage>
                            <assertionsResultsToSave>0</assertionsResultsToSave>
                            <bytes>true</bytes>
                            <sentBytes>true</sentBytes>
                            <url>true</url>
                            <threadCounts>true</threadCounts>
                            <idleTime>true</idleTime>
                            <connectTime>true</connectTime>
                        </value>
                    </objProp>
                    <stringProp name="filename">reports/performance_results.jtl</stringProp>
                </ResultCollector>
                <hashTree/>
            </hashTree>
            <hashTree>
                <ResultCollector guiclass="StatVisualizer" testclass="ResultCollector" testname="Resumen-Estadistico" enabled="true">
                    <boolProp name="ResultCollector.error_logging">false</boolProp>
                    <objProp>
                        <name>saveConfig</name>
                        <value class="SampleSaveConfiguration">
                            <time>true</time>
                            <latency>true</latency>
                            <responseData>false</responseData>
                            <samplerData>false</samplerData>
                            <xml>false</xml>
                            <fieldNames>true</fieldNames>
                            <responseHeaders>false</responseHeaders>
                            <requestHeaders>false</requestHeaders>
                            <url>true</url>
                            <responseDataOnError>false</responseDataOnError>
                            <saveAssertionResultsFailureMessage>false</saveAssertionResultsFailureMessage>
                            <assertionsResultsToSave>0</assertionsResultsToSave>
                            <bytes>true</bytes>
                            <sentBytes>true</sentBytes>
                        </value>
                    </objProp>
                    <stringProp name="filename">reports/summary_stats.jtl</stringProp>
                </ResultCollector>
                <hashTree/>
            </hashTree>
            <hashTree>
                <kg.apc.jmeter.vizualizers.CorrectedResultCollector guiclass="kg.apc.jmeter.vizualizers.ThreadsStateOverTimeGui" testclass="kg.apc.jmeter.vizualizers.CorrectedResultCollector" testname="Threads-Activos-Tiempo" enabled="true">
                    <boolProp name="ResultCollector.error_logging">false</boolProp>
                    <stringProp name="filename">reports/threads_over_time.jtl</stringProp>
                    <stringProp name="kg.apc.jmeter.threads.granularity">1000</stringProp>
                </kg.apc.jmeter.vizualizers.CorrectedResultCollector>
                <hashTree/>
            </hashTree>
            <hashTree>
                <kg.apc.jmeter.vizualizers.CorrectedResultCollector guiclass="kg.apc.jmeter.vizualizers.ResponseTimesOverTimeGui" testclass="kg.apc.jmeter.vizualizers.CorrectedResultCollector" testname="Tiempos-Respuesta-Tiempo" enabled="true">
                    <boolProp name="ResultCollector.error_logging">false</boolProp>
                    <stringProp name="filename">reports/response_times_over_time.jtl</stringProp>
                    <stringProp name="kg.apc.jmeter.threads.granularity">1000</stringProp>
                </kg.apc.jmeter.vizualizers.CorrectedResultCollector>
                <hashTree/>
            </hashTree>
        </hashTree>
    </hashTree>
</jmeterTestPlan>

// === ARCHIVO: src/test/java/resources/performance/data/load_test_data.csv ===
username,password,from_account,to_account,amount,transaction_type
user001,pass001,ACC-2024-00001,ACC-2024-00002,150.50,DEPOSIT
user002,pass002,ACC-2024-00002,ACC-2024-00003,275.00,WITHDRAWAL
user003,pass003,ACC-2024-00003,ACC-2024-00004,500.75,TRANSFER
user004,pass004,ACC-2024-00004,ACC-2024-00005,1000.00,DEPOSIT
user005,pass005,ACC-2024-00005,ACC-2024-00001,325.50,TRANSFER
user006,pass006,ACC-2024-00001,ACC-2024-00003,450.25,WITHDRAWAL
user007,pass007,ACC-2024-00002,ACC-2024-00004,875.00,DEPOSIT
user008,pass008,ACC-2024-00003,ACC-2024-00005,1250.75,TRANSFER
user009,pass009,ACC-2024-00004,ACC-2024-00001,2000.00,WITHDRAWAL
user010,pass010,ACC-2024-00005,ACC-2024-00002,650.00,DEPOSIT
user011,pass011,ACC-2024-00001,ACC-2024-00004,375.50,TRANSFER
user012,pass012,ACC-2024-00002,ACC-2024-00005,925.25,WITHDRAWAL
user013,pass013,ACC-2024-00003,ACC-2024-00001,1500.00,DEPOSIT
user014,pass014,ACC-2024-00004,ACC-2024-00002,775.75,TRANSFER
user015,pass015,ACC-2024-00005,ACC-2024-00003,1100.00,WITHDRAWAL
user016,pass016,ACC-2024-00001,ACC-2024-00005,225.50,DEPOSIT
user017,pass017,ACC-2024-00002,ACC-2024-00001,1875.25,TRANSFER
user018,pass018,ACC-2024-00003,ACC-2024-00002,950.00,WITHDRAWAL
user019,pass019,ACC-2024-00004,ACC-2024-00003,1325.50,DEPOSIT
user020,pass020,ACC-2024-00005,ACC-2024-00004,600.75,TRANSFER
user021,pass021,ACC-2024-00001,ACC-2024-00002,825.00,WITHDRAWAL
user022,pass022,ACC-2024-00002,ACC-2024-00003,475.25,DEPOSIT
user023,pass023,ACC-2024-00003,ACC-2024-00004,2100.00,TRANSFER
user024,pass024,ACC-2024-00004,ACC-2024-00005,350.50,WITHDRAWAL
user025,pass025,ACC-2024-00005,ACC-2024-00001,1675.75,DEPOSIT
user026,pass026,ACC-2024-00001,ACC-2024-00003,925.00,TRANSFER
user027,pass027,ACC-2024-00002,ACC-2024-00004,575.25,WITHDRAWAL
user028,pass028,ACC-2024-00003,ACC-2024-00005,1450.50,DEPOSIT
user029,pass029,ACC-2024-00004,ACC-2024-00001,800.00,TRANSFER
user030,pass030,ACC-2024-00005,ACC-2024-00002,1225.75,WITHDRAWAL
user031,pass031,ACC-2024-00001,ACC-2024-00004,425.00,DEPOSIT
user032,pass032,ACC-2024-00002,ACC-2024-00005,1975.50,TRANSFER
user033,pass033,ACC-2024-00003,ACC-2024-00001,650.25,WITHDRAWAL
user034,pass034,ACC-2024-00004,ACC-2024-00002,1550.00,DEPOSIT
user035,pass035,ACC-2024-00005,ACC-2024-00003,900.75,TRANSFER
user036,pass036,ACC-2024-00001,ACC-2024-00005,725.50,WITHDRAWAL
user037,pass037,ACC-2024-00002,ACC-2024-00001,1850.25,DEPOSIT
user038,pass038,ACC-2024-00003,ACC-2024-00002,525.00,TRANSFER
user039,pass039,ACC-2024-00004,ACC-2024-00003,2375.75,WITHDRAWAL
user040,pass040,ACC-2024-00005,ACC-2024-00004,1150.50,DEPOSIT
user041,pass041,ACC-2024-00001,ACC-2024-00002,875.00,TRANSFER
user042,pass042,ACC-2024-00002,ACC-2024-00003,425.25,WITHDRAWAL
user043,pass043,ACC-2024-00003,ACC-2024-00004,1625.50,DEPOSIT
user044,pass044,ACC-2024-00004,ACC-2024-00005,700.00,TRANSFER
user045,pass045,ACC-2024-00005,ACC-2024-00001,975.75,WITHDRAWAL
user046,pass046,ACC-2024-00001,ACC-2024-00003,1300.50,DEPOSIT
user047,pass047,ACC-2024-00002,ACC-2024-00004,550.25,TRANSFER
user048,pass048,ACC-2024-00003,ACC-2024-00005,2050.00,WITHDRAWAL
user049,pass049,ACC-2024-00004,ACC-2024-00001,825.50,DEPOSIT
user050,pass050,ACC-2024-00005,ACC-2024-00002,1475.75,TRANSFER
user051,pass051,ACC-2024-00001,ACC-2024-00004,625.00,WITHDRAWAL
user052,pass052,ACC-2024-00002,ACC-2024-00005,1725.25,DEPOSIT
user053,pass053,ACC-2024-00003,ACC-2024-00001,450.50,TRANSFER
user054,pass054,ACC-2024-00004,ACC-2024-00002,1925.00,WITHDRAWAL
user055,pass055,ACC-2024-00005,ACC-2024-00003,775.75,DEPOSIT
user056,pass056,ACC-2024-00001,ACC-2024-00005,1050.25,TRANSFER
user057,pass057,ACC-2024-00002,ACC-2024-00001,625.50,WITHDRAWAL
user058,pass058,ACC-2024-00003,ACC-2024-00002,2175.00,DEPOSIT
user059,pass059,ACC-2024-00004,ACC-2024-00003,850.75,TRANSFER
user060,pass060,ACC-2024-00005,ACC-2024-00004,1375.25,WITHDRAWAL
user061,pass061,ACC-2024-00001,ACC-2024-00002,525.00,DEPOSIT
user062,pass062,ACC-2024-00002,ACC-2024-00003,1650.50,TRANSFER
user063,pass063,ACC-2024-00003,ACC-2024-00004,925.75,WITHDRAWAL
user064,pass064,ACC-2024-00004,ACC-2024-00005,1575.00,DEPOSIT
user065,pass065,ACC-2024-00005,ACC-2024-00001,675.25,TRANSFER
user066,pass066,ACC-2024-00001,ACC-2024-00003,1825.50,WITHDRAWAL
user067,pass067,ACC-2024-00002,ACC-2024-00004,475.00,DEPOSIT
user068,pass068,ACC-2024-00003,ACC-2024-00005,2250.75,TRANSFER
user069,pass069,ACC-2024-00004,ACC-2024-00001,950.25,WITHDRAWAL
user070,pass070,ACC-2024-00005,ACC-2024-00002,1200.50,DEPOSIT
user071,pass071,ACC-2024-00001,ACC-2024-00004,725.00,TRANSFER
user072,pass072,ACC-2024-00002,ACC-2024-00005,1875.75,WITHDRAWAL
user073,pass073,ACC-2024-00003,ACC-2024-00001,575.25,DEPOSIT
user074,pass074,ACC-2024-00004,ACC-2024-00002,1525.50,TRANSFER
user075,pass075,ACC-2024-00005,ACC-2024-00003,850.00,WITHDRAWAL
user076,pass076,ACC-2024-00001,ACC-2024-00005,1125.75,DEPOSIT
user077,pass077,ACC-2024-00002,ACC-2024-00001,650.25,TRANSFER
user078,pass078,ACC-2024-00003,ACC-2024-00002,2075.50,WITHDRAWAL
user079,pass079,ACC-2024-00004,ACC-2024-00003,925.00,DEPOSIT
user080,pass080,ACC-2024-00005,ACC-2024-00004,1425.75,TRANSFER
user081,pass081,ACC-2024-00001,ACC-2024-00002,575.25,WITHDRAWAL
user082,pass082,ACC-2024-00002,ACC-2024-00003,1750.50,DEPOSIT
user083,pass083,ACC-2024-00003,ACC-2024-00004,425.00,TRANSFER
user084,pass084,ACC-2024-00004,ACC-2024-00005,1950.75,WITHDRAWAL
user085,pass085,ACC-2024-00005,ACC-2024-00001,825.25,DEPOSIT
user086,pass086,ACC-2024-00001,ACC-2024-00003,1075.50,TRANSFER
user087,pass087,ACC-2024-00002,ACC-2024-00004,625.00,WITHDRAWAL
user088,pass088,ACC-2024-00003,ACC-2024-00005,2325.75,DEPOSIT
user089,pass089,ACC-2024-00004,ACC-2024-00001,875.25,TRANSFER
user090,pass090,ACC-2024-00005,ACC-2024-00002,1325.50,WITHDRAWAL
user091,pass091,ACC-2024-00001,ACC-2024-00004,525.00,DEPOSIT
user092,pass092,ACC-2024-00002,ACC-2024-00005,1675.75,TRANSFER
user093,pass093,ACC-2024-00003,ACC-2024-00001,925.25,WITHDRAWAL
user094,pass094,ACC-2024-00004,ACC-2024-00002,1500.50,DEPOSIT
user095,pass095,ACC-2024-00005,ACC-2024-00003,725.00,TRANSFER
user096,pass096,ACC-2024-00001,ACC-2024-00005,1925.75,WITHDRAWAL
user097,pass097,ACC-2024-00002,ACC-2024-00001,575.25,DEPOSIT
user098,pass098,ACC-2024-00003,ACC-2024-00002,2150.50,TRANSFER
user099,pass099,ACC-2024-00004,ACC-2024-00003,875.00,WITHDRAWAL
user100,pass100,ACC-2024-00005,ACC-2024-00004,1275.75,DEPOSIT

// === ARCHIVO: src/test/java/resources/performance/scripts/setup_environment.sh ===
#!/bin/bash

###############################################################################
# Script de configuración del entorno de pruebas de performance
# Este script prepara el ambiente necesario para ejecutar pruebas de carga,
# estrés, volumen y rendimiento con JMeter en el proyecto fintech.
###############################################################################

set -euo pipefail

###############################################################################
# CONFIGURACIÓN DE RUTAS Y VARIABLES DE ENTORNO
###############################################################################

export JMETER_HOME="${JMETER_HOME:-/opt/apache-jmeter-5.6.3}"
export JMETER_BIN="${JMETER_HOME}/bin"
export JMETER_LIB="${JMETER_HOME}/lib"
export JMETER_REPORT_OUTPUT_DIR="${PROJECT_ROOT}/target/jmeter-reports"
export JMETER_LOG_DIR="${PROJECT_ROOT}/target/jmeter-logs"
export JMETER_RESULT_DIR="${PROJECT_ROOT}/target/jmeter-results"

export JAVA_OPTS="${JAVA_OPTS:- -Xms512m -Xmx2048m -XX:+UseG1GC}"
export JMETER_OPTS="${JMETER_OPTS:- -Djmeter.save.saveservice.output_format=xml }"

export BASE_URL="${BASE_URL:-http://localhost:8080}"
export API_BASE_URL="${API_BASE_URL:-http://localhost:8080/api/v1}"
export TEST_ENVIRONMENT="${TEST_ENVIRONMENT:-development}"

export THREAD_COUNT="${THREAD_COUNT:-100}"
export RAMP_UP_PERIOD="${RAMP_UP_PERIOD:-30}"
export LOOP_COUNT="${LOOP_COUNT:-1}"

export RESULTS_FILE_PREFIX="performance_test_results"
export REPORT_TITLE="FinTech Performance Test Report"

###############################################################################
# CONFIGURACIÓN DE PROPIEDADES DEL SISTEMA PARA JMETER
###############################################################################

export JVM_ARGS="${JVM_ARGS:-}"
JVM_ARGS="${JVM_ARGS} -Dfile.encoding=UTF-8"
JVM_ARGS="${JVM_ARGS} -Duser.timezone=UTC"
JVM_ARGS="${JVM_ARGS} -Djava.net.preferIPv4Stack=true"
JVM_ARGS="${JVM_ARGS} -Xlog:gc*:file=${JMETER_LOG_DIR}/gc.log:time,uptime,level,tags"

export JMETER_PROPERTIES="${JMETER_PROPERTIES:-}"
JMETER_PROPERTIES="${JMETER_PROPERTIES} -jsr223.java.compilers=groovy"
JMETER_PROPERTIES="${JMETER_PROPERTIES} -jmeter.reportgenerator.overall_granularity=1000"
JMETER_PROPERTIES="${JMETER_PROPERTIES} -server"

export HEAP_DUMP_PATH="${PROJECT_ROOT}/target/heap-dumps"
export GC_LOG_ENABLED="${GC_LOG_ENABLED:-true}"

###############################################################################
# CREACIÓN DE DIRECTORIOS NECESARIOS
###############################################################################

create_directories() {
    local dirs=(
        "${JMETER_REPORT_OUTPUT_DIR}"
        "${JMETER_LOG_DIR}"
        "${JMETER_RESULT_DIR}"
        "${HEAP_DUMP_PATH}"
        "${PROJECT_ROOT}/src/test/java/resources/performance/data"
        "${PROJECT_ROOT}/src/test/java/resources/performance/scripts"
    )

    for dir in "${dirs[@]}"; do
        if [[ ! -d "${dir}" ]]; then
            mkdir -p "${dir}"
            echo "Directorio creado: ${dir}"
        else
            echo "Directorio existente: ${dir}"
        fi
    done
}

###############################################################################
# VALIDACIÓN DEL ENTORNO
###############################################################################

validate_environment() {
    local errors=0

    echo "========================================"
    echo "Validando entorno de pruebas de performance"
    echo "========================================"

    if [[ -z "${JAVA_HOME:-}" ]]; then
        echo "ERROR: JAVA_HOME no está configurado"
        errors=$((errors + 1))
    else
        echo "JAVA_HOME: ${JAVA_HOME}"
        if [[ -x "${JAVA_HOME}/bin/java" ]]; then
            local java_version
            java_version=$("${JAVA_HOME}/bin/java" -version 2>&1 | head -n 1)
            echo "Versión de Java: ${java_version}"
        else
            echo "ERROR: Ejecutable de Java no encontrado en ${JAVA_HOME}/bin/java"
            errors=$((errors + 1))
        fi
    fi

    if [[ ! -d "${JMETER_HOME}" ]]; then
        echo "ADVERTENCIA: JMETER_HOME no encontrado en ${JMETER_HOME}"
        echo "Se usará JMeter embebido en el proyecto"
    else
        echo "JMETER_HOME: ${JMETER_HOME}"
        if [[ -x "${JMETER_BIN}/jmeter" ]]; then
            echo "JMeter encontrado y ejecutable"
        else
            echo "ADVERTENCIA: jmeter no es ejecutable en ${JMETER_BIN}"
        fi
    fi

    if [[ -z "${BASE_URL}" ]]; then
        echo "ERROR: BASE_URL no está configurado"
        errors=$((errors + 1))
    else
        echo "BASE_URL: ${BASE_URL}"
    fi

    if [[ ${errors} -gt 0 ]]; then
        echo "ERROR: Se encontraron ${errors} error(es) en la validación"
        return 1
    fi

    echo "Validación completada exitosamente"
    return 0
}

###############################################################################
# CONFIGURACIÓN DE PARÁMETROS DE PRUEBA
###############################################################################

configure_test_parameters() {
    echo "========================================"
    echo "Configurando parámetros de prueba"
    echo "========================================"

    case "${TEST_ENVIRONMENT}" in
        development)
            export THREAD_COUNT="${THREAD_COUNT:-10}"
            export RAMP_UP_PERIOD="${RAMP_UP_PERIOD:-10}"
            export LOOP_COUNT="${LOOP_COUNT:-1}"
            echo "Entorno: DEVELOPMENT (carga ligera)"
            ;;
        staging)
            export THREAD_COUNT="${THREAD_COUNT:-50}"
            export RAMP_UP_PERIOD="${RAMP_UP_PERIOD:-20}"
            export LOOP_COUNT="${LOOP_COUNT:-2}"
            echo "Entorno: STAGING (carga media)"
            ;;
        production)
            export THREAD_COUNT="${THREAD_COUNT:-100}"
            export RAMP_UP_PERIOD="${RAMP_UP_PERIOD:-30}"
            export LOOP_COUNT="${LOOP_COUNT:-3}"
            echo "Entorno: PRODUCTION (carga completa)"
            ;;
        *)
            echo "ADVERTENCIA: Entorno desconocido '${TEST_ENVIRONMENT}', usando valores por defecto"
            ;;
    esac

    echo "Parámetros configurados:"
    echo "  - Threads: ${THREAD_COUNT}"
    echo "  - Ramp-up: ${RAMP_UP_PERIOD} segundos"
    echo "  - Iteraciones: ${LOOP_COUNT}"
}

###############################################################################
# EXPORTACIÓN DE FUNCIONES AUXILIARES
###############################################################################

export -f create_directories
export -f validate_environment
export -f configure_test_parameters

###############################################################################
# EJECUCIÓN PRINCIPAL
###############################################################################

main() {
    echo "========================================"
    echo "Inicializando entorno de pruebas"
    echo "========================================"

    create_directories
    configure_test_parameters

    if ! validate_environment; then
        echo "ERROR: La validación del entorno falló"
        echo "Por favor, configure las variables de entorno requeridas"
        return 1
    fi

    echo "========================================"
    echo "Entorno configurado correctamente"
    echo "========================================"
    echo ""
    echo "Variables de entorno disponibles:"
    echo "  - BASE_URL: ${BASE_URL}"
    echo "  - API_BASE_URL: ${API_BASE_URL}"
    echo "  - TEST_ENVIRONMENT: ${TEST_ENVIRONMENT}"
    echo "  - THREAD_COUNT: ${THREAD_COUNT}"
    echo "  - RAMP_UP_PERIOD: ${RAMP_UP_PERIOD}"
    echo "  - JMETER_REPORT_OUTPUT_DIR: ${JMETER_REPORT_OUTPUT_DIR}"
    echo ""
    echo "Para ejecutar pruebas de performance, use:"
    echo "  mvn test -Dtest=PerformanceTestPlan"
    echo ""
}

main "$@"

// === ARCHIVO: src/main/java/RunCucumberTest.java ===
package com.fintech.performance;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
    features = "src/test/resources/features",
    glue = {"com.fintech.performance.steps"},
    plugin = {"pretty", "html:target/cucumber-reports/cucumber.html",
              "json:target/cucumber-reports/cucumber.json"},
    monochrome = true,
    tags = "@performance"
)
public class RunCucumberTest {
}

// === ARCHIVO: src/test/java/com/fintech/performance/PerformanceTestPlan.java ===
package com.fintech.performance;

import org.apache.jmeter.engine.StandardJMeterEngine;
import org.apache.jmeter.reporters.ResultCollector;
import org.apache.jmeter.reporters.Summariser;
import org.apache.jmeter.samplers.SampleSaveConfiguration;
import org.apache.jmeter.util.JMeterUtils;
import org.apache.jorphan.collections.HashTree;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class PerformanceTestPlan {

    private String testType;
    private String endpoint;
    private int users;
    private int rampUpPeriod;
    private int duration;
    private String testPlanPath;
    private StandardJMeterEngine engine;

    public PerformanceTestPlan() {
        this.engine = new StandardJMeterEngine();
        initializeJMeter();
    }

    private void initializeJMeter() {
        String jmeterHome = System.getProperty("jmeter.home", 
            System.getenv("JMETER_HOME") != null ? System.getenv("JMETER_HOME") : ".");
        
        File jmeterProperties = new File(jmeterHome + "/bin/jmeter.properties");
        if (jmeterProperties.exists()) {
            JMeterUtils.loadJMeterProperties(jmeterProperties.getAbsolutePath());
        }
        
        JMeterUtils.setProperty("jmeter.home", jmeterHome);
        JMeterUtils.initLogging();
        JMeterUtils.initLocale();
    }

    public void configureTestPlan(String testPlanFile) {
        this.testPlanPath = testPlanFile;
    }

    public void setTestType(String testType) {
        this.testType = testType;
    }

    public void setEndpoint(String endpoint) {
        this.endpoint = endpoint;
    }

    public void setUsers(int users) {
        this.users = users;
    }

    public void setRampUpPeriod(int rampUpPeriod) {
        this.rampUpPeriod = rampUpPeriod;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public void executeTest() {
        // TODO(reto): Implementar la ejecución del plan de pruebas JMeter
        // 1. Cargar el archivo .jmx del plan de pruebas
        // 2. Configurar los parámetros de prueba (usuarios, ramp-up, duración)
        // 3. Aplicar las modificaciones al plan según el tipo de prueba
        // 4. Ejecutar el test plan
        // 5. Recolectar resultados
        
        System.out.println("Ejecutando prueba de performance: " + testType);
        System.out.println("Endpoint: " + endpoint);
        System.out.println("Usuarios: " + users);
        System.out.println("Ramp-up: " + rampUpPeriod + " segundos");
        System.out.println("Duración: " + duration + " segundos");
    }

    public Map<String, Object> getTestResults() {
        // TODO(reto): Retornar métricas de la ejecución
        // - Tiempo de respuesta promedio
        // - Throughput (req/s)
        // - Tasa de error
        // - Percentiles (p90, p95, p99)
        
        Map<String, Object> results = new HashMap<>();
        results.put("status", "NOT_IMPLEMENTED");
        return results;
    }

    public void generateReport(String outputDirectory) {
        // TODO(reto): Generar reporte HTML con los resultados
        // Usar listeners de JMeter o generar manualmente desde los resultados
    }

    public void stopTest() {
        if (engine != null) {
            engine.stopTest();
        }
    }

    public void cleanup() {
        if (engine != null) {
            engine.exit();
        }
    }
}

// === ARCHIVO: src/test/java/com/fintech/performance/BasePerformanceTest.java ===
package com.fintech.performance;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

public class BasePerformanceTest {

    // Constantes de configuración de thresholds
    protected static final int MAX_RESPONSE_TIME_MS = 2000;
    protected static final int MIN_THROUGHPUT = 100;
    protected static final double ERROR_RATE_THRESHOLD = 5.0;
    protected static final int P90_THRESHOLD_MS = 1500;
    protected static final int P95_THRESHOLD_MS = 1800;
    protected static final int P99_THRESHOLD_MS = 2500;

    // Configuración de prueba
    protected static final int DEFAULT_USERS = 10;
    protected static final int DEFAULT_RAMP_UP_SECONDS = 30;
    protected static final int DEFAULT_DURATION_SECONDS = 300;

    protected PerformanceTestPlan testPlan;
    protected Map<String, Object> testResults;

    @BeforeAll
    public void setup() {
        // TODO(reto): Inicializar el plan de pruebas con configuración base
        testPlan = new PerformanceTestPlan();
        testResults = new HashMap<>();
    }

    @AfterAll
    public void teardown() {
        // TODO(reto): Limpiar recursos después de las pruebas
        if (testPlan != null) {
            testPlan.cleanup();
        }
    }

    @Test
    @DisplayName("Prueba de carga básica - Validar respuesta bajo carga normal")
    public void testBasicLoad() {
        // TODO(reto): Implementar prueba de carga básica
        // 1. Configurar test plan para carga básica
        // 2. Ejecutar prueba
        // 3. Validar resultados contra thresholds
    }

    @Test
    @DisplayName("Prueba de estrés - Validar comportamiento bajo carga máxima")
    public void testStressLoad() {
        // TODO(reto): Implementar prueba de estrés
        // 1. Configurar test plan para estrés
        // 2. Ejecutar prueba con usuarios incrementales
        // 3. Validar punto de ruptura del sistema
    }

    @Test
    @DisplayName("Prueba de volumen - Validar manejo de gran cantidad de datos")
    public void testVolume() {
        // TODO(reto): Implementar prueba de volumen
        // 1. Configurar test plan para volumen
        // 2. Ejecutar con gran volumen de datos
        // 3. Validar tiempos de respuesta
    }

    @Test
    @DisplayName("Prueba de estabilidad - Validar comportamiento en ejecución prolongada")
    public void testEndurance() {
        // TODO(reto): Implementar prueba de estabilidad
        // 1. Configurar test plan para ejecución prolongada
        // 2. Ejecutar por tiempo extendido
        // 3. Validar estabilidad y memory leaks
    }

    protected void validateResponseTime(long avgResponseTime) {
        // TODO(reto): Validar tiempo de respuesta contra MAX_RESPONSE_TIME_MS
    }

    protected void validateThroughput(double throughput) {
        // TODO(reto): Validar throughput contra MIN_THROUGHPUT
    }

    protected void validateErrorRate(double errorRate) {
        // TODO(reto): Validar tasa de errores contra ERROR_RATE_THRESHOLD
    }

    protected void validatePercentiles(Map<String, Long> percentiles) {
        // TODO(reto): Validar percentiles contra umbrales definidos
    }

    protected void logTestResults() {
        // TODO(reto): Registrar resultados de prueba con formato legible
    }
}
```
