//
//  HomeView.swift
//  FashionApp
//
//  Created by THIS on 2/25/24.
//

import SwiftUI

struct HomeView: View {
    
    private var categories = [Categories.All.rawValue, Categories.Apparel.rawValue, Categories.Dress.rawValue, Categories.Tshirt.rawValue, Categories.Bag.rawValue]
                      
                            
    @State private var selectedCategory: Int = 0
    
        var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack{
                VStack( spacing: 0){
                    ScrollView(.vertical){
                        HeroImageView()
                        NewArrivalView()
                        Spacer()
                    }
                    .edgesIgnoringSafeArea(.all)
                }
                .padding(.top,-45)
                
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
        ZStack {
            Image("model")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height:640)
            
            
            Button{
                print("Eksploro Koleksionin Button Clicked")
            } label: {
                RoundedRectangle(cornerRadius: 30).overlay{
                    Text("Eksploro Koleksionin")
                        .font(Font.custom("Tenor Sans", size: 20))
                        .foregroundColor(.white)
                }            }
            .frame(width:253,height:40)
            .tint(.black.opacity(0.4))
            .offset(.init(width: 0, height: 10))
        }
    }
    @ViewBuilder
    private func Collections() -> some View{
        
    }
    @ViewBuilder
    private func NewArrivalView() -> some View{
        Text("New Arrivals")
            .font(Font.custom("Tenor Sans", size:28))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .padding(.top,-90)
            .frame(width: 255, height: 32, alignment: .top)
        
        Image("Divider")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:140)
            .padding(.top,10)
        
        VStack {
            HStack(spacing:20){
                ForEach(0..<categories.count, id:\.self){
                    i in CategoryView(isSelected: i == selectedCategory, title:categories[i])
                        .onTapGesture {
                            selectedCategory = i
                        }
                }
            }
            .frame(maxWidth: .infinity)
            
            HStack{
                ProductItemView(product: product1)
                ProductItemView(product: product2)
            }
            HStack{
                ProductItemView(product: product3)
                ProductItemView(product: product4)
            }
            
            Button{
                
            }label:{
                HStack(alignment: .center, spacing: 8){
                Text("Gjej me shume")
                        .font(tenorSans(_size: 20))
                        .multilineTextAlignment(.center)
                    
                Image(systemName: "arrow.forward")
                        .frame(width:18, height:18)
                }
            }
            .tint(Color.BodyGrey)
            .padding(12)
        }
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
