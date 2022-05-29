//
//  Images.swift
//
//  Created by Edson Lima da Silva on 28/05/2022.
//

import SwiftUI

/**
 An enum to define a group of images and subgroups for SFSymbols and images stored in the bundle.
 
 All images initiating with "SF_" represent SFSymbols. The string after the SF_ suffix is the name of the SFSymbol.
 
 Images stored in the bundel.
 All images should be stored as a Template images, rendered as Single Scale.Images stored in the bundle.
 
    *Types*
 
  `Navigation:` Images used in navigation between views.
 
  `View:` Images used in inside views
 */
public enum Images: String, CaseIterable {

    //MARK: Images from SFSymbols
    // - Navigation
    case house = "SF_house.fill"
    case gear = "SF_gear"
    case back = "SF_chevron.backward"
    case forward = "SF_chevron.forward"
    case plus =  "SF_plus"
    
    // View
    case down = "SF_chevron.down"
    case cancel = "SF_multiply.circle.fill"
    case trash = "SF_trash.fill"
    case checked = "SF_checkmark.square.fill"
    case unchecked = "SF_square"
    case search = "SF_magnifyingglass"
    case sideBar = "noun_sidebar_2400097-L"
    case profile = "SF_person.circle.fill"
    case maintenance = "SF_wrench.and.screwdriver.fill"
    case questionmark = "SF_questionmark.square.fill"
    case avatar = "SF_person"
    case none = "SF_nosign"
    
    //MARK: Images stored in the bundle.
    case avatar1 = "avatar1"
    case avatar2 = "avatar2"
    case avatar3 = "avatar3"
    case avatar4 = "avatar4"
    case avatar5 = "avatar5"
    case avatar6 = "avatar6"
    
    // computed properties to generate the correct images
    var image: Image {
        rawValue.prefix(3) == "SF_" ?
        Image(systemName: String(rawValue.dropFirst(3)))
        :
        Image(rawValue, bundle: .module)
    }
}

public extension Images {
    
    /// shows a mirror image of an informed image. Used when ImageView receive the parameter ImageType  = .condition
    static let mirrorImages: [Images:Images] = [.unchecked: .checked]
     func mirror () -> Images
    { Images.mirrorImages[self] ?? Images.none }
}
