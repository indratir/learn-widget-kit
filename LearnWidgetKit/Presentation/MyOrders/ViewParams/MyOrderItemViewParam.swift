//
//  MyOrderItemViewParam.swift
//  LearnWidgetKit
//
//  Created by Indra Tirta Nugraha on 14/08/22.
//

import Foundation
import UIKit
import LearnWidgetShared

struct MyOrderItemViewParam {
    let id: String?
    let title: String?
    let date: String?
    let iconImage: UIImage?
    let type: String?
    let desc: String?
}

extension Order {
    func toMyOrderItemViewParam() -> MyOrderItemViewParam {
        var iconImage: UIImage?
        var orderTypeText: String?
        
        if let type = self.type {
            iconImage = .init(systemName: type.iconSystemName)
            orderTypeText = type.name
        }
        
        return .init(
            id: self.id,
            title: self.title,
            date: self.date?.toString(format: "E, dd MMM yyyy • HH:mm"),
            iconImage: iconImage,
            type: orderTypeText,
            desc: self.desc
        )
    }
}
