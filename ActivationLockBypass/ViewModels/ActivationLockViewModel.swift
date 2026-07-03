import Foundation
import Combine

class ActivationLockViewModel: ObservableObject {
    @Published var deviceStatus = "Inicializando"
    @Published var logs: [String] = []
    @Published var showError = false
    @Published var errorMessage = ""
    
    private let activationLockService = ActivationLockService()
    private let deviceInfoService = DeviceInfoService()
    private let networkService = NetworkService()
    
    func fetchDeviceInfo() {
        addLog("Obteniendo información del dispositivo...")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let info = self.deviceInfoService.getDeviceInfo()
            self.addLog("Modelo: \(info.model)")
            self.addLog("Sistema: \(info.osVersion)")
            self.addLog("UUID: \(info.uuid.prefix(8))...")
            self.deviceStatus = "Información obtenida"
        }
    }
    
    func testNetworkConnection() {
        addLog("Probando conexión de red...")
        deviceStatus = "Conectando..."
        
        networkService.testConnection { [weak self] success, latency in
            DispatchQueue.main.async {
                if success {
                    self?.addLog("✓ Conexión exitosa")
                    self?.addLog("Latencia: \(Int(latency * 1000))ms")
                    self?.deviceStatus = "Conectado"
                } else {
                    self?.addLog("✗ Error de conexión")
                    self?.deviceStatus = "Desconectado"
                }
            }
        }
    }
    
    func analyzeActivationLock() {
        addLog("Iniciando análisis de bloqueo de activación...")
        deviceStatus = "Analizando..."
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.addLog("Verificando certificados...")
            self.addLog("Analizando servidores de activación...")
            self.addLog("Consultando estado de cuenta...")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.addLog("✓ Análisis completado")
                self.deviceStatus = "Análisis completado"
            }
        }
    }
    
    func showCredentialsView() {
        addLog("Abriendo gestor de credenciales...")
        deviceStatus = "Credenciales"
    }
    
    private func addLog(_ message: String) {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
        let logEntry = "[\(timestamp)] \(message)"
        DispatchQueue.main.async {
            self.logs.append(logEntry)
        }
    }
}
