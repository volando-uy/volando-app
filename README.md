# ✈️ Volando.UY - Proyecto Final UTEC 2025

Bienvenido/a al repositorio principal del proyecto **Volando.UY**, una plataforma web distribuida para la gestión de vuelos, aerolíneas y reservas desarrollada por estudiantes de Tecnólogo en Informática - UTEC.

Este repositorio agrupa y coordina los tres grandes componentes del sistema:

* 🧠 **Servidor Central** (`app-central`): lógica de negocio y servicios web.
* 🌐 **Aplicación Web** (`app-web`): interfaz para clientes y aerolíneas vía navegador.
* 📆 **Ejecutable Final**: archivo `.exe` que arranca todo desde un solo punto en entorno Windows.

---

## 📁 Estructura del proyecto

```
C:\Users\<tu usuario>\volandouy\
│
├── volando-app\
│   ├── app-central\         ← Submódulo con el servidor central (Java)
│   ├── app-web\             ← Submódulo con la app web (JSP + Tomcat)
│   ├── application.properties
│   ├── start-web.bat
│   ├── volando.exe
│   ├── volando.xml
│   └── volando.log
```

---

## 🚀 Cómo ejecutar el sistema

### 1️⃣ Clonar el proyecto con submódulos

```bash
git clone --recurse-submodules https://github.com/volando-uy/volando-app.git
```

Si lo clonaste sin submódulos, corre:

```bash
git submodule update --init --recursive
```

---

### 2️⃣ Ubicación obligatoria

> El proyecto **debe estar ubicado exactamente** en esta ruta:

```
C:\Users\<tu usuario>\volandouy\
```

Esto es necesario para que `volando.exe` y los scripts funcionen correctamente.

---

### 3️⃣ Base de datos requerida

Creá una base de datos llamada:

```
volandodb
```

La configuración de acceso está en `application.properties`.

---

### 4️⃣ Lanzar la aplicación

* Opcion 1: Hacé doble click en `volando.exe`
* Opcion 2: Ejecutá el script manualmente:

```bash
start-web.bat
```

Esto levantará el **Servidor Web** con Tomcat, conectado al **Servidor Central**.

---

## 🔮 Requisitos

* Java 17+
* Apache Maven
* Tomcat 10+
* PostgreSQL
* Git

---

## 🔗 Submódulos y Repositorios

| Componente    | Descripción                                     | Link                                                  |
| ------------- | ----------------------------------------------- | ----------------------------------------------------- |
| `app-central` | Lógica de negocio, servicios REST, testing, JAR | [Ver repo](https://github.com/volando-uy/app-central) |
| `app-web`     | Frontend JSP + Servlets, login, reservas, etc.  | [Ver repo](https://github.com/volando-uy/app-web)     |

---

## 🎓 Info del Proyecto

* **Materia:** Programación de Aplicaciones
* **Carrera:** Tecnólogo en Informática – UTEC
* **Año:** 2025
* **Arquitectura:** Distribuida, multicapas, REST, Web + Mobile + Desktop

---

## 👥 Integrantes

* Jose Hernández
* Nahuel Martínez
* Juan Quian
* Ignacio Suárez

---

## 📸 Diagramas del Sistema

* [Casos de Uso](./Volando-Caso%20de%20Uso.jpg)
* [UML](./Volando-UML.jpg)

---

## 🪨 Troubleshooting

* Verificá que los submódulos estén bien descargados.
* Asegurate de tener la base `volandodb` creada y accesible.
* Revisá `volando.log` para ver errores.
* Si Tomcat no arranca, asegurate que el puerto esté libre.

---

## 🛫 Licencia

Este proyecto es parte de una actividad académica y su uso está limitado al ámbito educativo.

