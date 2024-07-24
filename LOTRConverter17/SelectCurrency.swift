//
//  SelectCurrency.swift
//  LOTRConverter17
//
//  Created by Swapnil Chatterjee on 27/06/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Binding var topCurrency :Currency
    @Binding var bottomCurrency :Currency
    @Environment (
        \.dismiss
    ) var dismiss
    var body: some View {
        ZStack{
            // background Image
            Image(
                .parchment
            ).resizable().ignoresSafeArea().background(
                .brown
            )
            VStack{
                //heading 1
                Text(
                    "Select the Currency you are starting with :"
                ).fontWeight(
                    /*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/
                )
                
                //Grid 1
               
                IconGrid(currency: $topCurrency)
                //heading 2
                Text(
                    "Select the Currency you would like to convert to :"
                ).fontWeight(
                    /*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/
                )
                
                //grid 2
                IconGrid(currency: $bottomCurrency)
                //button
                Button(
                    "Done"
                ){
                    dismiss()
                }
                .buttonStyle(
                    .borderedProminent
                )
                .tint(
                    .brown
                )
                .font(
                    .largeTitle
                )
                .padding().foregroundStyle(
                    .white
                )
                
                
            }.padding()
                .multilineTextAlignment(
                    .center
                )
        }
    }
}

#Preview {
    SelectCurrency(
        topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.silverPiece)
    )
}
