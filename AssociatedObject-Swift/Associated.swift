//
//  Associated.swift
//  AssociatedObject-Swift
//
//  Created by PFei_He on 16/6/23.
//  Copyright © 2016年 PF-Lib. All rights reserved.
//

import ObjectiveC

private final class Lifted<T> {
    let value: T
    init(_ x: T) {
        value = x
    }
}

private func lift<T>(x: T) -> Lifted<T>  {
    return Lifted(x)
}

public func setAssociatedObject<T>(object: AnyObject, key: UnsafePointer<Void>, value: T, policy: objc_AssociationPolicy) {
    if let v: AnyObject = value as? AnyObject {
        objc_setAssociatedObject(object, key, v,  policy)
    } else {
        objc_setAssociatedObject(object, key, lift(value),  policy)
    }
}

public func getAssociatedObject<T>(object: AnyObject, key: UnsafePointer<Void>) -> T? {
    if let v = objc_getAssociatedObject(object, key) as? T {
        return v
    } else if let v = objc_getAssociatedObject(object, key) as? Lifted<T> {
        return v.value
    } else {
        return nil
    }
}
