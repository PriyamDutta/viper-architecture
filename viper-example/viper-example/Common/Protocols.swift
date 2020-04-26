//
//  Protocols.swift
//  viper-example
//
//  Created by Priyam Dutta on 26/04/20.
//  Copyright © 2020 Priyam Dutta. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableViewProtocol: class {
    static var reuseableIdentifier: String { get }
}

extension ReusableViewProtocol where Self: UITableViewCell {
    static var reuseableIdentifier: String {
        String(describing: self)
    }
}
