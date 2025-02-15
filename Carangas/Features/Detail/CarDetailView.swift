//
//  CarDetailView.swift
//  Carangas
//
//  Created by Vinicius Alves Beló on 15/02/25.
//

import SwiftUI

struct CarDetailView: View {
    let car: Car
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt-BR")
        return formatter
    }()
    
    var body: some View {
        VStack(spacing: 24){
            CarDataView(image: "car.fill", type: "Marca", value: car.brand)
            CarDataView(image: "fuelpump.fill", type: "Combustível", value: car.fuel)
            CarDataView(image: "dollarsign.circle.fill", type: "Preço", value: numberFormatter.string(from: NSNumber(value: car.price)) ?? "")
            
            Spacer()
        }
        .padding()
        .navigationTitle(car.name)
        .toolbar {
            Button("Editar") {
                
            }
        }
    }
}

struct CarDataView: View {
    let image: String
    let type: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: image)
                Text(type)
            }
            
            Text(value)
                .fontWeight(.medium)
                .font(.title)
                .foregroundStyle(Color.accentColor)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color.accentColor.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        
    }
}

#Preview {
    CarDetailView(car: Car(brand: "Fiat", gasType: 2, name: "Uno", price: 10_000))
}
