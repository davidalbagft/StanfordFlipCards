//
//  Array+Only.swift
//  Project1FlipCards
//
//  Created by Alba Domingo, David on 03/09/2020.
//  Copyright © 2020 Alba Domingo, David. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
