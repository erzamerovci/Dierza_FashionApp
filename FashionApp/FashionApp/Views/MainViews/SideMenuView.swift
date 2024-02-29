//
//  SideMenuView.swift
//  FashionApp
//
//  Created by THIS on 2/27/24.
//

import SwiftUI

struct SideMenuViewTemp: View {
    @State var presentSideMenu = true
    var body: some View {
        ZStack{
            SideMenuView()
        }.background(.black)
    }
    
    @ViewBuilder
    private func SideMenuView()-> some View{
        SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContents(presentSideMenu: $presentSideMenu)), direction: .leading)
    }
}

struct SideMenuViewTemp_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuViewTemp()
    }
}

struct SideMenuViewContents: View{
    @Binding var presentSideMenu: Bool
    
    var categories = [Categories.All.rawValue, Categories.Tops.rawValue, Categories.Dresses.rawValue, Categories.Shoes.rawValue, Categories.Accessories.rawValue]
    
    @State private var selectedCategory: Int=0
    
    var body: some View{
        HStack{
            ZStack{
                VStack(alignment: .leading){
                    SideMenuTopView()
                    HStack(spacing: 10){
                        GenderView(isSelected: selectedCategory == 0, title: "FEMRA" )
                            .onTapGesture {
                                selectedCategory = 0
                            }
                        GenderView(isSelected: selectedCategory == 1, title: "MESHKUJ" )
                            .onTapGesture {
                                selectedCategory = 1
                            }
                        GenderView(isSelected: selectedCategory == 2, title: "FEMIJE" )
                            .onTapGesture {
                                selectedCategory = 2
                            }
                        
                    }.frame(maxWidth:.infinity)
                    
                    ForEach(0..<categories.count, id:\.self){ i in CategoryItem(title: categories[i]) {
                        
                    }}
                                        
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        HStack{
                            Image("call")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("(+383) 038-123-456")
                                .font(tenorSans(16))
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 30)
                        .padding(.top, 20)
                    }
                    
                    Button {
                        
                    } label: {
                        HStack{
                            Image("location")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("Bregu i Diellit, Prishtine")
                                .font(tenorSans(16))
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 30)
                        .padding(.top, 20)
                    }
                    
                    VStack(alignment: .center){
                        Image("dividerrr")
                              .resizable()
                              .aspectRatio(contentMode: .fit)
                              .frame(height:60)
                              .padding(.top,-35)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 20)
                    
                    HStack(spacing:30){
                        Spacer()
                        Image("twitter")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:24, height:24)
                        
                        Image("youtube")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:24, height:24)
                        
                        Image("instagram")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:24, height:24)
                        Spacer()
                    }
                    .padding(.top,20)
                    .padding(.bottom,20)
                }
                .frame(maxWidth:.infinity)
            }
        }.padding([.leading, .trailing], 20)
    }
    
    func SideMenuTopView() -> some View{
        VStack{
            HStack{
                Button{
                    presentSideMenu.toggle()
                }label:{
                    Image("close")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 30, height: 30)
                Spacer()
            }
        }
        .frame(maxWidth:.infinity)
        .padding(.leading, 30)
        .padding(.top, 60)
        .padding(.bottom, 0)
        
    }
    
    @ViewBuilder
    func CategoryItem(title: String, action: @escaping(() -> Void)) -> some View {
        
        Button {
            action()
        } label: {
            VStack(alignment: .leading){
                Text(title)
                    .font(tenorSans(16))
                    .foregroundColor(.BodyGrey)
            }
        }
        .frame(height: 50)
        .padding(.leading,30)
        .padding(.top,10)
    }
}


