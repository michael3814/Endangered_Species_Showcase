//
//  AnimalDetail.swift
//  Endangered Species
//
//  Created by Michael Chung on 4/23/20.
//  Copyright © 2020 MC. All rights reserved.
//

import SwiftUI

struct AnimalDetail: View {
    @EnvironmentObject var AnimalObsObj: AnimalObsvObjc
    var animal: Animal
    
    var animalIndex: Int {
        AnimalObsObj.animals.firstIndex(where: { $0.id == animal.id })!
    }
    
    var body: some View {
        TabView {
            InfoView(animal: animal)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Info")
            }
            
            ThreatView(animal: animal)
                .tabItem {
                    Image(systemName: "alarm.fill")
                    Text("Threats")
            }
            
            LocationView(animal: animal)
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
            }
        }
    }
}

struct InfoView: View {
    @EnvironmentObject var AnimalObsObj: AnimalObsvObjc
    var animal: Animal
    var animalIndex: Int {
        AnimalObsObj.animals.firstIndex(where: { $0.id == animal.id })!
    }
    
    var body: some View {
        VStack {
            animal.image_title
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.top, -50)
                .frame(maxWidth: UIScreen.main.bounds.width)
                .edgesIgnoringSafeArea(.top)

            CirclePortrait(image: animal.image)
                .offset(y: -150)
                .padding(.bottom, -150)
                .frame(maxWidth: UIScreen.main.bounds.width)

            
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(animal.name)
                            .font(.title)
                        
                        // Favorite Button
                        Button(action: {
                            self.AnimalObsObj.animals[self.animalIndex].isFavorite.toggle()
                        }) {
                            if self.AnimalObsObj.animals[self.animalIndex].isFavorite {
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.yellow)
                            } else {
                                Image(systemName: "star")
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                    
                    HStack {
                        Text(animal.scientificName)
                            .font(.subheadline)
                            .italic()
                        Spacer()
                        Text(animal.continent)
                    }
                }
                .padding(.top, -20)
                
                // More animal details list
                List {
                    VStack {
                        Text("Why They Matter")
                        .underline()
                            .font(.headline)
                            .padding(.bottom, 5)
                            .padding(.trailing, 5)
                        Text(animal.whyTheyMatter)
                            .font(.body)
                            .lineLimit(nil)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Population")
                            .font   (.headline)
                            .padding(.bottom, 15)
                            .padding(.top, 5)
                        Text(animal.population)
                            .font(.body)
                    }
                    .listRowBackground(Color(UIColor.lightGray))
                    
                    VStack(alignment: .leading) {
                        Text("Habitats")
                            .font   (.headline)
                            .padding(.bottom, 15)
                            .padding(.top, 5)
                        Text(animal.country)
                        Text(animal.habitat)
                    }
                }
            }
            .padding()
            Spacer()
        }
    }
}


struct ThreatView: View {
    var animal: Animal
    var body: some View {
        NavigationView() {
            List {
                ForEach(0 ..< animal.threatTitle.count) { index in
                    VStack {
                        Text(self.animal.threatTitle[index])
                            .font(.headline)
                            .underline()
                            .lineLimit(nil)
                        Text(self.animal.threat[index])
                            .font(.body)
                            .lineLimit(nil)
                    }
                }
            }
            .navigationBarTitle("Threats")
        }
    }
}


struct LocationView: View {
    var animal: Animal
    var body: some View {
        MapView(coordinates: animal.locationCoordinate)
            .edgesIgnoringSafeArea(.top)
    }
}

struct AnimalDetail_Previews: PreviewProvider {
    static var previews: some View {
        AnimalDetail(animal: animalData[0])
    }
}
