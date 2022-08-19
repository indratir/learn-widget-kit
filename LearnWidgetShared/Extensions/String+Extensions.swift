//
//  String+Extensions.swift
//  LearnWidgetKit
//
//  Created by Indra Tirta Nugraha on 14/08/22.
//

import Foundation

extension String {
    public func toDateTime(format: String = "yyyy-MM-dd HH:mm:ss") -> Date {
        let dateFormatter: DateFormatter = .init()
        dateFormatter.dateFormat = format
        
        if let date = dateFormatter.date(from: self) {
            return date
        }
        
        return .init()
    }
}

extension Encodable {
    func convertToData() -> Data? {
        if let data = try? JSONEncoder().encode(self) {
            return data
        }
        return nil
    }
}

extension Decodable {
    static func convertFrom(_ data: Data) -> Self? {
        if let object = try? JSONDecoder().decode(Self.self, from: data) {
            return object
        }
        return nil
    }
}
