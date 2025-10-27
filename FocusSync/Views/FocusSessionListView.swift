//
//  ContentView.swift
//  FocusSync
//
//  Created by Ashish Dutt on 28/10/25.
//

import SwiftUI

struct FocusSessionListView: View {
    
    // MARK: Properties
    @StateObject private var focusVM = FocusSessionViewModel()
    @State private var showingAddSheet: Bool = false
    
    // MARK: Body
    var body: some View {
        NavigationStack {
            List {
                ForEach(focusVM.sessions) { session in
                    NavigationLink {
                        FocusSessionDetailView(session: session)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(session.title)
                                .font(.headline)
                            Text("\(session.startTime.formatted(date: .omitted, time: .shortened)) - \(session.endTime.formatted(date: .omitted, time: .shortened))")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .onDelete { indexSet in
                    focusVM.deleteSession(at: indexSet)
                }
            }
            .navigationTitle("Focus Sessions")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                }
                
                #if DEBUG
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        addTestSessions()
                    } label: {
                        Text("🔥")
                    }

                }
                #endif

            }
            .sheet(isPresented: $showingAddSheet) {
                AddFocusSessionView(focusVM: focusVM)
            }
            
        }
    }
}

//DEBUG FUCTION
extension FocusSessionListView {
    func addTestSessions() {
        focusVM.removeAllSessions()
        let randomInt = Int.random(in: 1...20)
        for i in 0..<randomInt {
            let session = FocusSession(title: "Title \(i)", startTime: Date.now, endTime: Date.now.addingTimeInterval(100000))
            focusVM.addNewSession(session)
        }
    }
}

// MARK: Preview
#Preview {
    FocusSessionListView()
}
