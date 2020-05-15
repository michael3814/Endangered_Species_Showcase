//
//  CategoryHome.swift
//  Endangered Species
//
//  Created by Michael Chung on 4/25/20.
//  Copyright © 2020 MC. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    // Chooses a random animal to be featured
    let FeaturedAnimal = animalData[Int.random(in: 0 ... animalData.count - 1)]
    
    var categories: [String: [Animal]] {
        Dictionary(
            grouping: animalData,
            by: { $0.category.rawValue }
        )
    }
    
    var body: some View {
       
        NavigationView {
            List{
                // Featured Row
                    VStack(alignment: .center) {
                        Text("Featured Animal")
                            .font   (   .title)
                            .padding(   .leading,  15)
                            .padding(   .top,      10)
                            .padding(   .bottom,   -10)
                        
                        NavigationLink(destination: AnimalDetail(animal: FeaturedAnimal)) {
                        FeaturedAnimal.image
                            .resizable()
                            .renderingMode  (.original)
                            .cornerRadius(10)
                            .clipped()
                            .listRowInsets(EdgeInsets())
                            .padding(.trailing, -16)
                        }
                        
                        Text(FeaturedAnimal.name)
                            .padding(   .leading,  15)
                            .font(.system (size: 20, weight: .bold))
                }
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: AnimalList()) {
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Endangered Species"))

        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
