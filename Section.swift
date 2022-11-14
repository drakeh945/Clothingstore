//
//  Section.swift
//  Clothing Store
//
//  Created by Drake Herring on 11/9/22.
//

import Foundation


struct Section:Hashable{
    let  id = UUID()
    let type: SectionType
    
    let title: String
    let subtitle: String
    let item: [Item]
    
    init (type:SectionType,title: String = "", subtitle: String = "", image: String = "", item: [Item] = []) {
        self.title = title
        self.subtitle = subtitle
        self.type = type
    self.item = item
    }

    enum ItemSectionType:String{
        case discovery
        case topgift
        case shopbrands
    }
        
    struct SectionType:RawRepresentable,Hashable{
        typealias RawValue = String
         var rawValue: String
        init(rawValue: String) {
            self.rawValue = rawValue
        }
            static let discovery = SectionType(rawValue:Section.ItemSectionType.discovery.rawValue)
    
    
     }
}
