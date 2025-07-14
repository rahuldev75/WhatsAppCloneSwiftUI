//
//  CommunityTabScreen.swift
//  WhatsAppClone
//
//  Created by Rahul Dev Nayak on 14/07/25.
//
import SwiftUI
struct CommunityTabScreen: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack( alignment: .leading, spacing: 10) {
                    Image(.communities)
                    
                    Group {
                        Text("Stay connected with a community")
                        
                        
                        Text("Communities bring members together to share ideas, learn from each other, and support one another.")
                            .foregroundStyle(.gray)
                        
                    }
                    .padding(.horizontal, 5)
                    
                    Button("See example communities >"){}
                        .frame(maxWidth: .infinity, alignment: .center)
                    createNewCommunityButton()
                    
                    
                }
                .padding()
                .navigationTitle(Text("Communities"))
            }
        }
    }
    
    private func createNewCommunityButton() -> some View {
        Button{
            
        }label: {
            Label("New Community", systemImage: "plus")
                .bold(true)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundStyle(.white)
                .padding(10)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .padding()
                
        }
    }
}


#Preview {
    CommunityTabScreen()
}
