//
//  BottomButtonView.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 08.08.2022.
//

import UIKit
import RxCocoa
import RxSwift

class BottomButtonView: UIView {
    var button = UIButton()
    
    func configure() {
        setUpButton()
        self.addSubview(button)
        setConstraints()
    }
    
    private func setUpButton() {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = UIColor(named: "blackAdaptive")
        configuration.baseForegroundColor = .systemBackground
        configuration.cornerStyle = .capsule
        configuration.title = "Add task"
        configuration.image = UIImage(systemName: "plus.app.fill")
        configuration.titlePadding = 6
        configuration.imagePadding = 6
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        button.configuration = configuration
        
        button.imageView?.layer.transform = CATransform3DMakeScale(0.8, 0.8, 0.8)
    }
    
    private func setConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalTo: self.heightAnchor),
            button.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
}
