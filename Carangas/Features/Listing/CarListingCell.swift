//
//  CarListingCell.swift
//  Carangas
//
//  Created by Vinicius Alves Beló on 15/02/25.
//

import SwiftUI

struct CarListingCell: View {
    let name: String
    let brand: String
    
    var body: some View {
        HStack {
            Text(name)
                .fontWeight(.semibold)
                .foregroundStyle(Color.accentColor)
            Spacer()
            Text(brand)
                .foregroundStyle(Color.gray)
        }
    }
}

#Preview {
    CarListingCell(name: "Civic", brand: "Honda")
}
