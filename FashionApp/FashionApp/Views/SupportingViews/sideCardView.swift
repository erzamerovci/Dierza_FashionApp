import SwiftUI

struct sideCardViewTemp: View {
    @State private var presentSideMenu = true

    var body: some View {
        ZStack {
            SideCardMenu()
        }.background(Color.black)
    }

    @ViewBuilder
    private func SideCardMenu() -> some View {
        SideView(isShowing: $presentSideMenu, content: AnyView(SideCardViewContents(presentSideMenu: $presentSideMenu)), direction: .trailing)
    }
}

struct sideCardViewTemp_Previews: PreviewProvider {
    static var previews: some View {
        sideCardViewTemp()
    }
}

struct SideCardViewContents: View {
    @Binding var presentSideMenu: Bool
    @State private var totalprice: Int = 0
    

    var body: some View {
        VStack(alignment: .leading) {
            sideMenuTopView()
                .padding([.leading, .trailing], 20)
            
            Text("Karta e blerjeve")
                .font(tenorSans(24))
                .foregroundColor(.black)
                .padding([.leading, .trailing],60)
            if cardItems.count > 0 {
                CardFullView()
            }else{
                EmptyCardview()
            }
        
            
            NavigationLink{
                CheckoutView()
            } label: {
                HStack{
                    Image("shoppingbaggg")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:20,height:20)
                        .colorInvert()
                    Text("Porosit")
                        .font(tenorSans(16))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                .frame(height:56)
                .frame(maxWidth: .infinity)
                .background(.black)
                
            }
            
        }
        .onAppear{
            updateCardValue()
        }
       
    }

    @ViewBuilder
    func sideMenuTopView() -> some View {
        VStack {
            HStack {
                Button {
                    presentSideMenu.toggle()
                } label: {
                    Image("close")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 34, height: 34)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 40)
        .padding(.top, 20)
        .padding(.bottom, 10)
    }
    
    @ViewBuilder
    func EmptyCardview()-> some View{
        VStack(alignment: .leading){
            Text("Ju nuk keni asnje produkt ne shporte")
                .font(tenorSans(16))
                .multilineTextAlignment(.center)
                .foregroundColor(Color.Placeholder)
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    func CardFullView()->some View{
        VStack(alignment: .leading){
            VStack{
                ScrollView(.vertical){
                    ForEach(0..<cardItems.count, id: \.self) { i in
                        if cardItems[i].count > 0 {
                            CardItemView(item: cardItems[i]) {
                                updateCardValue()
                            }
                        }
                    }

                        
                }.padding([.leading,.trailing])
                
                VStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height:1)
                        .background(Color.BodyGrey)
                    
                    HStack{
                        Text("Totali")
                            .font(tenorSans(14))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text("$\(totalprice)")
                            .font(tenorSans(16))
                            .foregroundColor(Color.Default)
                        
                            
                    }
                    .padding([.leading,.trailing],50)
                    
                    Text("*Transporti dhe zbritjet llogariten ne cmimin total")
                        .font(tenorSans(16))
                        .foregroundColor(.Placeholder)
                        .frame(height:60,alignment: .topLeading)
                        .padding([.leading,.trailing],20)
                }.frame(height:100)
            }.frame(maxWidth: .infinity,maxHeight: .infinity)
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
}
    
    func updateCardValue(){
        var value: Int = 0
        for item in cardItems{
            value += (item.count * item.product.price)
        }
        
        totalprice=value
    }
    }
    
   

