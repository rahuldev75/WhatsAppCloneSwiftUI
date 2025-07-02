//
//  MainTabView.swift
//  WhatsAppClone
//
//  Created by Rahul Dev Nayak on 02/07/25.
//

import SwiftUI

struct MainTabView: View {
    init() {
        makeTabBarOpaque()
    }

    var body: some View {
        TabView {
            placeholderView("Updates")
                .tabItem {
                    Image(systemName: Tab.updates.icon)
                    Text(Tab.updates.title)
                }

            placeholderView("Calls")
                .tabItem {
                    Image(systemName: Tab.calls.icon)
                    Text(Tab.calls.title)
                }

            placeholderView("Communities")
                .tabItem {
                    Image(systemName: Tab.communities.icon)
                    Text(Tab.communities.title)
                }

            placeholderView("Chats")
                .tabItem {
                    Image(systemName: Tab.chats.icon)
                    Text(Tab.chats.title)
                }

            placeholderView("Settings")
                .tabItem {
                    Image(systemName: Tab.settings.icon)
                    Text(Tab.settings.title)
                }
        }
    }

    private func makeTabBarOpaque() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

// MARK: - Placeholder Views and Tab Enum

extension MainTabView {

    private func placeholderView(_ title: String) -> some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(0..<20) { index in
                    Text("\(title) - Item \(index + 1)")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .frame(height: 120)
                        .background(Color.green.opacity(0.3))
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
    }

    private enum Tab: String {
        case updates, calls, communities, chats, settings

        var title: String {
            rawValue.capitalized
        }

        var icon: String {
            switch self {
            case .updates:
                return "circle.dashed.inset.filled" // Replace if unsupported
            case .calls:
                return "phone"
            case .communities:
                return "person.3"
            case .chats:
                return "message"
            case .settings:
                return "gear"
            }
        }
    }
}

// MARK: - Preview

#Preview {
    MainTabView()
}
