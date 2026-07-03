import SwiftUI

struct LogsView: View {
    let logs: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Registro de Eventos")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 6) {
                    if logs.isEmpty {
                        Text("No hay eventos registrados")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        ForEach(logs.reversed().prefix(10), id: \.self) { log in
                            HStack(spacing: 8) {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 6, height: 6)
                                
                                Text(log)
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                                    .lineLimit(2)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical, 8)
            }
            .frame(height: 120)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
        }
    }
}

#Preview {
    LogsView(logs: [
        "[10:30:45] Iniciando análisis",
        "[10:30:46] Conectando a servidor",
        "[10:30:47] Leyendo certificados",
        "[10:30:48] Análisis completado"
    ])
    .padding()
}