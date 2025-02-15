//
//  CarListingView.swift
//  Carangas
//
//  Created by Vinicius Alves Beló on 15/02/25.
//

import SwiftUI

struct CarListingView: View {
    @State private var cars: [Car] = []
    private let service = CarService()
    
    var body: some View {
        List {
            ForEach(cars) { car in
                NavigationLink(value: NavigationType.detail(car)) { 
                    CarListingCell(name: car.name, brand: car.brand)
                }
            }
        }
        .navigationTitle("Carros")
        .toolbar {
            Button("", systemImage: "plus.circle.fill") {
                
            }
        }
        .task {
            await loadCars()
        }
    }
    
    private func loadCars() async {
        let result = await service.loadCars()
        switch result {
        case.success(let cars):
            self.cars = cars
        case .failure(let error):
            print("Error: \(error)")
        }
    }
}

#Preview {
    NavigationStack {
        CarListingView()
    }
}
