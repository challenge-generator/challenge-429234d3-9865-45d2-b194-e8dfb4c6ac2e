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