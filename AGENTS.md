# AGENTS.md

Instrucciones para el agente de IA que abra este repositorio (Claude Code, Cursor, Codex, Copilot, Gemini). Se cargan solas: no hay que pegar nada en ningun chat.

## Que es este repositorio

Es el codigo base de un reto de aprendizaje de Pragma: **Importancia de las Pruebas de Performance en Proyectos**.

| | |
|---|---|
| Tema | Importancia de las pruebas de performance |
| Nivel | advanced-l2 |
| Chapter | Calidad de Software |
| Especialidad | Automatizador |
| Stack | Java / JMeter 5.6 |
| Patron arquitectonico | pruebas de performance con plan de pruebas estructurado |
| Tiempo estimado | 2 horas |

## Receta del stack

Esqueleto obligatorio:

- `pom.xml en la raiz con el runner y el plugin de reportes`
- `src/test/resources/features con los .feature en Gherkin`
- `src/test/java/.../runners con el runner`
- `src/test/java/.../pages o /tasks con Page Objects o Screenplay`
- `src/test/java/.../steps con los step definitions`
- `serenity.conf o config del entorno`

Trampas conocidas:

- Sin parent POM que gestione versiones, TODA dependencia lleva su `<version>` completa de tres segmentos.
- El groupId de Serenity es `net.serenity-bdd`, NO `org.serenity-bdd`. Con el groupId equivocado el artefacto no existe y el build muere resolviendo dependencias.
- Coordenadas exactas de lo mas usado: Selenium `org.seleniumhq.selenium:selenium-java`, Rest Assured `io.rest-assured:rest-assured`, Karate `com.intuit.karate:karate-junit5`, Cucumber `io.cucumber:cucumber-java`.
- JUnit 5 se declara con `junit-jupiter` (agregador) y necesita `maven-surefire-plugin` reciente para ejecutarse.
- Serenity y Cucumber tienen que ser de lineas compatibles entre si; mezclarlas rompe el runner.

Dependencias:

- org.springframework.boot:spring-boot-starter-web
- org.springframework.boot:spring-boot-starter-test
- org.apache.jmeter:ApacheJMeter_core 5.6.3
- org.apache.jmeter:ApacheJMeter_http 5.6.3
- org.apache.jmeter:ApacheJMeter_java 5.6.3
- org.apache.jmeter:jorphan 5.6.3
- org.apache.logging.log4j:log4j-core
- org.slf4j:slf4j-api
- kg.apc:jmeter-plugins 1.4.0

## Tu tarea

Dejar este proyecto en estado **verificable**: que el comando de verificacion corra sin errores. Escribi los archivos en disco, en este repositorio. No generes ZIPs ni archivos adjuntos.

En orden:

1. Corre `mvn -q -B -DskipTests -Dspring-boot.repackage.skip=true package` y mira que falla.
2. Completa lo que falte de la lista de abajo: manifiesto de dependencias, punto de entrada, capa de interfaz y las capas del patron declarado.
3. Arregla SOLO los errores que impiden compilar o arrancar.
4. Volve a correr `mvn -q -B -DskipTests -Dspring-boot.repackage.skip=true package` hasta que pase.
5. Pará ahí.

## Regla dura: las fases son trabajo del humano

**PROHIBIDO implementar los entregables de las fases.** El valor del reto esta en que la persona los resuelva. Tu trabajo es que tenga un proyecto que arranca; el hueco pedagogico se queda como esta.

No resuelvas nada de esto:

- **Fase 1 — Exploración de Tipos de Pruebas No Funcionales**: Un resumen escrito que describe cada tipo de prueba no funcional y su importancia.
- **Fase 2 — Evaluación de la Importancia de las Pruebas No Funcionales**: Un informe que evalúa la importancia de las pruebas no funcionales y propone mejores prácticas para su integración.

Distincion operativa:

- **Arreglar** (si): import faltante, tipo que no existe, dependencia sin declarar, error de sintaxis, archivo referenciado que no existe.
- **No tocar** (no): logica de negocio incompleta, validaciones ausentes, secretos hardcodeados, APIs deprecadas que funcionan, concurrencia insegura, patrones mejorables. Eso es lo que la persona tiene que encontrar.

## Superficie de practica (NO completes)

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs. No toques la logica que el reto pide completar.

- [ ] `src/test/java/com/fintech/performance/PerformanceTestPlan.java` — La fase "Exploración de Tipos de Pruebas No Funcionales" se implementa aqui: este archivo es el ejercicio.
- [ ] `src/test/java/com/fintech/performance/BasePerformanceTest.java` — La fase "Evaluación de la Importancia de las Pruebas No Funcionales" se implementa aqui: este archivo es el ejercicio.
- [ ] `src/main/java/XSteps.java` — La fase "Exploración de Tipos de Pruebas No Funcionales" ya venia resuelta por el codigo base: este archivo pasa a ser el ejercicio.

## Lo que falta y tenes que completar

No se detectaron huecos: estan los archivos declarados, el boilerplate del stack y ninguna referencia quedo colgando. Igual corre el comando de verificacion — que los archivos existan no garantiza que compilen.

### Presentes (9)

- `pom.xml`
- `src/main/java/XSteps.java`
- `src/main/java/README.md`
- `src/test/java/resources/performance/performance_test_plan.jmx`
- `src/test/java/resources/performance/data/load_test_data.csv`
- `src/test/java/resources/performance/scripts/setup_environment.sh`
- `src/main/java/RunCucumberTest.java`
- `src/test/java/com/fintech/performance/PerformanceTestPlan.java`
- `src/test/java/com/fintech/performance/BasePerformanceTest.java`

### Capas del patron declarado

Son las capas que la propuesta arquitectonica plantea, marcadas segun existan hoy en el repo. Orientan donde poner el codigo nuevo; no son una condicion para compilar.

- `src/test/java/com/fintech/performance` (presente)
- `src/test/resources/performance` (ausente)
- `src/test/resources/performance/data` (ausente)
- `src/test/resources/performance/scripts` (ausente)

## Verificacion

```bash
mvn -q -B -DskipTests -Dspring-boot.repackage.skip=true package
```

El comando tiene que pasar SIN implementar los archivos de la superficie de practica: solo andamiaje.

Ese comando pasando es la definicion de "terminado" para vos.

## Convenciones que tenes que respetar

- Un solo ecosistema: no declares librerias de otro lenguaje ni mezcles gestores de paquetes.
- Toda libreria que uses tiene que estar declarada en el manifiesto de dependencias.
- Todo import declarado tiene que usarse; todo tipo usado tiene que existir o venir de una dependencia declarada.
- El patron es **pruebas de performance con plan de pruebas estructurado**: los contratos (interfaces, puertos) los define la capa interna y los implementa la externa, nunca al revés.
- Los archivos que crees llevan implementacion real, no stubs: sin `TODO`, sin cuerpos vacios, sin `// getters y setters`.

## Contexto del candidato

Sirve para calibrar el nivel del codigo, no para resolver las fases.

- Perfil: Chapter Calidad de Software, Especialidad Automatizador, Tecnología Pruebas de Performance, Advanced L2
- Brecha que el reto ataca: Reconoce la importancia de llevar a cabo pruebas no funcionales, como las pruebas de carga, rendimiento, volumen, estrés, estabilidad, linea base, tolerancia a fallas y robustez, dentro de los proyectos, Reconoce la importancia de llevar a cabo pruebas no funcionales, como las pruebas de carga, rendimiento, volumen, estrés, estabilidad, linea base, tolerancia a fallas y robustez, dentro de los proyectos

---

*Generado por Challenge Generator — Pragma. `README.md` tiene el enunciado completo del reto para la persona. `PROMPT_MEJORA.md` es la variante para pegar en un chat, si se prefiere ese flujo.*
