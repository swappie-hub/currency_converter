//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Swapnil Chatterjee on 26/06/24.
//

import SwiftUI

struct TestView: View {
    @State var showBottomSheet = false
    @State var amountLeft=""
    @State var amountRight=""
    var body: some View{
        ZStack{
          //background image
            
            Image(.background)
                .resizable().ignoresSafeArea()
           VStack {
               Image(.prancingpony).resizable()
                   .scaledToFit().frame(height:200)
                // pony image
               //Text Currency
               
               Text("Currency Exchange").font(.largeTitle).foregroundStyle(.white)
                   
               HStack{
                   VStack {
                      
                       HStack{
                           // coin  image
                           Image(.silverpiece).resizable().scaledToFit().frame(height: 35)
                    
                           //name
                           Text("Silver Piece").foregroundStyle(.white).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                      
                       }.padding(.bottom,-5)
                       TextField("Amount", text: $amountLeft).textFieldStyle(.roundedBorder).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                       //Textfield
                   }
                   Image(systemName: "equal").foregroundStyle(.white
                   ).font(.largeTitle).symbolEffect(.pulse)
                   VStack {
                      
                       HStack{
                           // coin  image
                           Image(.goldpiece).resizable().scaledToFit().frame(height: 35)
                    
                           //name
                           Text("Gold Piece").foregroundStyle(.white).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                      
                       }.padding(.bottom,-5)
                       TextField("Amount", text: $amountLeft).textFieldStyle(.roundedBorder).multilineTextAlignment(.trailing)
                       //Textfield
                   }
               }.padding()
               .background(.black.opacity(0.5))
                   .clipShape(.capsule)
                
               Spacer()
               HStack {
                   Spacer()
                   Button{
                       showBottomSheet.toggle()
                   }label: {
                       Image(systemName: "info.circle.fill").foregroundStyle(.white).font(.largeTitle)
                   }.padding(.trailing)
               }
               
               //info icon
               
            }
        }
        
    }
}

#Preview {
    TestView()
}
