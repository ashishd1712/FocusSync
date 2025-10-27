//
//  FocusSessionModel.swift
//  FocusSync
//
//  Created by Ashish Dutt on 28/10/25.
//

import Foundation

struct FocusSession: Identifiable, Codable {
    var id: String = UUID().uuidString
    var title: String
    var startTime: Date
    var endTime: Date
    var allowedApps: [String] = []
    var blockedApps: [String] = []
    var isActive: Bool = false
}

extension FocusSession {
    var duration: TimeInterval {
        endTime.timeIntervalSince(startTime)
    }
}
