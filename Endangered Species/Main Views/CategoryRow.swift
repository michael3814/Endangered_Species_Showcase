//
//  CategoryRow.swift
//  Endangered Species
//
//  Created by Michael Chung on 4/25/20.
//  Copyright © 2020 MC. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName:   String
    var items:          [Animal]
        
        var body: some View {
            VStack(alignment: .leading) {
            Text(self.categoryName)
                .font   (.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { animal in
                        NavigationLink(
                            destination: AnimalDetail(animal: animal)
                        ) {
                            CategoryItem(animal: animal)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryItem: View {
    var animal: Animal
    var body: some View {
        VStack(alignment: .leading) {
            animal.image
                .renderingMode  (.original)
                .resizable()
                .frame          (width: 220, height: 165)
                .cornerRadius   (5)
            
            Text(animal.name)
                .foregroundColor(.primary)
                .font           (.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: animalData[0].category.rawValue,
            items: Array(animalData.prefix(3))
        )
        .environmentObject(AnimalObsvObjc())
    }
}
