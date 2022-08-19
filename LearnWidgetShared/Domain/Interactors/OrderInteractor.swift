//
//  OrderInteractor.swift
//  LearnWidgetKit
//
//  Created by Indra Tirta Nugraha on 14/08/22.
//

import Foundation

public final class OrderInteractor {
    
    private lazy var orderRepository: OrderRepository = .init()
    
    public init() { }
    
    public func getMyOrders() -> [Order] {
        orderRepository.getDummyOrders()
            .map { $0.toOrder() }
    }
    
    public func addOrder() {
        orderRepository.addDummyOrder()
    }
    
    public func deleteOrder(id: String) {
        orderRepository.deleteOrder(id: id)
    }
    
}
