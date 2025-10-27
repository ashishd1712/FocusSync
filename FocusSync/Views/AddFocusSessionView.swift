//
//  AddFocusSessionView.swift
//  FocusSync
//
//  Created by Ashish Dutt on 28/10/25.
//

import SwiftUI

struct AddFocusSessionView: View {
    // MARK: Properties
    @ObservedObject var focusVM: FocusSessionViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    @FocusState private var isShowingKeyboard: Bool
    
    @State private var sessionTitle: String = ""
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date()
    
    // MARK: Body
    var body: some View {
        NavigationStack {
            Form {
                TextField("Session Title", text: $sessionTitle)
                    .focused($isShowingKeyboard)
                
                DatePicker("Start Time", selection: $startTime, displayedComponents: .hourAndMinute)
                
                DatePicker("End Time", selection: $endTime, displayedComponents: .hourAndMinute)
            }
            .navigationTitle("New Focus Session")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        focusVM.addNewSession(title: sessionTitle, start: startTime, end: endTime)
                        dismiss()
                    }
                    .disabled(sessionTitle.isEmpty)
                    .buttonStyle(.borderedProminent)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        .onTapGesture {
            isShowingKeyboard = false
        }
    }
}

#Preview {
    AddFocusSessionView(focusVM: FocusSessionViewModel())
}
