//
//  AnimalList.swift
//  Endangered Species
//
//  Created by Michael Chung on 4/23/20.
//  Copyright © 2020 MC. All rights reserved.
//

import SwiftUI

struct AnimalList: View {
    @EnvironmentObject private var animalObsObj: AnimalObsvObjc
    
    var body: some View {
            List{
                
                Toggle(isOn: $animalObsObj.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(animalObsObj.animals) { animal in
                    if (!self.animalObsObj.showFavoritesOnly || animal.isFavorite) {
                    
                NavigationLink(destination: AnimalDetail(animal: animal)) {
                    AnimalRow(animal: animal)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Endangered Species"))
    }
}

struct AnimalList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AnimalList().environmentObject(AnimalObsvObjc())
        }
    }
}
