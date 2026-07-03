import SwiftUI

struct StatusCardView: View {
    let status: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(description)
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack {
                Circle()
                    .fill(statusColor)
                    .frame(width: 12, height: 12)
                
                Text(status)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: statusIcon)
                    .foregroundColor(statusColor)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    private var statusColor: Color {
        switch status.lowercased() {
        case "activo", "conectado":
            return .green
        case "inactivo", "desconectado":
            return .red
        default:
            return .orange
        }
    }
    
    private var statusIcon: String {
        switch status.lowercased() {
        case "activo", "conectado":
            return "checkmark.circle.fill"
        case "inactivo", "desconectado":
            return "xmark.circle.fill"
        default:
            return "questionmark.circle.fill"
        }
    }
}

#Preview {
    VStack(spacing: 12) {
        StatusCardView(status: "Activo", description: "Estado del dispositivo")
        StatusCardView(status: "Desconectado", description: "Conexión de red")
        StatusCardView(status: "Analizando", description: "Proceso")
    }
    .padding()
}