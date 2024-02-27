//
//  HomeView.swift
//  FashionApp
//
//  Created by THIS on 2/25/24.
//
import SwiftUI

struct HomeView: View {
    
    @State var presentSideMenu = false
    
    private var categories = [Categories.All.rawValue, Categories.Tops.rawValue, Categories.Dresses.rawValue, Categories.Shoes.rawValue, Categories.Accessories.rawValue]
                      
    @State private var selectedCategory: Int = 0
    
        var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack{
                VStack( spacing: 0){
                    ScrollView(.vertical){
                        HeroImageView()
                        NewArrivalView()
                        BrandsView()
                        Image("brands")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400)
                        CollectionsView()
                        TrendingHashtagview()
                        FooterView()
                        Spacer()
                    }
                    .edgesIgnoringSafeArea(.all)
                }
                .padding(.top,-45)
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .overlay(alignment: .top){
             HeaderView{
                 presentSideMenu.toggle()
             }
            cardAction:{
                
                }
            }
          
            SideMenu()
            
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
    private func NewArrivalView() -> some View{
        Text("New Arrivals")
            .font(Font.custom("Tenor Sans", size:28))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .padding(.top,10)
            .frame(width: 255, height: 32, alignment: .top)
        
        Image("dividerrr")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height:60)
            .padding(.top,-15)
        
        VStack {
            
            HStack(spacing:10){
                ForEach(0..<categories.count, id: \.self){ i in CategoryView(isSelected: i == selectedCategory, title: categories[i])
                        .onTapGesture {
                            selectedCategory = i
                        }
                }
            }
            .frame(maxWidth: .infinity)
            
            HStack(spacing:-10){
                    ProductItemView(product: product1)
                    ProductItemView(product: product2)
                }
            HStack(spacing:-10){
                    ProductItemView(product: product3)
                    ProductItemView(product: product4)
                }
            HStack(spacing:-10){
                    ProductItemView(product: product5)
                    ProductItemView(product: product6)
                }
            Button{
                            
            }label:{
                    HStack(alignment: .center, spacing: 8){
                    Text("Gjej me shume")
                        .font(tenorSans(20))
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
    private func BrandsView() -> some View{
  

        Text("Brands")
            .padding(.top, 20)
            .padding(.bottom,-10)
            .font(tenorSans(28))
            .foregroundColor(Color.black)
        
        Image("dividerrr")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(height:60)
              .padding(.top,-15)

    }
    @ViewBuilder
    private func CollectionsView() -> some View{
        Text("Collections")
            .font(tenorSans(28))
            .foregroundColor(Color.black)
        
        Image("dividerrr")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(height:60)
              .padding(.top,-35)
        
        Image("summer")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:340,height:244, alignment: .top)
            .clipped()
        Image("model-1")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:340,height:244, alignment: .top)
            .clipped()
        
    }
    @ViewBuilder
    private func SideMenu() -> some View{
        SideView(isShowing: $presentSideMenu,content: AnyView(SideMenuViewContents(presentSideMenu: $presentSideMenu)), direction: .leading )
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
