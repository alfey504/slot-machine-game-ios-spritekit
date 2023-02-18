//
//  SpinReelDelegate.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-02-18.
//

import Foundation

protocol SpinReelDelegate: AnyObject {
    func animationCompleteOnReelNode(id: Int)
}

