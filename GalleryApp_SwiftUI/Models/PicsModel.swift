//
//  PicsModel.swift
//  GalleryApp_SwiftUI
//
//  Created by Amit SDE  on 27/06/24.
//

import Foundation

struct PicsModel:Codable, Identifiable, Hashable  {
    var id:String?
    var author:String?
    var downloadUrl:String?
    
    enum CodingKeys:String, CodingKey {
        case id
        case author
        case downloadUrl="download_url"
    }
}
