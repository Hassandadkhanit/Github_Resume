//
//  UserNotFound.swift
//  Github Resume
//
//  Created by Hassan dad khan on 11/17/19.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import Foundation

struct UserNotFound : Codable {
    let message : String?
    let documentation_url : String?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case documentation_url = "documentation_url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        documentation_url = try values.decodeIfPresent(String.self, forKey: .documentation_url)
    }

}
