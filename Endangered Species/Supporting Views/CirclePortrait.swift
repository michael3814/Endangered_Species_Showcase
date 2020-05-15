//
//  CirclePortrait.swift
//  Endangered Species
//
//  Created by Michael Chung on 4/23/20.
//  Copyright © 2020 MC. All rights reserved.
//

import SwiftUI

struct CirclePortrait: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4)
            )
            .shadow(radius: 10)
    }
}

struct CirclePortrait_Previews: PreviewProvider {
    static var previews: some View {
        CirclePortrait(image: Image("Amur_Leopard"))
    }
}
