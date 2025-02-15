//
//  ContentView.swift
//  Carangas
//
//  Created by Vinicius Alves Beló on 15/02/25.
//

import SwiftUI

enum NavigationType: Hashable {
    case detail(Car)
    case form(Car)
}

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            CarListingView()
                .navigationDestination(for: NavigationType.self) { navigationType in
                    switch navigationType {
                    case .detail(let car):
                        CarDetailView(car: car)
                    case .form(let car):
                        CarFormView()
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
