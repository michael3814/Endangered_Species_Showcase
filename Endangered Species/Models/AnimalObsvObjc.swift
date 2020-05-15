//
//  AnimalObsvObjc.swift
//  Endangered Species
//
//  Created by Michael Chung on 4/23/20.
//  Copyright © 2020 MC. All rights reserved.
//

import Combine
import SwiftUI

final class AnimalObsvObjc: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var animals = animalData
}
