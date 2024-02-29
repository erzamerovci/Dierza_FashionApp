
//
//  CheckoutView.swift
//  FashionApp
//
//  Created by THIS on 2/28/24.
//

import SwiftUI


struct CheckoutView: View {
    
    
    @State var presentSideMenu = false
    @State var presentSideCard = false
    
    @State private var totalPrice: Int = 0
    
    var body: some View {
        ZStack{
            MainCardView()
            //PaymentSuccessView()
        }
        .onAppear{
            updateCardValue()
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    private func MainCardView()-> some View{
        Color.white.edgesIgnoringSafeArea(.all)
        ZStack{
            VStack(spacing: 0){
                Text("PAGESA")
                .font(tenorSans(24))
                .kerning(4)
                .multilineTextAlignment(.center)
                .foregroundColor(.Default)
                .frame(height: 32, alignment: .center)
            
            Image("dividerrr")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(height:60)
                  .padding(.top,-20)
                
                ScrollView(.vertical){
                    VStack{
                        ForEach(0..<cardItems.count, id: \.self){i in
                            
                            if cardItems[i].count > 0 {
                                CardItemView(item: cardItems[i]){
                                     updateCardValue()
                                    
                                }
                            }
                        }
                    }
                }.padding([.leading, .trailing], 20)
                
                VStack(alignment: .leading, spacing:  15){
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 343, height: 1)
                        .background(Color.BodyGrey)
                    
                    Button {
                        
                    } label: {
                        HStack{
                            
                                Image("voucher")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 57, height: 27)
                            Text("Shto promo code")
                                .font(tenorSans(19))
                                .foregroundColor(.BodyGrey)
                            
                        }
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 343, height: 1)
                        .background(Color.BodyGrey)
                    
                    Button {
                        
                    } label: {
                        HStack{
                            Image("delivery")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 57, height: 27)
                            
                            Text("Delivery")
                                .font(tenorSans(19))
                                .foregroundColor(.BodyGrey)
                        }
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 343, height: 1)
                        .background(Color.BodyGrey)
                }
            
                Spacer()
                
                HStack(alignment: .bottom){
                    Text("TOTAL")
                        .font(tenorSans(18))
                        .kerning(2)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text("\(totalPrice) EUR")
                        .font(tenorSans(20))
                        .foregroundColor(Color.Default)
                    
                }
                .padding([.leading, .trailing], 25)
                .frame(height: 80)
                
                Button{
                    
                } label: {
                    HStack{
                        Image("shoppingbaggg")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .colorInvert()
                        
                        Text("Konfirmo porosine")
                            .font(tenorSans(16))
                            .kerning(0.16)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        
                    }
                    .frame(height: 56)
                    .frame(maxWidth: .infinity)
                    .background(.black)
                    
                }
            }
            .padding(.top, 76)
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
      

    
    @ViewBuilder
    private func PaymentSuccessView() ->  some View{
        ZStack {
            Color.BodyGrey.opacity(0.91).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 10){
                Text("BLERJE E SUKSESSHME")
                    .font(tenorSans(17))
                    .kerning(4)
                    .foregroundColor(.black)
                    .padding(.top,20)
                
                Image("successcomplete")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                
                Text("Blerja juaj u krye me sukses!")
                    .font(tenorSans(18))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.BodyGrey)
                
                Text("ID e blerjes: \(111111)")
                    .font(tenorSans(15))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.Label)
                
                Button{
                    
                }label:{
                    HStack(alignment: .center, spacing: 10){
                        Text("KTHEHU NE KRYEFAQE")
                            .font(tenorSans(16))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .overlay{
                                Rectangle()
                                    .inset(by: 0.5)
                                    .stroke(Color.black.opacity(0.5), lineWidth: 1)
                            }
                            .padding([.top, .bottom], 20)
                    }
                    
                    
                    
                }
            }
            .frame(maxWidth: .infinity)
                .background(.white)
                .padding([.leading, .trailing], 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    private func SideMenu() -> some View{
        SideView(isShowing: $presentSideMenu,content: AnyView(SideMenuViewContents(presentSideMenu: $presentSideMenu)), direction: .leading )
    }
    @ViewBuilder
    private func SideCard() -> some View{
        SideView(isShowing: $presentSideCard, content: AnyView(SideCardViewContents( presentSideMenu: $presentSideCard)), direction: .trailing)
        
    }
    
    func updateCardValue(){
        var value: Int = 0
        for item in cardItems{
            value+=(item.count * item.product.price)
        }
        
        totalPrice=value
    }
    
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
