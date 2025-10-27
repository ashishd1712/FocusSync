//
//  FocusSessionDetailView.swift
//  FocusSync
//
//  Created by Ashish Dutt on 28/10/25.
//

import SwiftUI

struct FocusSessionDetailView: View {
    // MARK: Properties
    var session: FocusSession
    
    // MARK: Body
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text(session.title)
                .font(.title2)
                .bold()
            
            Text("Starts: \(session.startTime.formatted(date: .omitted, time: .shortened))")
            Text("Ends: \(session.endTime.formatted(date: .omitted, time: .shortened))")
            
            Spacer()
        }
        .padding()
        .navigationTitle("Session Details")
    }
}

#Preview {
    FocusSessionDetailView(session: FocusSession(title: "Title", startTime: Date.now, endTime: Date.now.addingTimeInterval(3600)))
}
