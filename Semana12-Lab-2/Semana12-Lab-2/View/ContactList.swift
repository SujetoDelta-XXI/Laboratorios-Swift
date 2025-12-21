//
//  ContactList.swift
//  Semana12-Lab-2
//
//  Created by Mac11 on 18/11/25.
//

import SwiftUI

struct ContactList: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            List(viewModel.model.contacts) { contact in
                VStack(alignment: .leading, spacing: 6) {
                    Text(contact.name)
                        .font(.headline)
                        .foregroundColor(.blue) // Nombre en azul

                    Text(contact.email)
                        .font(.subheadline)
                        .foregroundColor(.gray) // Email en gris

                    Text(contact.phone)
                        .font(.subheadline)
                        .foregroundColor(.green) // Teléfono en verde
                }
                .padding(.vertical, 8)
            }
            .navigationTitle(" Lista de Contactos")
        }
    }
}

#Preview {
    ContactList()
        .environmentObject(ViewModel())
}
