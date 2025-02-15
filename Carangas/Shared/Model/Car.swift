//
//  Car.swift
//  Carangas
//
//  Created by Vinicius Alves Beló on 15/02/25.
//

// https://carangas.herokuapp.com/cars

class Car: Codable, Identifiable {
    var _id: String?
    var brand: String
    var gasType: Int
    var name: String
    var price: Int
    
    var fuel: String {
        switch gasType {
        case 0:
            return "Flex"
        case 1:
            return "Álcool"
        case 2:
            return "Gasolina"
        default:
            return "Desconhecido"
        }
    }
    
    init(
        _id: String? = nil,
        brand: String = "",
        gasType: Int = 0,
        name: String = "",
        price: Int = 0
    ) {
        self._id = _id
        self.brand = brand
        self.gasType = gasType
        self.name = name
        self.price = price
    }
}

extension Car: Equatable {
    static func == (lhs: Car, rhs: Car) -> Bool {
        lhs._id == rhs._id
    }
}

extension Car: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(_id)
    }
}
