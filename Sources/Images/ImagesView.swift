//
//  ImagesView.swift
//
//  Created by Edson Lima da Silva on 28/05/2022.
//

import SwiftUI
import AllConstants

/***
 An enum that define types of images.
 */
public enum ImageType {
    case row, selection, header, conditional
}
 

/***
 A view that show images that uses types of images defined in the enum ImageType.

 Example of use:

 ImageView(type: .row, image: .avatar1)
 
*/
public struct ImageView: View {
    
    let type: ImageType
    let condition: Bool
    let image: Images
    
    /// Two required parameters are type and image. The condition have default value
    /// - Parameters:
    ///   - type: A enum representing the type of image used
    ///   - condition: A condition used to show a mirror of this image
    ///   - image: A enum representing the image used
    public init(
        type: ImageType,
        condition: Bool? = false,
        image: Images
    ) {
        self.type = type
        self.condition = condition ?? false
        self.image = image
    }
    
    public var body: some View {
        
        switch type {
        case .row, .header, .selection:
            regular
        case .conditional:
            conditional
        }
        
    }
    
}

public extension ImageView {
     var regular: some View {
         image.image
             .resize(size)
    }
    
     var conditional: some View {
         (condition ? image.image: image.mirror().image)
            .resize(size)
            .opacity(condition ? 1:0)
    }
}

public extension ImageView {

    private var size: Size {
        switch type {
        case .row:
            return Size.small
        case .conditional:
            return Size.small
        case .header:
            return Size.medium
        case .selection:
            return Size.large
        }
    }
}

public extension Image {
    
    /// Renders an image using the parameter size, wich is one of Size types
    /// One required parameter  (width) and one parameter (height) with default value=width
    /// - Parameters:
    ///   - width: The width of the image
    ///   - height: The height  of the image
    ///
     func resize(_ width: Size, _ height: Size? = nil) -> some View {
        if height != nil {
            return self
                .resizable()
                .interpolation(.high)
                .aspectRatio(contentMode: .fit)
                .frame(width: width.rawValue, height: height?.rawValue)
        }
        return self
            .resizable()
            .interpolation(.high)
            .aspectRatio(contentMode: .fit)
            .frame(width: width.rawValue, height: width.rawValue)
    }

}
