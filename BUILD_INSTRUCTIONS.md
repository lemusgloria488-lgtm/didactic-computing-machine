# 🚀 Instrucciones para Compilar y Ejecutar

## Requisitos Previos

- **Mac con macOS 12.0+** (Monterey o superior)
- **Xcode 14.0+** (Descargarlo desde App Store)
- **Swift 5.5+** (Incluido en Xcode)
- **iOS 14.0+** (Para el dispositivo o simulador)

## Opción 1: Ejecutar en el Simulador iOS (Recomendado) ✅

### Paso 1: Abrir Xcode
```bash
# Opción A: Desde Terminal
open -a Xcode

# Opción B: Desde Finder
# Applications → Xcode
```

### Paso 2: Crear Nuevo Proyecto
1. File → New → Project
2. Seleccionar: **iOS**
3. Elegir: **App**
4. Click: **Next**

### Paso 3: Configurar el Proyecto

**Product Name:**
```
ActivationLockBypass
```

**Organization Identifier:**
```
com.educativo
```

**Bundle Identifier:**
```
com.educativo.ActivationLockBypass
```

**Team:** (Skip si no tienes)

**Language:** Swift

**User Interface:** SwiftUI

### Paso 4: Copiar Archivos

1. En Xcode, elimina los archivos por defecto:
   - `ContentView.swift`
   - `ActivationLockBypassApp.swift`

2. Copia todos los archivos `.swift` del repositorio:
   - `ActivationLockBypassApp.swift`
   - Carpeta `Views/` (todos los archivos)
   - Carpeta `ViewModels/`
   - Carpeta `Services/`

3. En Xcode:
   - File → Add Files to Project
   - Selecciona los archivos descargados
   - ✅ Marca: "Copy items if needed"
   - ✅ Marca: "Create groups"

### Paso 5: Seleccionar el Simulador

```
▼ ActivationLockBypass
  ▼ ActivationLockBypass
    → iPhone 15 (Simulador)
      ← Haz click aquí y selecciona un modelo
```

Opciones disponibles:
- iPhone 15
- iPhone 15 Pro
- iPhone 15 Pro Max
- iPhone 14
- iPad Air

### Paso 6: Compilar y Ejecutar

**Opción A: Con el botón Play**
```
▶️ Play (esquina superior izquierda)
```

**Opción B: Con teclado**
```
Cmd + R
```

**Opción C: Desde Terminal**
```bash
xcodebuild -scheme ActivationLockBypass -configuration Debug -derivedDataPath build
```

### Paso 7: Esperar la Compilación

La primera compilación puede tardar 2-5 minutos.

```
⏳ Compiling Swift sources...
⏳ Linking...
✅ Build Successful!
```

### Paso 8: Ver la Aplicación

El simulador se abrirá automáticamente mostrando:

```
┌──────────────────────────────────────┐
│  Herramienta de Análisis             │
│                                      │
│  [Estado: Inicializando]             │
│                                      │
│  📱 Información...                   │
│  🌐 Conexión de Red...               │
│  🔓 Análisis...                      │
│  🔑 Credenciales...                  │
│                                      │
│  Registro de Eventos                 │
└──────────────────────────────────────┘
```

---

## Opción 2: Ejecutar en Dispositivo Real 📱

### Paso 1: Configurar la Identidad de Equipo

1. En Xcode: **ActivationLockBypass → Targets → Signing & Capabilities**
2. **Team:** Selecciona tu Apple ID
3. **Bundle Identifier:** Debe ser único (p.ej. com.tuname.activationlock)

### Paso 2: Conectar el iPhone

1. Conecta tu iPhone a la Mac con un cable USB
2. En el iPhone: Confía en la computadora (botón "Confiar")
3. En Xcode, selecciona tu dispositivo en el selector de esquema

### Paso 3: Compilar para Dispositivo

```bash
Cmd + B  # Solo compilar
Cmd + R  # Compilar y ejecutar
```

### Paso 4: Autorizar la Aplicación

1. En el iPhone: Settings → General → VPN & Device Management
2. Selecciona tu Apple ID
3. Tap "Trust"

---

## Solución de Problemas 🔧

### Error: "Could not find Developer Disk Image"
```bash
# Solución:
1. Desconecta el dispositivo
2. En Xcode: Window → Devices and Simulators
3. Selecciona tu dispositivo
4. Click ⚙️ → Unpair
5. Reconecta y vuelve a emparejar
```

### Error: "Code Sign Error"
```bash
# Solución:
1. Xcode → Preferences → Accounts
2. Click ➕ y añade tu Apple ID
3. Reconfigura el Team en Signing & Capabilities
```

### El simulador no abre
```bash
# Opción 1: Reiniciar Xcode
Cmd + Q  # Cierra Xcode
open -a Xcode

# Opción 2: Desde Terminal
xcrun simctl erase all
```

### Error de Swift Syntax
```bash
# Solución:
1. Product → Clean Build Folder (Cmd + Shift + K)
2. Vuelve a compilar (Cmd + B)
```

---

## Probar la Interfaz 🧪

### Pantalla Principal
```
✅ Verifica que aparezcan:
   • Título: "Herramienta de Análisis"
   • Card de estado: "Inicializando"
   • 4 botones de menú
   • Registro de eventos vacío
```

### Test 1: Información del Dispositivo
```
1. Tap en "Información del Dispositivo"
2. Espera 0.5 segundos
3. Verifica en "Registro de Eventos":
   ✓ Modelo: iPhone 15 (o simulador)
   ✓ Sistema: iOS 17.x
   ✓ UUID: A1B2C3D4...
```

### Test 2: Conexión de Red
```
1. Tap en "Conexión de Red"
2. El estado cambia a "Conectando..."
3. Espera 1-2 segundos
4. Verifica:
   ✓ Estado: "Conectado" (🟢)
   ✓ Log: "Conexión exitosa" + latencia
```

### Test 3: Análisis de Activación
```
1. Tap en "Análisis de Activación"
2. El estado cambia a "Analizando..."
3. Verifica múltiples logs:
   ✓ Verificando certificados
   ✓ Analizando servidores
   ✓ Consultando estado
   ✓ Análisis completado ✅
```

---

## Arquitectura del Proyecto 📁

```
ActivationLockBypass/
├── App/
│   └── ActivationLockBypassApp.swift (Punto de entrada)
├── Views/
│   ├── ContentView.swift (Pantalla principal)
│   ├── StatusCardView.swift (Card de estado)
│   ├── MenuButtonView.swift (Botones interactivos)
│   └── LogsView.swift (Registro de eventos)
├── ViewModels/
│   └── ActivationLockViewModel.swift (Lógica de negocio)
└── Services/
    ├── ActivationLockService.swift (Análisis de bloqueo)
    ├── DeviceInfoService.swift (Información del dispositivo)
    └── NetworkService.swift (Conectividad de red)
```

---

## Próximos Pasos 🚀

1. ✅ Interfaz funcionando en simulador
2. ⬜ Agregar más funcionalidades
3. ⬜ Implementar base de datos local
4. ⬜ Exportar logs a archivo
5. ⬜ Interfaz para credenciales
6. ⬜ Gráficas en tiempo real
7. ⬜ Dark Mode completo
8. ⬜ Publicar en App Store

---

## Referencia Rápida de Comandos 🎹

```bash
# Compilar
Cmd + B

# Ejecutar
Cmd + R

# Detener
Cmd + .

# Limpiar
Cmd + Shift + K

# Abrir Preferences
Cmd + ,

# Seleccionar Simulador
Cmd + Shift + 2
```

---

¿Necesitas ayuda? 📞 Revisa los logs en Xcode: **View → Debug Area → Console**
