//
//  OrderRepository.swift
//  LearnWidgetKit
//
//  Created by Indra Tirta Nugraha on 14/08/22.
//

import Foundation
import Fakery

final class OrderRepository {
    
    private lazy var userDefaults: UserDefaults? = .init(suiteName: "group.com.indratir.LearnWidgetKit")
    private let dummyOrdersKey: String = "dummyOrders"
    private lazy var faker: Faker = .init()
    
    func getDummyOrders() -> [OrderRepositoryParam] {
        if let data = userDefaults?.data(forKey: dummyOrdersKey),
           let orders = [OrderRepositoryParam].convertFrom(data) {
            return orders
        }
        
        return []
    }
    
    func addDummyOrder() {
        var orders: [OrderRepositoryParam] = getDummyOrders()
        let currentTime: Int = Date().milliseconds
        
        if currentTime % 2 == 0 {
            orders.append(createTrainDummyOrder())
        } else {
            orders.append(createFlightDummyOrder())
        }
        
        if let data = orders.convertToData() {
            userDefaults?.set(data, forKey: dummyOrdersKey)
        }
    }
    
    func deleteOrder(id: String) {
        var orders: [OrderRepositoryParam] = getDummyOrders()
        orders.removeAll(where: { $0.id == id })
        
        if let data = orders.convertToData() {
            userDefaults?.set(data, forKey: dummyOrdersKey)
        }
    }
    
    private func createFlightDummyOrder() -> OrderRepositoryParam {
        let order: OrderRepositoryParam = .init(
            id: UUID().uuidString,
            date: Date().addSeconds(10).toString(),
            title: "\(faker.address.city()) - \(faker.address.city())",
            desc: faker.lorem.sentence(),
            type: "FLIGHT"
        )
        
        return order
    }
    
    private func createTrainDummyOrder() -> OrderRepositoryParam {
        let order: OrderRepositoryParam = .init(
            id: UUID().uuidString,
            date: Date().addSeconds(10).toString(),
            title: "\(faker.address.city()) - \(faker.address.city())",
            desc: faker.lorem.sentence(),
            type: "TRAIN"
        )
        
        return order
    }
    
    private func createCarRentalDummyOrder() -> OrderRepositoryParam {
        let order: OrderRepositoryParam = .init(
            id: UUID().uuidString,
            date: Date().addSeconds(10).toString(),
            title: faker.car.brand(),
            desc: faker.lorem.sentence(),
            type: "CAR_RENTAL"
        )
        
        return order
    }
    
}
