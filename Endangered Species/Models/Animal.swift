//
//  Animal.swift
//  Endangered Species
//
//  Created by Michael Chung on 4/23/20.
//  Copyright © 2020 MC. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Animal: Hashable, Codable, Identifiable {
    var id:             Int
    var name:           String
    var continent:      String
    var country:        String
    var habitat:        String
    var scientificName: String
    var population:     String
    var isFavorite:     Bool
    var category:       Category
    var whyTheyMatter:  String
    var threat:         [String]
    var threatTitle:    [String]
    
    fileprivate var imageName:      String
    fileprivate var imageName_2:    String
    fileprivate var coordinates:    Coordinates

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude:   coordinates.latitude,
            longitude:  coordinates.longitude)
    }

    enum Category: String, CaseIterable, Codable, Hashable {
        case ciritcal   = "Critically Endangered"
        case endanger   = "Endangered"
        case vulnerable = "Vulnerable"
        case threatened = "Near Threatened"
        case concerned  = "Least Concern"
    }
}

extension Animal {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
    
    var image_title: Image {
        ImageStore.shared.image(name: imageName_2)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
