//
//  AnimalRow.swift
//  Endangered Species
//
//  Created by Michael Chung on 4/23/20.
//  Copyright © 2020 MC. All rights reserved.
//

import SwiftUI

struct AnimalRow: View {
    var animal: Animal
    
    var body: some View {
        HStack {
            animal.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(animal.name)
            Spacer()
            
            if animal.isFavorite {
            Image(systemName: "star.fill")
                .imageScale(.medium)
                .foregroundColor(.yellow)
            }
        }
    }
}

struct AnimalRow_Previews: PreviewProvider {
    static var previews: some View {
        AnimalRow(animal: animalData[0])
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
