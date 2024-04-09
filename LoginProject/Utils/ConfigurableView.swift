//
//  ConfigurableView.swift
//  LoginProject
//
//  Created by Vinícius dos Reis on 28/03/24.
//

import UIKit

protocol ConfigurableView {
    associatedtype T
    @discardableResult func with(_ configure: (T) -> Void) -> T
}

extension ConfigurableView where Self: UIView {
    @discardableResult func with(_ configure: (Self) -> Void) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        configure(self)
        return self
    }
}

extension UIView: ConfigurableView {
    typealias T = UIView
    
    func applyGradient(colors: [UIColor], startPoint: CGPoint = CGPoint(x: 0.4, y: 0.0), endPoint: CGPoint = CGPoint(x: 0.5, y: 0.8)) {
            // Remove gradient layer se já existir
            layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }

            // Crie um gradiente layer
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = bounds
            gradientLayer.colors = colors.map { $0.cgColor }
            gradientLayer.startPoint = startPoint
            gradientLayer.endPoint = endPoint

            // Adicione o gradiente layer como sublayer
            layer.insertSublayer(gradientLayer, at: 0)
        }
}
