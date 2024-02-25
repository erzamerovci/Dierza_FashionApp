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
            HStack{
                Button{
                   menuAction()
                } label:{
                    Image("Menu")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 24, height: 24)
                .frame( maxWidth:.infinity, alignment: .leading)
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:84, height:84
                           
                    )
                
                Button{
                    cardAction()
                } label:{
                    Image("shopping bag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 24, height: 24)
                .frame( maxWidth:.infinity, alignment: .trailing)
            }
            
        }
        
        .frame(maxWidth: .infinity)
        .frame(height:56)
        .background(.white)
        .zIndex(1)
        .shadow(radius:0.3)
        
       
    }
    
}


