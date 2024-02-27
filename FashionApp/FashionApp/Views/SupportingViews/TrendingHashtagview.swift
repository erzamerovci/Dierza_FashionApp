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
                .font(tenorSans(28))
                .foregroundColor(Color.black)
                
            HashtagsView(tags: hashtags)
                .padding([.leading,.trailing],30)
                .frame(width:400)
        }
        
    }
}

struct TrendingHashtagview_Previews: PreviewProvider {
    static var previews: some View {
        TrendingHashtagview()
    }
}
