//
//  Group.swift
//  
//
//  Created by Carson Katri on 9/4/19.
//

public struct Group: CSSBlock {
    public var children: [CSS]
    
    public init(@StylesheetBuilder _ body: () -> CSSBlock) {
        let built = body()
        if let container = built as? CSSContainer {
            children = container.children
        } else {
            children = [built]
        }
    }
    
    public init(@CSSBuilder _ body: () -> CSS) {
        let built = body()
        if let container = built as? CSSContainer {
            children = container.children
        } else {
            children = [built]
        }
    }
    
    public init(_ body: [CSS]) {
        children = body
    }
    
    public func string() -> String {
        children.map { $0.string() }.joined(separator: "\n")
    }
}
