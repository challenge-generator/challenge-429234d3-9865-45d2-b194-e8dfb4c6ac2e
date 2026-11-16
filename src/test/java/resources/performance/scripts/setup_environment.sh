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