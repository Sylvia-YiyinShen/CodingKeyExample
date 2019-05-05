//
//  MyCodable.swift
//  CodingKeyDemo
//
//  Created by Yiyin Shen on 2/5/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation

class MyDecodable: Decodable {
    let name: String?

    private enum CodingKeys: String, CodingKey {
        case name = "Name"
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}
