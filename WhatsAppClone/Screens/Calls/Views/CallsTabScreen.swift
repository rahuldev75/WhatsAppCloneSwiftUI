//
//  CallsTabScreen.swift
//  WhatsAppClone
//
//  Created by Rahul Dev Nayak on 05/07/25.
//

import SwiftUI

struct CallsTabScreen: View {
    @State private var searchText = ""
    @State private var callHistory: CallHistory = .all

    var body: some View {
        NavigationStack {
            List {
                Section{
                    CreateCallLinkSection()
                }
                Section{
                    ForEach(0..<20){ _ in
                        RecentCallItemView()
                    }
                }header: {
                    Text("Recent")
                        .textCase(nil)
                        .font(.headline)
                        .bold(true)
                        .foregroundStyle(.whatsAppBlack)
                }
            }
            .navigationTitle("Calls")
            .searchable(text: $searchText)
            .toolbar {
                leadingNavItem()
                trailingNavItem()
                principalNavItem()
            }
        }
    }
}

extension CallsTabScreen {

    @ToolbarContentBuilder
    private func trailingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                // Call action
            } label: {
                Image(systemName: "phone.arrow.up.right")
            }
        }
    }

    @ToolbarContentBuilder
    private func leadingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button("Edit") {
                // Edit action
            }
        }
    }

    @ToolbarContentBuilder
    private func principalNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Picker("", selection: $callHistory) {
                ForEach(CallHistory.allCases) { history in
                    Text(history.rawValue.capitalized).tag(history)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 150)
        }
    }

    private enum CallHistory: String, CaseIterable, Identifiable {
        case all, missed

        var id: String { self.rawValue }
    }
}

private struct CreateCallLinkSection: View {
    var body: some View {
        HStack{
            Image(systemName: "link")
                .padding(8)
                .background(Color(.systemGray6))
                .clipShape(Circle())
            VStack (alignment: .leading) {
                Text("Create Call Link")
                    .foregroundColor(.blue)
                Text("Share a link for your WhatsApp call")
                    .foregroundStyle(.gray)
                    .font(.caption)
            }
        }
    }
}


private struct RecentCallItemView:  View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: 45,height: 45)
           recentCallTextView()
            Spacer()
            Text("Yesterday")
                .font(.system(size: 16))
                .foregroundStyle(.gray)
            Image(systemName: "info.circle")
                .foregroundStyle(.gray)

        }
    }
    private func recentCallTextView() -> some View {
        VStack (alignment: .leading) {
            Text("Juice WRLD")
            HStack{
                Image(systemName: "phone.arrow.up.right.fill")
                Text("Outgoing")
            }
            .font(.system(size: 14))
            .foregroundStyle(.gray)
                
            
        }
        
    }
}


#Preview {
    CallsTabScreen()
}
