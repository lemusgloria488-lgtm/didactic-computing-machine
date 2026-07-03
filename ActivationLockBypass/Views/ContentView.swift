import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ActivationLockViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Header
                Text("Herramienta de Análisis")
                    .font(.title)
                    .fontWeight(.bold)
                
                // Status Section
                StatusCardView(
                    status: viewModel.deviceStatus,
                    description: "Estado del dispositivo"
                )
                
                // Main Menu
                VStack(spacing: 12) {
                    MenuButtonView(
                        title: "Información del Dispositivo",
                        icon: "iphone",
                        action: { viewModel.fetchDeviceInfo() }
                    )
                    
                    MenuButtonView(
                        title: "Conexión de Red",
                        icon: "network",
                        action: { viewModel.testNetworkConnection() }
                    )
                    
                    MenuButtonView(
                        title: "Análisis de Activación",
                        icon: "lock.open",
                        action: { viewModel.analyzeActivationLock() }
                    )
                    
                    MenuButtonView(
                        title: "Credenciales",
                        icon: "key.fill",
                        action: { viewModel.showCredentialsView() }
                    )
                }
                .padding()
                
                // Logs Section
                LogsView(logs: viewModel.logs)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Bypass Activation Lock")
            .alert("Error", isPresented: $viewModel.showError) {
                Button("OK") { }
            } message: {
                Text(viewModel.errorMessage)
            }
        }
    }
}

#Preview {
    ContentView()
}