//
//  AssociatedObject.swift
//  AssociatedObject-Swift
//
//  Created by PFei_He on 16/6/23.
//  Copyright © 2016年 PF-Lib. All rights reserved.
//

import Foundation

extension NSObject {
    private struct associatedKey {
        static var key: String!
    }
    var associatedObject: String {
        get {
            return getAssociatedObject(self, key: &associatedKey.key)!
        } set {
            setAssociatedObject(self, key: &associatedKey.key, value: newValue, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
