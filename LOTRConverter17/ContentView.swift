//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Swapnil Chatterjee on 26/06/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency = Currency.silverPiece
    @State var rightCurrency = Currency.goldPiece
    var body: some View {
        ZStack {
            //Image
            Image(
                .background
            )
            .resizable()
            .ignoresSafeArea()
            VStack{
                //Prancing Pony Image
                Image(
                    .prancingpony
                ).resizable()
                    .scaledToFit()
                    .frame(
                        height: 200
                    )
                //Currency exchange Text
                Text(
                    "Currency Exchange"
                )
                .font(
                    .largeTitle
                )
                .foregroundStyle(
                    .white
                )
                // conversion
                HStack{
                    //left conversion
                    VStack{
                        //currency
                        HStack{
                            // currency image
                            Image(
                                leftCurrency.image
                                
                            ).resizable()
                                .scaledToFit()
                                .frame(
                                    height: 33
                                )
                            //currency text
                            Text(
                                leftCurrency.name
                            )
                            .font(
                                .headline
                            )
                            .foregroundStyle(
                                .white
                            )
                        }.padding(
                            .bottom,
                            -5
                        ) .onTapGesture {
                            showSelectCurrency.toggle()
                                
                        }.popoverTip(CurrencyTip(), arrowEdge: .bottom)
                        //TextField
                        TextField(
                            "Amount",
                            text: $leftAmount
                        ).textFieldStyle(
                            .roundedBorder
                        ).focused($leftTyping)
                            .keyboardType(.decimalPad)
                        
                        
                    }
                    //=
                    Image(
                        systemName: "equal"
                    )
                    .font(
                        .largeTitle
                    )
                    .foregroundStyle(
                        .white
                    )
                    .symbolEffect(
                        .pulse
                    )
                    // right conversion
                    VStack{
                        //currency
                        HStack{
                            
                            // currency text
                            Text(
                                rightCurrency.name
                            )
                            .font(
                                .headline
                            )
                            .foregroundStyle(
                                .white
                            )
                            //currency image
                            Image(
                                rightCurrency.image

                            ).resizable()
                                .scaledToFit()
                                .frame(
                                    height: 33
                                )
                        }.padding(
                            .bottom,
                            -5
                        )
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        //TextField
                        TextField(
                            "Amount",
                            text: $rightAmount
                        ).textFieldStyle(
                            .roundedBorder
                        ).multilineTextAlignment(
                            .trailing
                        ).focused($rightTyping)
                            .keyboardType(.decimalPad)
                        
                    }
                }.padding()
                    .background(
                        .black.opacity(
                            0.5
                        )
                    ).clipShape(
                        .capsule
                    )
                Spacer()
                //info button
                HStack{
                    
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                        
                    }label: {
                        Image(
                            systemName: "info.circle.fill"
                        )
                        .font(
                            .largeTitle
                        )
                        .foregroundStyle(
                            .white
                        )
                    }
                    .padding(
                        .trailing
                    )
                }
                
            }
            //            .border(Color.blue)
            
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: rightAmount) {
            if rightTyping {
                
            }                      
        }
        .onChange(of: leftCurrency){
            leftAmount=rightCurrency.convert(from: rightAmount, to: leftCurrency)
        }
        .onChange(of: rightCurrency){
            rightAmount=leftCurrency.convert(from: leftAmount, to: rightCurrency)
        }
        .onChange(of: leftAmount) {
            if leftTyping  {
                rightAmount=leftCurrency.convert(from: leftAmount, to: rightCurrency)
            }
        }
        .sheet(isPresented:$showExchangeInfo , content: {
            ExchangeInfo()
        }).sheet(isPresented: $showSelectCurrency , content:{ SelectCurrency(
        topCurrency: $leftCurrency,bottomCurrency: $rightCurrency
        )})
        
    }
}

#Preview {
    ContentView()
}
