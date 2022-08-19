//
//  MyOrderPresenter.swift
//  LearnWidgetKit
//
//  Created by Indra Tirta Nugraha on 14/08/22.
//

import Foundation
import LearnWidgetShared
import WidgetKit

final class MyOrderPresenter {
    
    private lazy var orderInteractor: OrderInteractor = .init()
    
    func onLoadDataSource(completion: (([MyOrderItemViewParam]) -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            let dataSource: [MyOrderItemViewParam] = self.orderInteractor.getMyOrders().map { $0.toMyOrderItemViewParam() }
            
            DispatchQueue.main.async {
                completion?(dataSource)
            }
        }
    }
    
    func onAddOrder(completion: (() -> Void)? = nil) {
        orderInteractor.addOrder()
        WidgetCenter.shared.reloadTimelines(ofKind: LearnWidgetKind.upcomingTickets.rawValue)
        completion?()
    }
    
    func onDeleteOrder(id: String, completion: (() -> Void)? = nil) {
        orderInteractor.deleteOrder(id: id)
        WidgetCenter.shared.reloadTimelines(ofKind: LearnWidgetKind.upcomingTickets.rawValue)
        completion?()
    }
    
}
