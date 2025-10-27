//
//  FocusSessionViewModel.swift
//  FocusSync
//
//  Created by Ashish Dutt on 28/10/25.
//

import SwiftUI
import Combine

@MainActor
class FocusSessionViewModel: ObservableObject {
    @Published var sessions: [FocusSession] = []
    
    func addNewSession(title: String, start: Date, end: Date) {
        let newSession = FocusSession(title: title, startTime: start, endTime: end)
        sessions.append(newSession)
    }
    
    func deleteSession(at offsets: IndexSet) {
        sessions.remove(atOffsets: offsets)
    }
    
    func startSession(_ session: FocusSession) {
        
    }
    
    func endSession(_ session: FocusSession) {
        
    }
}

