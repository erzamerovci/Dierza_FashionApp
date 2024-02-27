//
//  TrendingHashtagview.swift
//  FashionApp
//
//  Created by THIS on 2/26/24.
//

import SwiftUI

struct TrendingHashtagview: View {
    var body: some View {
        VStack{
            Text("Trending Hashtags")
                .padding(.top,30)
                .font(tenorSans(28))
                .foregroundColor(Color.black)
            
            Image("dividerrr")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(height:60)
                  .padding(.top,-35)
            
            HashtagsView(tags: hashtags)
                .padding([.leading,.trailing],55)
                .frame(width:400)
                .padding(.top,-20)
            
        }
        
    }
}

struct TrendingHashtagview_Previews: PreviewProvider {
    static var previews: some View {
        TrendingHashtagview()
    }
}
