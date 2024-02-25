//
//  HomeView.swift
//  FashionApp
//
//  Created by THIS on 2/25/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack{
                VStack( spacing: 0){
                    ScrollView(.vertical){
                        HeroImageView()
                    }
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .overlay(alignment: .top){
             HeaderView{
                 
             }
            cardAction:{
                
            }
            }
          
            
        }
    }
    @ViewBuilder
    private func HeroImageView() -> some View{
        
    }
    @ViewBuilder
    private func Collections() -> some View{
        
    }
    @ViewBuilder
    private func NewArrivalView() -> some View{
        
    }
    @ViewBuilder
    private func SideMenu() -> some View{
        
    }
    @ViewBuilder
    private func SideCard() -> some View{
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
