//
//  CarService.swift
//  Carangas
//
//  Created by Vinicius Alves Beló on 15/02/25.
//

import Foundation

enum CarServiceError: Error {
    case badURL
    case noResponse
    case invalidStatusCode
    case decodingError
    case unknown
    
    var message: String {
        switch self {
        case .badURL:
            return "URL inválida"
        case .noResponse:
            return "Servidor não envou uma resposta válida"
        case .invalidStatusCode:
            return "Status code inválido"
        case .decodingError:
            return "Erro ao decodificar os dados"
        case .unknown:
            return "Ocorreu um erro inesperado"
        }
    }
}

class CarService {
    private let basePath = "https://carangas.herokuapp.com/cars"
    private let session = URLSession.shared
    
    func loadCars() async -> Result<[Car], CarServiceError> {
        guard let url = URL(string: basePath) else {
            return .failure(.badURL)
        }
        
        do {
            let (data, response) = try await session.data(from: url)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            if !(200...299 ~= response.statusCode) {
                return .failure(.invalidStatusCode)
            }
            let cars = try JSONDecoder().decode([Car].self, from: data)
            return .success(cars)
        } catch {
            return .failure(.decodingError)
        }
    }
}
