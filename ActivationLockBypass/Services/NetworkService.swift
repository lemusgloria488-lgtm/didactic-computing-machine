import Foundation
import Network

class NetworkService {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    var isConnected: Bool {
        return monitor.currentPath.status == .satisfied
    }
    
    init() {
        startMonitoring()
    }
    
    /// Prueba la conectividad con un servidor remoto
    func testConnection(completion: @escaping (Bool, TimeInterval) -> Void) {
        let startTime = Date()
        let testURL = URL(string: "https://www.apple.com")!
        var request = URLRequest(url: testURL)
        request.timeoutInterval = 5.0
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            let elapsed = Date().timeIntervalSince(startTime)
            let success = error == nil && (response as? HTTPURLResponse)?.statusCode == 200
            completion(success, elapsed)
        }.resume()
    }
    
    /// Obtiene información de latencia a un servidor específico
    func getPingLatency(to host: String, completion: @escaping (TimeInterval?) -> Void) {
        // Simulación educativa
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.3) {
            completion(TimeInterval.random(in: 10...100))
        }
    }
    
    /// Obtiene información de la red actual
    func getNetworkInfo() -> NetworkInfo {
        let path = monitor.currentPath
        
        var connectionType = "Desconocida"
        if path.usesInterfaceType(.wifi) {
            connectionType = "Wi-Fi"
        } else if path.usesInterfaceType(.cellular) {
            connectionType = "Celular"
        } else if path.usesInterfaceType(.wiredEthernet) {
            connectionType = "Ethernet"
        }
        
        return NetworkInfo(
            isConnected: path.status == .satisfied,
            connectionType: connectionType,
            isExpensive: path.isExpensive,
            isConstrained: path.isConstrained
        )
    }
    
    // MARK: - Private Methods
    
    private func startMonitoring() {
        monitor.pathUpdateHandler = { _ in
            // Actualizar estado de conexión
        }
        monitor.start(queue: queue)
    }
    
    deinit {
        monitor.cancel()
    }
}

// MARK: - Modelos

struct NetworkInfo {
    let isConnected: Bool
    let connectionType: String
    let isExpensive: Bool
    let isConstrained: Bool
}
