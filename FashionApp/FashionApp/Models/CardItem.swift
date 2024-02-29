//
//  CardItem.swift
//  FashionApp
//
//  Created by THIS on 2/27/24.
//

import Foundation
 class CardItem{
     var product: Product
     var count: Int=0
     init(product: Product,count:Int) {
         self.product=product
         self.count=count
     }
 }
