//
//  Array+Identifiable.swift
//  Project1FlipCards
//
//  Created by Alba Domingo, David on 02/09/2020.
//  Copyright © 2020 Alba Domingo, David. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(of element: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == element.id {
                return index
            }
        }
        return nil
    }
}
