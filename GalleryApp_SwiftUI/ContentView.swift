//
//  ContentView.swift
//  GalleryApp_SwiftUI
//
//  Created by Amit SDE  on 27/06/24.
//

import SwiftUI

struct ContentView: View {
    //    var images=["1","2","3","4","5","6","7","8","9","10","11","12","13"]
    @ObservedObject var picsViewModel:PicsViewModel
    var body: some View {
        NavigationView{
            List(picsViewModel.picsModel, id: \.self) {data in
                VStack{
                    PicsImageView(url: data.downloadUrl ?? "")
                    
                    Text(data.author ?? "")
                        .font(.system(size: 20,weight: .bold, design:.rounded))
                        .padding()
                   
                }}
            .onAppear(perform: {
                picsViewModel.loadData()
            }).navigationTitle(Text("Gallery"))
        }
    }
}

#Preview {
    ContentView( picsViewModel: PicsViewModel())
}

struct PicsImageView: View {
    var url:String
    var body: some View {
        AsyncImage(url: URL(string:url )){ phase in switch phase {
        case .empty:
            ProgressView()
        case .success(let image):
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(16)
                .shadow(radius:20)
        case .failure(_):
            Image(systemName: "photo")
        @unknown default:
            EmptyView()
        }
        }
    }
}
