//
//  ExchangeRate.swift
//  LOTRConverter17
//
//  Created by Swapnil Chatterjee on 27/06/24.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let middleText: String
    let rightImage: ImageResource
    var body: some View {
        HStack{
            
            //left image
            Image(leftImage).resizable().scaledToFit().frame(height: 33)
            
            //text
            Text(middleText)
            //right image
            Image(rightImage).resizable().scaledToFit().frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpiece, middleText: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
}
