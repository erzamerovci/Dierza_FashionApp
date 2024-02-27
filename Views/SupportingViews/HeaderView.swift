//
//  HeaderView.swift
//  FashionApp
//
//  Created by THIS on 2/25/24.
//

import SwiftUI

struct HeaderView: View {
    
    var menuAction: ButtonActive
    var cardAction: ButtonActive

    
    var body: some View {
        ZStack{
            HStack(spacing:10){
                Button{
                   menuAction()
                } label:{
                    Image("menuuuu")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: 24, height: 40)
                .frame( maxWidth:.infinity, alignment: .leading)
                .padding(.leading,20)
                
                Image("llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:84, height:84)
                
                Button{
                    cardAction()
                } label:{
                    Image("shoppingbaggg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: 24, height: 24)
                .frame( maxWidth:.infinity, alignment: .trailing)
                .padding(.trailing,20)

            }
            
        }
        //.frame(maxWidth: .infinity ,alignment: .trailing)
        .frame(width: 340)
        .frame(height:56)
        .background(.white)
        .zIndex(1)
        .shadow(radius:0.3)
        
       
    }
    
}


