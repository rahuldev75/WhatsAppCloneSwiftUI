//
//  UpdateTabScreen.swift
//  WhatsAppClone
//
//  Created by Rahul Dev Nayak on 04/07/25.
//
import SwiftUI
struct UpdateTabScreen: View {
    @State private var SearchText = ""
    var body: some View {
        NavigationStack {
            List {
                StatusSectionHeader()
                    .listRowBackground(Color.clear)
                    
                StatusSection()
                Section{
                    RecentUpdatesItemView()
                }header: {
                    Text("Recent Updates")
                }
                Section{
                    ChannelListView()
                }header: {
                    ChannelSectionHeader()
                }
                
                
            }
            .listStyle(GroupedListStyle())
            .navigationTitle(Text("Update"))
            .searchable(text: $SearchText)
        }
    }
    private func ChannelSectionHeader() -> some View {
        
        HStack {
            Text("Channels")
                .bold() // Removed the invalid bold(true)
                .font(.title3)
                .textCase(nil)
                .foregroundStyle(.whatsAppBlack)

            Spacer()
                Button {
                    // Add action here
                } label: {
                    Image(systemName: "plus")
                        .padding(7)
                        .background(Color(.systemGray5))
                        .clipShape(Circle())
                }

               
            }
    }
    
    
}
extension UpdateTabScreen{
    enum Constant {
        static let imageDimen: CGFloat = 55
    }
}


private struct StatusSectionHeader: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "circle.dashed")
                .foregroundColor(.blue)
                .imageScale(.large)
            
            (
                Text("Use Status to connect with others and that will disappear after 24 hours")
                +
                Text("  ")
                +
                Text("Status privacy")
                    .foregroundColor(.blue).bold()
            )
            Image(systemName: "mark")
                .foregroundColor(.gray)
             
            
        }
        .padding()
        .background(.whatsAppWhite)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

private struct StatusSection: View {
    var body: some View {
        HStack() {
            Circle()
                .frame(width: UpdateTabScreen.Constant.imageDimen, height: UpdateTabScreen.Constant.imageDimen)
            
            VStack(alignment: .leading) {
                Text("My Status")
                    .font(.callout)
                    .bold(true)
                Text("Add to my status")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                
                
                    
            }
            Spacer()
            cameraButton()
            pencilButton()
        }
    }
    private func cameraButton() -> some View {
        Button{
            
        }
        label:{
            Image(systemName: "camera.fill")
                .padding(10)
                .background(Color(.systemGray5))
                .clipShape(Circle())
                .bold(true)
                
            
        }
    }
    
    private func pencilButton() -> some View {
        Button{
            
        }
        label:{
            Image(systemName: "pencil")
                .padding(10)
                .background(Color(.systemGray5))
                .clipShape(Circle())
                .bold(true)
                
            
        }
    }
}

private struct RecentUpdatesItemView: View {
    var body: some View {
        HStack() {
            Circle()
                .frame(width: UpdateTabScreen.Constant.imageDimen, height: UpdateTabScreen.Constant.imageDimen)
            VStack(alignment: .leading) {
                Text("Eminem")
                    .font(.callout)
                    .bold(true)
                Text("1 min ago")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                
                
                    
            }
        }
        
    }
}
private struct ChannelListView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Stay updated on topics that matter to you. Find channels to follow below")
                .foregroundColor(.gray)
                .font(.callout)
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(0..<5){_ in
                        ChannelItemView()
                        
                    }
                }
            }
            Button("Explore more"){ }
            .tint(.blue)
            .bold(true)
            .buttonStyle(.borderedProminent)
            .clipShape(Capsule())
            .padding(.vertical)
        }
    }
}

private struct ChannelItemView: View {
    var body: some View {
        VStack{
            Circle()
                .frame(width: 55, height: 55)
            Text("Shady Records")
                .font(.caption).bold(true)
            Button{
            }label: {
                    Text("Follow")
                        .bold(true)
                        .padding(5)
                        .frame(width: .infinity)
                        .background(Color.blue.opacity(0.4))
                        .clipShape(Capsule())
                
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical)
        .overlay(RoundedRectangle(cornerRadius: 10)
        .stroke(Color(.systemGray4), lineWidth: 1))
    }
}


#Preview {
    UpdateTabScreen()
}
