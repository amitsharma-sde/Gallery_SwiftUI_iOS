//
//  PicsViewModel.swift
//  GalleryApp_SwiftUI
//
//  Created by Amit SDE  on 27/06/24.
//

import Foundation
import SwiftUI

class PicsViewModel: ObservableObject {
    
    @Published var picsModel=[PicsModel]()
    func loadData()  {
        guard let url=URL(string: "https://picsum.photos/v2/list") else {
            print( "Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url){data,response, error in
            if let error = error {
                           print("Error fetching data: \(error)")
                           return
                       }
            guard let data = data else {
                       print("No data received")
                       return
                   }
            
            do {
                           let modelData = try JSONDecoder().decode([PicsModel].self, from: data)
                           DispatchQueue.main.async {
                               self.picsModel = modelData
                               print("Data loaded: \(modelData)") // Debug print statement
                           }
                       } catch {
                           print("Error decoding data: \(error)")
                       }
            
//            let modelData=try? JSONDecoder().decode([PicsModel].self, from: data!)
//            DispatchQueue.main.async {
//                if let model=modelData{
//                    self.picsModel=model
//                }
//            }
            
        }.resume()
        
    }
}
