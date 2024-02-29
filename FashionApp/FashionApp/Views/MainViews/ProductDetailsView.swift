//
//  ProductDetailsView.swift
//  FashionApp
//
//  Created by THIS on 2/28/24.
//

import SwiftUI

struct ProductDetailsView: View {
    @State var presentSideMenu = false
    @State var presentSideCard = false
  
    var product: Product
        
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack{
                VStack( spacing: 0){
                    ScrollView {
                        TabView{
                            ForEach(0..<product.images.count, id: \.self){
                                i in Image(product.images[i])
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 500)
                                    .clipped()
                                
                            }
                        }
                        .tabViewStyle(.page)
                       // .indexViewStyle(
                            //.page(backgorundDisplayMode:.always))
                        .frame(height: 430)
                        .padding([.leading, .trailing], 20)
                        .padding(.top, 100)
                        
                        VStack(alignment: .leading){
                            HStack(alignment: .top){
                                Text(product.title)
                                    .font(tenorSans(16))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.black)
                                Spacer()
                                Image("export")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                            }
                            Text ("\(product.price) EUR")
                                .font(tenorSans(20))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.Default)
                        }
                        .frame(maxWidth: .infinity)
                        .padding([.leading, .trailing], 20)
                        
                        Text("RRETH PRODUKTIT")
                            .font(tenorSans(14))
                            .foregroundColor(.black)
                            .padding(.top, 10)
                        
                        Text("\(product.description)")
                            .font(tenorSans(14))
                            .foregroundColor(.black)
                            .padding(.top, 3)
                            .padding([.leading, .trailing],20)
                        
                        Text("You may also like")
                            .font(tenorSans(22))
                            .foregroundColor(.black)
                            .padding(.top, 20)
                        
                        Image("dividerrr")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:60)
                            .padding(.top,-30)
                        
                        VStack{
                        HStack(spacing:-10){
                                ProductItemView(product:product2)
                                ProductItemView(product:product6)
                                
                            }
                            
                            HStack(spacing:-10){
                                ProductItemView(product:product4)
                                ProductItemView(product:product5)}
                            
                            HStack(alignment: .center, spacing: 8){
                                Text("Gjej me shume")
                                    .font(tenorSans(20))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                
                                Image(systemName: "arrow.forward")
                                    .frame(width:18, height: 18)
                                
                            }
                            .padding(12)
                        }
                        FooterView()
                        }
                }
                .padding(.top,-45)
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .overlay(alignment: .top){
             HeaderView{
                 presentSideMenu.toggle()
             }
            cardAction:{
                presentSideCard.toggle()
                }
            }
            .overlay(alignment:.bottom){
                ZStack{
                    Button{
                        
                    } label: {
                        HStack {
                            Image("plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:24, height: 24)
                                .colorInvert()
                            
                            Text("Shto ne shporte")
                                .font(tenorSans(20))
                                .kerning(0.14)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Image("heart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .colorInvert()
                        }
                        .padding([.leading, .trailing], 24)
                    }
                }
                .frame(height: 66)
                .frame(maxWidth: .infinity)
                .background(.black)
            }
          
            SideMenu()
            SideCard()
            
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: .bottom)
    }
    
    @ViewBuilder
    private func SideMenu() -> some View{
        SideView(isShowing: $presentSideMenu,content: AnyView(SideMenuViewContents(presentSideMenu: $presentSideMenu)), direction: .leading )
    }
    @ViewBuilder
    private func SideCard() -> some View{
        SideView(isShowing: $presentSideCard, content: AnyView(SideCardViewContents( presentSideMenu: $presentSideCard)), direction: .trailing)
        
    }
    
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: product1)
    }
}
