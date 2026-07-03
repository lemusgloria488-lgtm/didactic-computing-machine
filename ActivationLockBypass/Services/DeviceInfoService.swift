import Foundation
import UIKit

class DeviceInfoService {
    /// Obtiene información completa del dispositivo
    func getDeviceInfo() -> DeviceInfo {
        let device = UIDevice.current
        
        return DeviceInfo(
            model: device.model,
            systemName: device.systemName,
            osVersion: device.systemVersion,
            uuid: device.identifierForVendor?.uuidString ?? "unknown",
            name: device.name,
            userInterfaceIdiom: device.userInterfaceIdiom.rawValue
        )
    }
    
    /// Obtiene información de hardware
    func getHardwareInfo() -> HardwareInfo {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machine = String(cString: &systemInfo.machine.0, encoding: .ascii) ?? "unknown"
        
        return HardwareInfo(
            machine: machine,
            processor: "A\(getProcessorGeneration())",
            ram: getTotalMemory(),
            storage: getTotalStorage()
        )
    }
    
    /// Obtiene información de conectividad
    func getConnectivityInfo() -> ConnectivityInfo {
        return ConnectivityInfo(
            wifiEnabled: isWifiEnabled(),
            cellularEnabled: isCellularEnabled(),
            bluetoothEnabled: isBluetoothEnabled()
        )
    }
    
    // MARK: - Private Methods
    
    private func getProcessorGeneration() -> String {
        // Simulación educativa
        return "15"
    }
    
    private func getTotalMemory() -> UInt64 {
        return ProcessInfo.processInfo.physicalMemory
    }
    
    private func getTotalStorage() -> UInt64 {
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        do {
            let attributes = try fileManager.attributesOfFileSystem(forPath: documentDirectory.path)
            if let totalSize = attributes[.systemSize] as? NSNumber {
                return totalSize.uint64Value
            }
        } catch {
            return 0
        }
        
        return 0
    }
    
    private func isWifiEnabled() -> Bool {
        // Simulación educativa
        return true
    }
    
    private func isCellularEnabled() -> Bool {
        // Simulación educativa
        return true
    }
    
    private func isBluetoothEnabled() -> Bool {
        // Simulación educativa
        return true
    }
}

// MARK: - Modelos

struct DeviceInfo {
    let model: String
    let systemName: String
    let osVersion: String
    let uuid: String
    let name: String
    let userInterfaceIdiom: Int
}

struct HardwareInfo {
    let machine: String
    let processor: String
    let ram: UInt64
    let storage: UInt64
}

struct ConnectivityInfo {
    let wifiEnabled: Bool
    let cellularEnabled: Bool
    let bluetoothEnabled: Bool
}
