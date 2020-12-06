//
//  File.swift
//  
//
//  Created by Jesse on 2020/12/06.
//

import SwiftUI

public struct JesseImageView<Placeholder: View>: View {
    @StateObject private var loader: JesseImageLoader
    private let placeholder: Placeholder
    private let image: (UIImage) -> Image
    
    public init(
        url: URL,
        @ViewBuilder placeholder: () -> Placeholder,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)
    ) {
        self.placeholder = placeholder()
        self.image = image
        _loader = StateObject(wrappedValue: JesseImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    }
    
    public var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                image(loader.image!)
            } else {
                placeholder
            }
        }
    }
}
