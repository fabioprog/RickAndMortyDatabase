//
//  UIViewExtension.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 11/08/23.
//

import UIKit

public enum AnchorType {
    case equal
    case greaterOrEqual
    case lessOrEqual
}

extension UIView {
    static var loadingViewTag = 1000
    
    func showLoadingView() {
        if let _ = viewWithTag(UIView.loadingViewTag) { return }
        
        let view = UIView()
        view.tag = UIView.loadingViewTag
        view.backgroundColor = backgroundColor?.withAlphaComponent(0.7)
        
        addSubview(view)
        view.topAnchor(to: self.topAnchor)
            .bottomAnchor(to: self.bottomAnchor)
            .leftAnchor(to: self.leftAnchor)
            .rightAnchor(to: self.rightAnchor)
        
        
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = RMColorAsset.primaryText.color
        activityIndicator.hidesWhenStopped = true
       
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor(to: view.centerXAnchor)
            .centerYAnchor(to: view.centerYAnchor)
        
        activityIndicator.startAnimating()
    }
        
    func hideLoadingView() {
        if let loadingView = viewWithTag(UIView.loadingViewTag) {
            UIView.animate(withDuration: 0.2, animations: {
                loadingView.alpha = 0.0
            }) { _ in
                loadingView.removeFromSuperview()
            }
        }
    }
    
    @discardableResult public func topAnchor(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, type: AnchorType = .equal, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        var constraint: NSLayoutConstraint!
        switch type {
        case .equal:
            constraint = topAnchor.constraint(equalTo: anchor, constant: constant)
        case .greaterOrEqual:
            constraint = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessOrEqual:
            constraint = topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        }
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult public func bottomAnchor(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, type: AnchorType = .equal, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        var constraint: NSLayoutConstraint!
        switch type {
        case .equal:
            constraint = bottomAnchor.constraint(equalTo: anchor, constant: -constant)
        case .greaterOrEqual:
            constraint = bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -constant)
        case .lessOrEqual:
            constraint = bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: -constant)
        }
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult public func leftAnchor(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, type: AnchorType = .equal, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        var constraint: NSLayoutConstraint!
        switch type {
        case .equal:
            constraint = leftAnchor.constraint(equalTo: anchor, constant: constant)
        case .greaterOrEqual:
            constraint = leftAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessOrEqual:
            constraint = leftAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        }
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult public func rightAnchor(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, type: AnchorType = .equal, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        var constraint: NSLayoutConstraint!
        switch type {
        case .equal:
            constraint = rightAnchor.constraint(equalTo: anchor, constant: -constant)
        case .greaterOrEqual:
            constraint = rightAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -constant)
        case .lessOrEqual:
            constraint = rightAnchor.constraint(lessThanOrEqualTo: anchor, constant: -constant)
        }
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult public func widthAnchor(_ constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult public func heightAnchor(_ constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult public func centerXAnchor(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, type: AnchorType = .equal, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        var constraint: NSLayoutConstraint!
        switch type {
        case .equal:
            constraint = centerXAnchor.constraint(equalTo: anchor, constant: constant)
        case .greaterOrEqual:
            constraint = centerXAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessOrEqual:
            constraint = centerXAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        }
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    @discardableResult public func centerYAnchor(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, type: AnchorType = .equal, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        var constraint: NSLayoutConstraint!
        switch type {
        case .equal:
            constraint = centerYAnchor.constraint(equalTo: anchor, constant: constant)
        case .greaterOrEqual:
            constraint = centerYAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessOrEqual:
            constraint = centerYAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        }
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
