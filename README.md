# 📱 Aplicación de Control Nutricional en Flutter

Esta es una aplicación móvil desarrollada con **Flutter** que permite al usuario llevar un control de sus medidas corporales, calcular indicadores nutricionales importantes y consultar el contenido calórico de distintos alimentos.

## 🚀 Funcionalidades principales

La aplicación consta de tres secciones principales:

1. **📊 Mis Medidas**  
   Permite al usuario registrar y visualizar su historial de:
   - Peso corporal
   - Medidas antropométricas (ej. cintura, altura, etc.)

2. **🧮 Cálculos Nutricionales**  
   El usuario puede calcular indicadores como:
   - IMC (Índice de Masa Corporal)  
   - PI (Peso Ideal)  
   - PIP (Porcentaje de Peso Ideal)  
   - MCM (Masa Corporal Magra)  
   - ACT (Agua Corporal Total)  

3. **🍗 Consultar Calorías**  
   El usuario puede conocer la cantidad de calorías contenidas en una porción específica de alimento (ej. 100 g de pollo, carne, arroz, etc.)

---

## 🛠️ Tecnologías y Herramientas Usadas

- **Visual Studio Code** para la programación en Dart/Flutter.
- **Android Studio** para la creación del proyecto inicial y emulación del dispositivo.
- **Emulador de Android** para pruebas de la aplicación.
- **Flutter SDK** y librerías compatibles con SDK `>=2.12.0 <3.0.0`.

---
## 📁 Estructura de archivos
* assets/: carpeta que contiene las imágenes utilizadas en la interfaz (bocetos, íconos, ilustraciones, etc.)

* lib/: contiene el código Dart de la aplicación.

* pubspec.yaml: archivo de configuración de dependencias y recursos.

---

## 📱 Pantalla principal de la app

![Pantalla principal](/flutter_application_7/assets/img45.jpg)

### 📏 Mis Medidas

![Mis Medidas](assets/img48.jpg)

### 🧮 Cálculos Nutricionales

![Cálculos](assets/img51.jpg)

---
## ✅ Requisitos
* Flutter SDK instalado

* Emulador o dispositivo físico con Android

* Visual Studio Code o Android Studio

---

## 📦 Paquetes utilizados

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  shared_preferences: ^2.0.7
