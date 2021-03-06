//
//  LayoutConstraintsBuilder.swift
//  NamadaLayout
//
//  Created by Nayanda Haberty (ID) on 27/08/20.
//

import Foundation
import UIKit

public protocol LayoutConstraintsBuilder: class {
    var constructedConstraints: [NSLayoutConstraint] { get set }
}

public protocol NamadaLayoutable: LayoutConstraintsBuilder {
    associatedtype View: UIView
    var view: View { get }
    var context: LayoutContext { get }
    @discardableResult
    func layoutContent(_ containerBuilder: (LayoutContainer<View>) -> Void) -> Self
    @discardableResult
    func top(_ relation: LayoutRelation<CGFloat>, to anchor: NSLayoutYAxisAnchor, priority: UILayoutPriority) -> Self
    @discardableResult
    func bottom(_ relation: LayoutRelation<CGFloat>, to anchor: NSLayoutYAxisAnchor, priority: UILayoutPriority) -> Self
    @discardableResult
    func left(_ relation: LayoutRelation<CGFloat>, to anchor: NSLayoutXAxisAnchor, priority: UILayoutPriority) -> Self
    @discardableResult
    func right(_ relation: LayoutRelation<CGFloat>, to anchor: NSLayoutXAxisAnchor, priority: UILayoutPriority) -> Self
    @discardableResult
    func top(_ relation: LayoutRelation<CGFloat>, to parent: ParentRelated, priority: UILayoutPriority) -> Self
    @discardableResult
    func bottom(_ relation: LayoutRelation<CGFloat>, to parent: ParentRelated, priority: UILayoutPriority) -> Self
    @discardableResult
    func left(_ relation: LayoutRelation<CGFloat>, to parent: ParentRelated, priority: UILayoutPriority) -> Self
    @discardableResult
    func right(_ relation: LayoutRelation<CGFloat>, to parent: ParentRelated, priority: UILayoutPriority) -> Self
    @discardableResult
    func centerX(_ relation: LayoutRelation<CGFloat>, to anchor: NSLayoutXAxisAnchor, priority: UILayoutPriority) -> Self
    @discardableResult
    func centerY(_ relation: LayoutRelation<CGFloat>, to anchor: NSLayoutYAxisAnchor, priority: UILayoutPriority) -> Self
    @discardableResult
    func centerX(_ relation: LayoutRelation<CGFloat>, to parent: ParentRelated, priority: UILayoutPriority) -> Self
    @discardableResult
    func centerY(_ relation: LayoutRelation<CGFloat>, to parent: ParentRelated, priority: UILayoutPriority) -> Self
    @discardableResult
    func height(_ relation: InterRelation<NSLayoutDimension>, multiplyBy multipier: CGFloat, constant: CGFloat, priority: UILayoutPriority) -> Self
    
    @discardableResult
    func width(_ relation: InterRelation<NSLayoutDimension>, multiplyBy multipier: CGFloat, constant: CGFloat, priority: UILayoutPriority) -> Self
    @discardableResult
    func height(_ relation: InterRelation<CGFloat>, priority: UILayoutPriority) -> Self
    @discardableResult
    func width(_ relation: InterRelation<CGFloat>, priority: UILayoutPriority) -> Self
    func height(_ relation: InterRelation<ParentRelated>, multiplyBy multipier: CGFloat, constant: CGFloat, priority: UILayoutPriority) -> Self
    func width(_ relation: InterRelation<ParentRelated>, multiplyBy multipier: CGFloat, constant: CGFloat, priority: UILayoutPriority) -> Self
}
