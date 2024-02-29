//
//  ProductsList.swift
//  FashionApp
//
//  Created by THIS on 2/28/24.
//

import SwiftUI

struct ProductsList: View {
    @State var presentSideMenu = false
    @State var presentSideCard = false
    
    internal let adaptiveColumns=[GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack{
                VStack(spacing:0){
                    HStack{
                        Text("Produktet")
                            .font(tenorSans(24))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding()
                    
                    ScrollView(.vertical)
                    {
                        VStack{
                            ScrollView(.vertical){
                                LazyVGrid(columns: adaptiveColumns){
                                    ForEach(0..<10,id:\.self){ i in
                                    
                                        ProductItemView(product:products.randomElement()!)
                                        
                                    }
                                }
                                
                            }
                            //.scrollIndicators(.hidden)
                        }.padding([.leading,.trailing],20)
                        FooterView()
                        
                    }
                    .edgesIgnoringSafeArea(.all)
                }
                .padding(.top,60)
                
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
          
            SideMenu()
            SideCard()
            
        }
        .navigationBarHidden(true)
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

struct ProductsList_Previews: PreviewProvider {
    static var previews: some View {
        ProductsList()
    }
}
