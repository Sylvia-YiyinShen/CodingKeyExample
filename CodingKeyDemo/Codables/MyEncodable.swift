//
//  MyEncodable.swift
//  CodingKeyDemo
//
//  Created by Yiyin Shen on 2/5/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation

class MyEncodable: Encodable {
    let name: String?
    init(name: String) {
        self.name = name
    }

    private enum CodingKeys: String, CodingKey {
        case name = "Name"
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
