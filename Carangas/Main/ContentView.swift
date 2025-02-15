//
//  ContentView.swift
//  Carangas
//
//  Created by Vinicius Alves Beló on 15/02/25.
//

import SwiftUI

enum NavigationType {
    case detail
    case form
}

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            CarListingView()
                .navigationDestination(for: NavigationType.self) { navigationType in
                    switch navigationType {
                    case NavigationType.detail: CarDetailView()
                    case NavigationType.form: CarFormView()
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
