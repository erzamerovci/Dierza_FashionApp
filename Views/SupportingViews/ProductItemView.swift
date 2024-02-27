//
//  ProductItemView.swift
//  FashionApp
//
//  Created by THIS on 2/26/24.
//

import SwiftUI

struct ProductItemView: View {
    var product: Product
    var body: some View {
        VStack{
            Button{
                
            } label: {
                VStack{
                Image(product.images[0])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:130, height:200)
                    .cornerRadius(5)
                    .shadow(radius: 1)
                    
                    

                Text(product.title)
                    .font(Font.custom("Tenor Sans", size:12))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.BodyGrey)
                    .frame(width:165, alignment: .top)
                
                Text("\(product.price) EUR")
                    .font(Font.custom("Tenor Sans", size: 14))
                    .foregroundColor(Color.Default)                }
            }
        }
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product:product1)
    }
}
