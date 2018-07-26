//
//  Post.swift
//  AlamofireExample
//
//  Created by seob on 2018. 7. 24..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import Foundation
 

struct Post {
    var title: String
    var cotent: String
    var imgcover: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case content
        case imgcover
        
    }
}

extension Post: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        cotent = try values.decode(String.self, forKey: .content)
        imgcover = try values.decode(String.self, forKey: .imgcover)
    }
}

extension Post: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(cotent, forKey: .content)
        try container.encode(imgcover, forKey: .imgcover)
    }
} 

