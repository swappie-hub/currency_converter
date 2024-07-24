//
//  CurrencyIcon.swift
//  LOTRConverter17
//
//  Created by Swapnil Chatterjee on 27/06/24.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyImage : ImageResource
    let CurrencyName : String
    var body: some View {
        ZStack(
            alignment: .bottom
        ){
            Image(
                currencyImage
            ).resizable().scaledToFit()
            Text(
                CurrencyName
            ).padding(
                3
            ).font(
                .caption
            ).frame(
                maxWidth:.infinity
            ).background(
                .brown.opacity(
                    0.75
                )
            )
        }.padding(
            3
        ).frame(
            width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,
            height: 100
        ).background(
            .brown
        ).clipShape(
            .rect(
                cornerRadius:  25
            )
        )
    }
}

#Preview {
    CurrencyIcon(currencyImage: .copperpenny, CurrencyName: "Copper Penny")
}
