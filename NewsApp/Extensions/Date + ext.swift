//
//  Date + ext.swift
//  NewsApp
//
//  Created by Николай on 09.05.2025.
//

import Foundation

extension Date {
    func convertData() -> String {
        return formatted(.dateTime.hour().minute().day().month().year())
    }
}
