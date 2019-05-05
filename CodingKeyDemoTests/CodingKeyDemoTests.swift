//
//  CodingKeyDemoTests.swift
//  CodingKeyDemoTests
//
//  Created by Yiyin Shen on 3/5/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

@testable import CodingKeyDemo
import XCTest

class CodingKeyDemoTests: XCTestCase {

    func testEncoding() {
        let myEncodableModel = MyEncodable(name: "my name")
        do {
            let expectedJSONString = "{\"Name\":\"my name\"}"
            let jsonData = try JSONEncoder().encode(myEncodableModel)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            XCTAssertEqual(jsonString, expectedJSONString)
        } catch {
            XCTFail("Failed to encode MyEncodable model")
        }
    }

    func testDecoding() {
        let jsonString = """
                {"Name": "my name"}
            """
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        if let response = try? decoder.decode(MyDecodable.self, from: jsonData) {
            XCTAssertEqual(response.name, "my name")
        } else {
            XCTFail("Failed to decode JSON data into model object")
        }
    }
}
